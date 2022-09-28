package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILowerTaskMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.ITaskListMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskService implements ITaskService {
	@Autowired private ITaskMapper taskMapper;
	@Autowired private ILowerTaskMapper lowerTaskMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private ITaskListMapper taskListMapper;
	@Autowired private IProjectMapper projectMapper;

	// 프로젝트 번호에 맞는 업무 조회
	@Override
	public List<Task> getTaskByProjectNo(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		return taskMapper.selectTaskByProjectNo(m);
	}

	// 업무리스트 번호에 맞는 업무 조회
//	@Override
//	public List<Task> getTaskByTasklistNo(int tasklistNo) {
//		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 번호에 맞는 업무 조회");
//		return taskMapper.selectTaskByTasklistNo(tasklistNo);
//	}

	// 상세 보기
	@Override
	public Map<String, Object> getTaskByTaskNo(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 상세 보기");
		return taskMapper.selectTaskByTaskNo(taskNo);
	}

	// 프로젝트 리스트 가져오기 (위치/하위업무 설정할 때 필요 - IProjectMapper에서 가져옴)
	@Override
	public List<Project> getProjectTitleAndNoByWorkspaceNo(int workNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 리스트 가져오기");
		return projectMapper.selectProjectTitleAndNoByWorkspaceNo(workNo);
	}

	// 현재위치 제외 업무리스트 조회 (업무 위치 변경을 위해 - ITaskListMapper에서 가져옴 - projectNo, tasklistNo 필요함)
	@Override
	public List<TaskList> getTaskListByUpdateLocation(Map<String, Integer> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 현재위치 제외 업무리스트 조회");
		return taskListMapper.selectTaskListByUpdateLocation(m);
	}

	// 업무 복사를 위한 객체 받기
	@Override
	public Task getTaskForCopy(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 복사를 위한 객체 받기");
		return taskMapper.selectTaskForCopy(taskNo);
	}
	
	// 업무 복사
	@Override
	public int addTaskForCopy(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 복사");
		return taskMapper.insertTaskForCopy(task);
	}

	// 업무 생성
	@Override
	public int addTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 생성");
		return taskMapper.insertTask(task);
	}
	
	// 업무 수정
	@Override
	public int modifyTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 수정");
		return taskMapper.updateTask(task);
	}

	// 업무 위치변경 - taskNo, tasklistNo 필요함
	@Override
	public int modifyTaskLocation(int tasklistNo, int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 위치변경");
		// 새로 갈 곳의 멤버 조회
		/*List<Map<String, Object>> newMember = taskMemberMapper.selectTaskMemberByTaskListNo(tasklistNo);
		// 가져온 업무멤버 조회
		List<Map<String, Object>> oldMember = taskMemberMapper.selectTaskMemberByTaskNo(taskNo);
		List<TaskMember> temp = new ArrayList<>();
		
		log.debug(TeamColor.CSH + newMember);
		log.debug(TeamColor.CSH + oldMember);
		
		// 같으면 담기
		for(Map<String, Object> n : newMember) {
			for(Map<String, Object> o : oldMember) {
				if(n.get("workMemberNo") == o.get("workMemberNo")) {
					
				}
			}
		}
		// 가공
		TaskMember t = new TaskMember();
		t.setTaskNo((int) o.get("taskNo"));
		t.setTaskNo((int) o.get("projectMemberNo"));
		// 메서드 실행
		taskMemberMapper.deleteTaskMember(t);*/
		// 멤버 삭제 후 이동
		//taskMemberMapper.deleteTaskMemberByTaskNo(taskNo);
		
		// param 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("tasklistNo", tasklistNo);
		m.put("taskNo", taskNo);
		
		
		return taskMapper.updateTaskLocation(m);
	}

	// 업무 완료
	@Override
	public int modifyCompleteTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 완료");
		return taskMapper.updateCompleteTask(taskNo);
	}

	// 업무 완료취소
	@Override
	public int modifyCancelEndTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 완료취소");
		return taskMapper.updateCancelEndTask(taskNo);
	}
	
	// 업무 삭제
	@Override
	public int removeTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제 (업무멤버도 함께 삭제)");
		
		// 업무를 삭제할 시 같이 삭제될 업무멤버삭제 (부모 삭제 시 자식 삭제)
		int row = taskMemberMapper.deleteTaskMemberByTaskNo(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (멤버가 여러명일 수 있기때문에)
		log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 업무멤버삭제 : " + row);

		// 업무를 삭제할 시 같이 삭제될 하위업무의 하위업무의 업무멤버 삭제 (부모 삭제 시 자식의 자식의 자식의 자식 삭제) 
		int row1 = taskMemberMapper.deleteLowerLowerTaskMemberByTaskNo(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (하위업무가 여러명일 수 있기때문에)
		log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 하위업무의 업무멤버 삭제 : " + row1);
		
		// 업무를 삭제할 시 같이 삭제될 하위업무의 하위업무 삭제 (부모 삭제 시 자식의 자식 삭제)
		int row2 = lowerTaskMapper.deleteLowerLowerTask(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (하위업무가 여러명일 수 있기때문에)
		log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 하위업무의 하위업무 삭제 : " + row2);

		// 업무를 삭제할 시 같이 삭제될 하위업무의 업무멤버 삭제 (부모 삭제 시 자식의 자식의 자식 삭제) 
		int row3 = taskMemberMapper.deleteLowerTaskMemberByTaskNo(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (하위업무가 여러명일 수 있기때문에)
		log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 하위업무의 업무멤버 삭제 : " + row3);
		
		// 업무를 삭제할 시 같이 삭제될 하위업무 삭제 (부모 삭제 시 자식 삭제)
		int row4 = lowerTaskMapper.deleteLowerTask(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (하위업무가 여러명일 수 있기때문에)
		log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 하위업무 삭제 : " + row4);
	
		
		return taskMapper.deleteTask(taskNo);
	}
}
