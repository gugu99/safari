package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILogMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.ITaskListMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.CopyTaskList;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskListService implements ITaskListService {
	@Autowired private ITaskListMapper taskListMapper;
	@Autowired private ITaskMapper taskMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private IProjectMapper projectMapper;
	@Autowired private ILogMapper logMapper;
	
	// 업무리스트 조회
	@Override
	public List<TaskList> getTaskList(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 보여주기");
		return taskListMapper.selectTaskList(projectNo);
	}

	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	@Override
	public String getProjectNameByTasklistNo(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)");
		return taskListMapper.selectProjectNameByTasklistNo(tasklistNo);
	}

	// 현재 프로젝트 이름 조회 (tasklist.jsp에서 보여주기 위해)
	@Override
	public String getProjectName(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 현재 프로젝트 이름 조회 (tasklist.jsp에서 보여주기 위해)");
		Project project = projectMapper.selectProjectDetailByProjectNo(projectNo);
		return project.getProjectName();
	}
	
	// 업무리스트 복사
	@Override
	public CopyTaskList getTaskListAndTaskForCopy(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 복사");
		
		CopyTaskList result = taskListMapper.selectTaskListAndTaskForCopy(tasklistNo);
		
		if(result == null) {
			result = taskListMapper.selectTaskListForCopy(tasklistNo);
		}
		return result;
	}
	
	// 업무리스트 복사생성
	@Override
	public int addCopyTaskList(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 복사생성");
		
		// 파라미터 해체
		CopyTaskList copyTaskList = (CopyTaskList) m.get("copyTaskList");
		
		// 업무리스트와 업무로 나누기
		// 업무리스트
		TaskList taskList = new TaskList();
		taskList.setProjectNo(copyTaskList.getProjectNo());
		taskList.setTasklistTitle(copyTaskList.getTasklistTitle());
		// 업무
		List<Task> task = copyTaskList.getTask();
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskList.getTasklistTitle() + "' 업무리스트를 새로 생성했습니다.");
		logM.put("projectNo", taskList.getProjectNo());
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 1. 로그 처리하기
		logMapper.insertLog(logM);
		
		// 2. 서비스 처리하기
		// 업무리스트 먼저 만들기
		int row = taskListMapper.insertTaskList(taskList);
		
		// 업무리스트 생성과 동시에 업무리스트번호 받기
		log.debug(TeamColor.CSH + taskList.getTasklistNo());
		
		// 그 후 안에 있는 업무 만들기
		if(task != null) {
			// 업무 개수만큼 추가해주기
			for(Task t : task) {
				// 업무리스트 설정해주기
				t.setTasklistNo(taskList.getTasklistNo());
				// 추가 메서드
				taskMapper.insertTaskForCopy(t);
			}
		}
		
		return row;
	}
	
	// 업무리스트 생성
	@Override
	public int addTaskList(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 생성");
		
		// 파라미터 해체
		TaskList taskList = (TaskList) m.get("taskList");
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskList.getTasklistTitle() + "' 업무리스트를 새로 생성했습니다.");
		logM.put("projectNo", taskList.getProjectNo());
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 로그 처리하기
		logMapper.insertLog(logM);
		
		// 서비스 처리하기
		return taskListMapper.insertTaskList(taskList);
	}

	// 업무리스트 수정
	@Override
	public int modifyTaskList(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 수정");
		
		// 파라미터 해체
		TaskList taskList = (TaskList) m.get("taskList");
		
		// 저장을 위해 엔터를 누르는데, 엔터로 넘어온 <div><br></div>값은 없애고 객체에 저장하기
		taskList.setTasklistTitle(taskList.getTasklistTitle().replaceAll("<div><br></div>", ""));
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 업무리스트 이름을 '" + taskList.getTasklistTitle() + "'(으)로 수정했습니다.");
		logM.put("projectNo", taskList.getProjectNo());
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 로그 처리하기
		logMapper.insertLog(logM);

		// 서비스 처리하기
		return taskListMapper.updateTaskList(taskList);
	}

	// 업무리스트 위치변경 - tasklistNo, projectNo가 필요하다
	@Override
	public int modifyTaskListLocation(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 위치변경");
		
		// 현재 업무리스트에 있는 멤버 찾기
		List<TaskMember> taskMember = taskMemberMapper.selectTaskMemberByTaskListNo((int) m.get("tasklistNo"));
		
		// 멤버 삭제 후
		for(TaskMember tm : taskMember) {
			taskMemberMapper.deleteTaskMember(tm);
		}
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		// 1. 이전 로그에 남기기 (프로젝트 변경)
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskListMapper.selectTaskListTitleForLog((int) m.get("tasklistNo")) + "' 업무리스트를 이동시켰습니다.");
		logM.put("projectNo", m.get("oldProjectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);
		
		logMapper.insertLog(logM);
		
		// 2. 이후 로그에 남기기 (프로젝트 변경)
		logM.put("projectNo", m.get("projectNo"));
		
		// 디버깅
		log.debug(TeamColor.CSH + logM);

		logMapper.insertLog(logM);	
		
		// 3. 서비스 처리하기
		return taskListMapper.updateTaskListLocation(m);
	}

	// 업무리스트 삭제
	@Override
	public int removeTaskList(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 삭제");
		
		// 로그 파라미터 만들기
		Map<String, Object> logM = new HashMap<>();
		logM.put("logContent", m.get("workMemberName") + " 님이 '" + taskListMapper.selectTaskListTitleForLog((int) m.get("tasklistNo")) + "' 업무리스트를 삭제했습니다.");
		logM.put("projectNo", m.get("projectNo"));

		// 디버깅
		log.debug(TeamColor.CSH + logM);
		// 로그 처리하기
		logMapper.insertLog(logM);
		
		return taskListMapper.deleteTaskList((int) m.get("tasklistNo"));
	}
}
