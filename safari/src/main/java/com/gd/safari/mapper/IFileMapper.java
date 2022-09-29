package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IFileMapper {
	
	// 프로젝트 전체 파일 리스트
	List<com.gd.safari.vo.File> selectAllFileList(int ProjectNo);
	
	// 파일 삽입 
	int insertFile(Map<String, Object> map);
	
	// 파일 삭제
	int deleteFile(int fileNo);
	
	// 파일 정보상세보기
	com.gd.safari.vo.File selectFileOne(int FileNo);
}	
