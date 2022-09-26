package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IProjectBookmarkMapper {
	int insertProjectBookmark(Map<String, Object> map);
	int deleteProjectBookmark(Map<String, Object> map);
}
