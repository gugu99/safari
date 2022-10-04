package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.ITaskListMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskService implements ITaskService {
	@Autowired private ITaskMapper taskMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private ITaskListMapper taskListMapper;
	@Autowired private IProjectMapper projectMapper;

	// 캘린더에서 사용할 메서드
	@Override
	public List<Map<String, Object>> getTaskListForCalendar(int workMemberNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 캘린더에서 사용할 메서드 - 업무 조회");
		// 업무 별 랜덤 컬러 배열
		String[] colors = {"#967ADC", "#37BC9B", "#F6BB42", "#DA4453", "#3BAFDA"};
		List<Map<String, Object>> list = taskMapper.selectTaskListForCalendar(workMemberNo);
		
		// 업무 별 랜덤 색으로 나타낸다.
		for (Map<String, Object> map : list) {
			int tmp = (int)(Math.random() * colors.length);
			map.put("color", colors[tmp]);
		}
		
		log.debug(TeamColor.GDE + list);

		
		return list;
	}
	////////////////////////////////////////////////////////////// END : 조원을 위한 메서드 
	
	
	// 프로젝트 번호에 맞는 업무 조회
	@Override
	public List<Task> getTaskByProjectNo(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		return taskMapper.selectTaskByProjectNo(m);
	}

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
	@Transactional
	public int modifyTaskLocation(int tasklistNo, int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 위치변경");
		
		// 가져온 업무멤버 조회
		List<TaskMember> oldMember = taskMemberMapper.selectTaskMemberByTaskNo(taskNo);
		
		log.debug(TeamColor.CSH + oldMember);

		// 메서드 실행
		// 멤버 삭제 후 이동
		for(TaskMember t : oldMember) {
			taskMemberMapper.deleteTaskMember(t);
		}
		
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
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제");
		return taskMapper.deleteTask(taskNo);
	}
}
