package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Task;

@Mapper
public interface ITaskMapper {
	// 피드백 sender가 워크스페이스 관리자가 아닐때 receiver의 완료된 업무들 조회 - 피드백에서 사용할 메서드
	List<Map<String, Object>> selectCompleteTaskListByReceiverNoAndSenderNo(Map<String, Integer> m);
	// 피드백 sender가 워크스페이스 관리자일 때 receiver의 완료된 업무들 조회 - 피드백에서 사용할 메서드
	List<Map<String, Object>> selectCompleteTaskListByReceiverNo(int feedbackReceiverNo);
	
	
	// 프로젝트 번호에 맞는 업무 조회
	List<Task> selectTaskByProjectNo(Map<String, Object> m);
	// 업무리스트 번호에 맞는 업무 조회
	List<Task> selectTaskByTasklistNo(int tasklistNo);
	// 정렬을 위한 조회(나에게 배정된 업무)
	List<Task> selectTaskByProjectNoAndWorkMemberNo(Map<String, Object> m);
	// 상세 보기
	Map<String, Object> selectTaskByTaskNo(int taskNo);
	// 업무 복사를 위한 객체 받기
	Task selectTaskForCopy(int taskNo);
	// 업무 복사
	int insertTaskForCopy(Task task);
	// 업무 생성
	int insertTask(Task task);
	// 업무 수정
	int updateTask(Task task);
	// 업무 위치변경
	int updateTaskLocation(Map<String, Integer> m);
	// 업무 완료
	int updateCompleteTask(int taskNo);
	// 업무 완료취소
	int updateCancelEndTask(int taskNo);
	// 업무 삭제
	int deleteTask(int taskNo);
}