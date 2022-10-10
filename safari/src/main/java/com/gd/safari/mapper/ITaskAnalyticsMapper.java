package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ITaskAnalyticsMapper {
	// 프로젝트 시작일/마감일/완료일/경과시간/남은시간/완료됨/남은업무 가져오기
	Map<String, Object> selectTaskAnalytics(int projectNo);
	// 프로젝트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기
	Map<String, Object> selectAllTaskByProjectNo(int projectNo);
	// 나에게 배정된 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기
	Map<String, Object> selectTaskByTaskMemberIsMe(Map<String, Object> m);
	// 내가 작성한 업무 완료됨/마감일지남/계획됨/마감일없음 가져오기
	Map<String, Object> selectTaskByWriterIsMe(Map<String, Object> m);
	// 업무리스트 개요 완료됨/마감일지남/계획됨/마감일없음 가져오기
	List<Map<String, Object>> selectTastListByProjectNo(int projectNo);
}
