package com.gd.safari.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskService;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskController {
	@Autowired private ITaskService taskService;
	
	// 프로젝트 번호에 맞는 업무 조회
	@PostMapping("/safari/task")
	public List<Task> task(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		
		// 서비스호출
		// 리턴값 List<Task>
		List<Task> tasks = taskService.getTaskByProjectNo((int)session.getAttribute("projectNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 업무 개수 : " + tasks.size());
		
		return tasks;
	}
	
	// 프로젝트번호 + 나에게 배정된 업무
	@PostMapping("/safari/myTask")
	public List<Task> myTask(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호 + 나에게 배정된 업무 조회");
		
		// param가공
		Map<String, Object> m = new HashMap<>();
		m.put("workMemberNo", (int)session.getAttribute("workMemberNo"));
		
		// 서비스호출
		// 리턴값 List<Task>
		List<Task> tasks = taskService.getTask(m);
		
		log.debug(TeamColor.CSH + "조회에 따른 업무 개수 : " + tasks.size());
		
		return tasks;
	}
	
	// 업무 복사를 위한 객체 받기
	@GetMapping("/safari/getTask")
	public Task getTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 복사를 위한 객체 받기");
		
		Task task = taskService.getTaskForCopy(taskNo);
		
		log.debug(TeamColor.CSH + "복사할 객체 : " + task);
		
		return task;
	}
	
	// 복사업무 생성
	@PostMapping("/safari/copyTask")
	public String copyTask(HttpSession session, @RequestParam(value = "task", required = false) String task) {
		log.debug(TeamColor.CSH + this.getClass() + " 복사업무 생성");
		
		// 디버깅
		log.debug(TeamColor.CSH + "파싱 전 : " + task);

		// 파라미터 가공 (파싱)
		Task copyTask = new Task();
        try {
            // reader를 Object로 parse
            JSONParser parser = new JSONParser();
			Object obj = parser.parse(task);
			// obj를 우선 JSONObject에 담음
			JSONObject jsonObj = (JSONObject) obj;
			
			// task에 담기
			copyTask.setTaskTitle(jsonObj.get("taskTitle") == null ? "" : jsonObj.get("taskTitle").toString());
			copyTask.setTaskContent(jsonObj.get("taskContent") == null ? "" : jsonObj.get("taskContent").toString());
			copyTask.setTaskStart(jsonObj.get("taskStart") == null ? "" : jsonObj.get("taskStart").toString());
			copyTask.setTaskDeadline(jsonObj.get("taskDeadline") == null ? "" : jsonObj.get("taskDeadline").toString());
			copyTask.setTaskEnd(jsonObj.get("taskEnd") == null ? "" : jsonObj.get("taskEnd").toString());
			copyTask.setTaskPoint(jsonObj.get("taskPoint") == null ? "" : jsonObj.get("taskPoint").toString());
			copyTask.setTaskWriter((String)session.getAttribute("login"));
			copyTask.setTasklistNo(Integer.parseInt(jsonObj.get("tasklistNo").toString()));
			
	
		} catch (Exception e) {
			e.printStackTrace();	
			throw new RuntimeException();
		}
		

		// 디버깅
		log.debug(TeamColor.CSH + "파싱 후 : " + copyTask);
        
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.addTaskForCopy(copyTask);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무 상세보기
	@GetMapping("/safari/taskDetail")
	public Map<String, Object> taskDetail(int taskNo){
		log.debug(TeamColor.CSH + this.getClass() + " 업무 상세보기");
		
		// 서비스호출
		// 리턴값 Map<String, Object>
		Map<String, Object> task = taskService.getTaskByTaskNo(taskNo);
		
		log.debug(TeamColor.CSH + "업무 상세내용 : " + task);
		
		return task;
	}
	
	// 프로젝트 리스트
	@PostMapping("/safari/projectListByTask")
	public List<Project> projectListByTask(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 리스트");
		
		// 서비스호출
		// 리턴값 List<Project>
		List<Project> projectList = taskService.getProjectTitleAndNoByWorkspaceNo((int)session.getAttribute("workNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 프로젝트 개수 : " + projectList.size());
		
		return projectList;
	}
	
	// 현재위치 제외 업무리스트 조회
	@PostMapping("/safari/taskListByTask")
	public List<TaskList> taskListByTask(int projectNo, int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 리스트");
		// 디버깅
		log.debug(TeamColor.CSH + "tasklistNo : " + tasklistNo + "projectNo : " + projectNo);
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("projectNo", projectNo);
		m.put("tasklistNo", tasklistNo);
		
		// 서비스호출
		// 리턴값 List<Project>
		List<TaskList> taskList = taskService.getTaskListByUpdateLocation(m);
		
		log.debug(TeamColor.CSH + "조회에 따른 업무리스트 개수 : " + taskList.size());
		
		return taskList;
	}
	
	// 업무 생성
	@PostMapping("/safari/insertTask")
	public String insertTask(HttpSession session, Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 생성");
		// 디버깅
		log.debug(TeamColor.CSH + task);
		
		// 세션값에 있는 작성자 task VO에 setter로 담기
		task.setTaskWriter((String) session.getAttribute("login"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.addTask(task);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무 위치 변경
	@PostMapping("/safari/updateTaskLocation")
	public String updateTaskLocation(int tasklistNo, int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 위치 변경");
		// 디버깅
		log.debug(TeamColor.CSH + "tasklistNo : " + tasklistNo + "taskNo : " + taskNo);
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("tasklistNo", tasklistNo);
		m.put("taskNo", taskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.modifyTaskLocation(m);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무 완료
	@PostMapping("/safari/completeTask")
	public String completeTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 완료");
		// 디버깅
		log.debug(TeamColor.CSH + taskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.modifyCompleteTask(taskNo);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무 완료취소
	@PostMapping("/safari/cancelEndTask")
	public String cancelEndTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 취소");
		// 디버깅
		log.debug(TeamColor.CSH + taskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.modifyCancelEndTask(taskNo);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 업무 삭제
	@PostMapping("/safari/deleteTask")
	public String deleteTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + taskNo);
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskService.removeTask(taskNo);
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(row != 0) { // 성공
			jsonStr = "ok";
		} else { // 실패
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
}
