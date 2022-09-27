package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskListMapper;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.CopyTaskList;
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
	
	// 업무리스트 조회
	@Override
	public List<TaskList> getTaskList(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 보여주기");
		
//		// 받아온 검색이 한글일 경우 파싱
//		if(m.get("search") != null) {
//			subStringBytes((String)m.get("search"), 10, 3);
//			
//			log.debug(TeamColor.CSH + subStringBytes((String)m.get("search"), 10, 3));
//		}
		return taskListMapper.selectTaskList(m);
	}

	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	@Override
	public String getProjectNameByTasklistNo(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 현재 프로젝트 이름 조회");
		return taskListMapper.selectProjectNameByTasklistNo(tasklistNo);
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
	public int addCopyTaskList(CopyTaskList copyTaskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 복사생성");
		// 업무리스트와 업무로 나누기
		// 업무리스트
		TaskList taskList = new TaskList();
		taskList.setProjectNo(copyTaskList.getProjectNo());
		taskList.setTasklistTitle(copyTaskList.getTasklistTitle());
		// 업무
		List<Task> task = copyTaskList.getTask();
		
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
	public int addTaskList(TaskList taskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 생성");
		return taskListMapper.insertTaskList(taskList);
	}

	// 업무리스트 수정
	@Override
	public int modifyTaskList(TaskList taskList) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 수정");
		
		// 저장을 위해 엔터를 누르는데, 엔터로 넘어온 <div><br></div>값은 없애고 객체에 저장하기
		taskList.setTasklistTitle(taskList.getTasklistTitle().replaceAll("<div><br></div>", ""));
		
		return taskListMapper.updateTaskList(taskList);
	}

	// 업무리스트 위치변경 - tasklistNo, projectNo가 필요하다
	@Override
	public int modifyTaskListLocation(int projectNo, int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 위치변경");
		
		// 현재 업무리스트에 있는 멤버 찾기
		List<TaskMember> taskMember = taskMemberMapper.selectTaskMemberByTaskListNo(tasklistNo);
		
		// 멤버 삭제 후
		for(TaskMember tm : taskMember) {
			taskMemberMapper.deleteTaskMember(tm);
		}
		// 파라미터 값 가공
		Map<String, Integer> m = new HashMap<>();
		m.put("projectNo", projectNo);
		m.put("tasklistNo", tasklistNo);
		
				
		return taskListMapper.updateTaskListLocation(m);
	}

	// 업무리스트 삭제
	@Override
	public int removeTaskList(int tasklistNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무리스트 삭제");
		return taskListMapper.deleteTaskList(tasklistNo);
	}
	
	// 한글 byte로 자르기
//	public String subStringBytes(String str, int byteLength, int sizePerLetter) {
//		int retLength = 0;
//		int tempSize = 0;
//		int asc;
//		if (str == null || "".equals(str) || "null".equals(str)) {
//			str = "";
//		}
//
//		int length = str.length();
//
//		for (int i = 1; i <= length; i++) {
//			asc = (int) str.charAt(i - 1);
//			if (asc > 127) {
//				if (byteLength >= tempSize + sizePerLetter) {
//					tempSize += sizePerLetter;
//					retLength++;
//				}
//			} else {
//				if (byteLength > tempSize) {
//					tempSize++;
//					retLength++;
//				}
//			}
//		}
//
//		return str.substring(0, retLength);
//	}
}
