package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ITaskCommentMapper {
	// 업무 코멘트리스트 가져오기
	List<Map<String, Object>> selectTaskComment(int taskNo);
}
