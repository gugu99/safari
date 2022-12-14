package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Project;
import com.gd.safari.vo.Task;
import com.gd.safari.vo.TaskList;

public interface ITaskService {
	// 캘린더에서 사용할 메서드
	List<Map<String, Object>> getTaskListForCalendar(int workMemberNo);
	////////////////////////////////////////////////////////////// END : 조원을 위한 메서드 
	
	
	// 프로젝트 번호에 맞는 업무 조회
	List<Task> getTaskByProjectNo(Map<String, Object> m);
	// 상세 보기
	Map<String, Object> getTaskByTaskNo(int taskNo);
	// 프로젝트 리스트 가져오기 (위치/하위업무 설정할 때 필요 - IProjectMapper에서 가져옴)
	List<Project> getProjectTitleAndNoByWorkspaceNo(int workNo);
	// 현재위치 제외 업무리스트 조회 (업무 복사를 위해 - ITaskListMapper에서 가져옴)
	List<TaskList> getTaskListByCopy(int projectNo);
	// 현재위치 제외 업무리스트 조회 (업무 위치 변경을 위해 - ITaskListMapper에서 가져옴 - projectNo, tasklistNo 필요함)
	List<TaskList> getTaskListByUpdateLocation(Map<String, Integer> m);
	// 업무 이름 가져오기 (로그를 위해 / 상위업무 표시에도 사용)
	String getTaskTitleForUpperTask(int taskNo);
	// 업무 복사를 위한 객체 받기
	Task getTaskForCopy(int taskNo);
	// 업무 복사
	int addTaskForCopy(Map<String, Object> m);
	// 업무 생성
	int addTask(Map<String, Object> m);
	// 업무 수정
	int modifyTask(Map<String, Object> m);
	// 업무 위치변경 - taskNo, tasklistNo 필요함
	int modifyTaskLocation(Map<String, Object> m);
	// 업무 완료
	int modifyCompleteTask(Map<String, Object> m);
	// 업무 완료취소
	int modifyCancelEndTask(Map<String, Object> m);
	// 업무 삭제
	int removeTask(Map<String, Object> m);
}
