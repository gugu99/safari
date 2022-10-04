package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IProjectSummaryMapper {
	Map<String, Object> selectWorkspaceOne(int workNo);
	List<Map<String, Object>> selectWorkspaceMemberListWithProfileImgByWorkNo(int workNo);
	Map<String, Object> selectTaskCntAndTaskCompleteRateByWorkNo(int workNo);
	List<Map<String, Object>> selectTaskCntPerTaskPointByWorkNo(int workNo);
	List<Map<String, Object>> selectFinishedTaskPerDate(int workNo);
}
