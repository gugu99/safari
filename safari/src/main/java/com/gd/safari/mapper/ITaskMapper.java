package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Task;

@Mapper
public interface ITaskMapper {
	// 프로젝트 번호에 맞는 업무 조회
	List<Task> selectTaskByProjectNo(int projectNo);
	// 업무 생성
	int insertTask(Task task);
	// 업무 수정
	int updateTask(Task task);
	// 업무 삭제
	int deleteTask(int taskNo);
}
