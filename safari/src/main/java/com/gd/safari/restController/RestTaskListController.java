package com.gd.safari.restController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.ITaskListService;
import com.gd.safari.vo.CopyTaskList;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestTaskListController {
	@Autowired private ITaskListService taskListService;
	
	// 업무리스트 조회
	@PostMapping("/safari/taskList")
	public List<TaskList> taskList(HttpSession session) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 조회");
		
		// 서비스 호출
		// 리턴값 List<TaskList>
		List<TaskList> taskList = taskListService.getTaskList((int)session.getAttribute("projectNo"));
		
		log.debug(TeamColor.CSH + "조회에 따른 업무리스트 개수 : " + taskList.size());
		
		return taskList;
	}		
	
	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	@PostMapping("/safari/projectNameBytaskListNo")
	public String projectNameBytaskListNo(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 현재 프로젝트 이름 조회");
		
		// 서비스 호출
		// 리턴값 String
		String projectName = taskListService.getProjectNameByTasklistNo(tasklistNo);

		log.debug(TeamColor.CSH + "현재 프로젝트 이름 조회 : " + projectName);

		return projectName;
	}
	
	// 업무리스트 복사
	@GetMapping("/safari/copyTaskList")
	public CopyTaskList copyTaskList(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 복사");
		
		// 서비스 호출
		// 리턴값 List<CopyTaskList>
		CopyTaskList copyTaskList = taskListService.getTaskListAndTaskForCopy(tasklistNo);

		log.debug(TeamColor.CSH + "업무리스트 복사본 조회 : " + copyTaskList);

		return copyTaskList;
	}
	
	// 복사업무리스트 생성
	@PostMapping("/member/copyTaskList")
	public String copyTaskList(HttpSession session, @RequestParam(value = "copyTaskList", required = false) String copyTaskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 복사업무리스트 생성");
		
		// 디버깅
		log.debug(TeamColor.CSH + "파싱 전 : " + copyTaskList);

		// 파라미터 가공 (파싱)
		CopyTaskList copy = new CopyTaskList();
        try {
            // reader를 Object로 parse
            JSONParser parser = new JSONParser();
			Object obj = parser.parse(copyTaskList);
			// obj를 우선 JSONObject에 담음
			JSONObject jsonObj = (JSONObject) obj;
			
			// 객체에 담기
			copy.setProjectNo(Integer.parseInt(jsonObj.get("projectNo").toString()));
			copy.setTasklistNo(Integer.parseInt(jsonObj.get("tasklistNo").toString()));
			copy.setTasklistTitle(jsonObj.get("tasklistTitle").toString());
			
			// 업무
			List<Task> task = new ArrayList<>();
			JSONArray jsonArr = (JSONArray)jsonObj.get("task");
			if(jsonArr != null) {
				for(int i = 0; i < jsonArr.size(); i++) {
					// 파싱객체에 담기
					jsonObj = (JSONObject) jsonArr.get(i);
					
					// 업무에 다시 담기
					Task t = new Task();
					t.setTaskTitle(jsonObj.get("taskTitle") == null ? "" : jsonObj.get("taskTitle").toString());
					t.setTaskContent(jsonObj.get("taskContent") == null ? "" : jsonObj.get("taskContent").toString());
					t.setTaskStart(jsonObj.get("taskStart") == null ? "" : jsonObj.get("taskStart").toString());
					t.setTaskDeadline(jsonObj.get("taskDeadline") == null ? "" : jsonObj.get("taskDeadline").toString());
					t.setTaskEnd(jsonObj.get("taskEnd") == null ? "" : jsonObj.get("taskEnd").toString());
					t.setTaskPoint(jsonObj.get("taskPoint") == null ? "" : jsonObj.get("taskPoint").toString());
					t.setTaskWriter((String)session.getAttribute("login"));
					
					// 리스트에 추가
					task.add(t);
				}
			}
			
			// 업무 객체에 담기
			copy.setTask(task);
			
		} catch (Exception e) {
			e.printStackTrace();	
			throw new RuntimeException();
		}

		// 디버깅
		log.debug(TeamColor.CSH + "파싱 후 : " + copy);
        
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("copyTaskList", copy);
		m.put("workMemberName", session.getAttribute("workMemberName"));
        
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.addCopyTaskList(m);
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
		
	// 업무리스트 생성
	@PostMapping("/member/insertTaskList")
	public String insertTaskList(HttpSession session, TaskList taskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 생성");
		
		// 디버깅
		log.debug(TeamColor.CSH + taskList);
		
		// 프로젝트 번호 넣기
		taskList.setProjectNo((int)session.getAttribute("projectNo"));
		
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("taskList", taskList);
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.addTaskList(m);
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
	
	// 업무리스트 수정
	@PostMapping("/member/updateTaskList")
	public String updateTaskList(HttpSession session, TaskList taskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 수정");
		
		// 프로젝트 번호 넣기
		taskList.setProjectNo((int)session.getAttribute("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + taskList);

		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("taskList", taskList);
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.modifyTaskList(m);
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

	// 업무리스트 위치변경 - tasklistNo, projectNo가 필요하다
	@PostMapping("/member/updateTaskListLocation")
	public String updateTaskListLocation(HttpSession session, int projectNo, int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 위치변경");
		// 디버깅
		log.debug(TeamColor.CSH + "projectNo : " + projectNo + " tasklistNo : " + tasklistNo);
		
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("oldProjectNo", session.getAttribute("projectNo"));
		m.put("projectNo", projectNo);
		m.put("tasklistNo", tasklistNo);
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.modifyTaskListLocation(m);
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
	
	// 업무리스트 삭제
	@PostMapping("/member/deleteTaskList")
	public String deleteTaskList(HttpSession session, int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 삭제");
		// 디버깅
		log.debug(TeamColor.CSH + tasklistNo);
		
		// 파라미터 파싱
		Map<String, Object> m = new HashMap<>();
		m.put("projectNo", session.getAttribute("projectNo"));
		m.put("tasklistNo", tasklistNo);
		m.put("workMemberName", session.getAttribute("workMemberName"));
		
		// 서비스 호출
		// 리턴값 int - 0일 경우 실행되지 않음
		int row = taskListService.removeTaskList(m);
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
