package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.CopyTaskList;
import com.gd.safari.vo.TaskList;

@Mapper
public interface ITaskListMapper {
	// 업무리스트 조회
	List<TaskList> selectTaskList(int projectNo);
	// 현재위치 제외 업무리스트 조회 (업무 위치 변경을 위해)
	List<TaskList> selectTaskListByUpdateLocation(Map<String, Integer> m);
	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	String selectProjectNameByTasklistNo(int tasklistNo);
	// 업무리스트 복사 - 업무도 같이
	CopyTaskList selectTaskListAndTaskForCopy(int tasklistNo);
	// 업무리스트 복사 - 업무가 없을 경우
	CopyTaskList selectTaskListForCopy(int tasklistNo);
	// 업무리스트 번호로 이름 조회하기 (로그를 위해)
	String selectTaskListTitleForLog(int tasklistNo);
	// 업무리스트 생성
	int insertTaskList(TaskList tasklist);
	// 업무리스트 수정
	int updateTaskList(TaskList tasklist);
	// 업무리스트 위치변경 - tasklistNo, projectNo가 필요하다
	int updateTaskListLocation(Map<String, Object> m);
	// 업무리스트 삭제
	int deleteTaskList(int tasklistNo);
}
