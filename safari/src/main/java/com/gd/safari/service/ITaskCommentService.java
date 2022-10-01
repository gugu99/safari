package com.gd.safari.service;

import java.util.List;
import java.util.Map;

public interface ITaskCommentService {
	// 업무 코멘트리스트 가져오기
	List<Map<String, Object>> getTaskComment(int taskNo);

}
