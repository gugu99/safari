package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Task;

@Mapper
public interface ILowerTaskMapper {
	// 하위 업무 가져오기
	List<Map<String, Object>> selectLowerTaskByTaskNo(int taskNo);
	// 프로젝트번호에 맞는 업무 가져오기 (단, 자신이 아닌 것)
	List<Map<String, Object>> selectTaskByProjectNoForLowerTask(Map<String, Integer> m);
	// 하위 업무 생성
	int insertLowerTask(Task task);
	// 하위 업무 추가
	int updateChangeLowerTask(Map<String, Integer> m);
	// 하위 업무 전환
	int updateChangeTask(int lowerTaskNo);
	// 하위업무 삭제 
	int deleteLowerTask(int taskNo);
	// 하위업무의 하위업무 삭제
	int deleteLowerLowerTask(int taskNo);
}
