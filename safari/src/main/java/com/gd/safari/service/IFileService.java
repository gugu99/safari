package com.gd.safari.service;

import java.util.List;
import java.util.Map;

public interface IFileService {
	
	List<com.gd.safari.vo.File> selectAllFileList(int ProjectNo);
	
	int insertProfileImg(List<Map<String, Object> >map);
	
	int deleteFile(int fileNo,String path);
	
}
