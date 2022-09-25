package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ILowerTaskMapper {
	// 하위 업무 가져오기
	List<Map<String, Object>> selectLowerTaskByTaskNo(int taskNo);
	// 프로젝트번호에 맞는 업무 가져오기 (단, 하위업무가 아닌 것)
	List<Map<String, Object>> selectLowerTaskByProjectNo(Map<String, Integer> m);
	// 하위 업무 추가
	int updateinsertLowerTask(Map<String, Integer> m);
	// 하위 업무 해제
	int updatedeleteLowerTask(int lowerTaskNo);
	// 하위업무 삭제 
	int deleteLowerTask(int taskNo);
	// 하위업무의 하위업무 삭제
	int deleteLowerLowerTask(int taskNo);
}
