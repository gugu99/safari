package com.gd.safari.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILowerTaskMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LowerTaskService implements ILowerTaskService {
	@Autowired private ILowerTaskMapper lowerTaskMapper;
	
	// 하위 업무 가져오기
	@Override
	public List<Map<String, Object>> getLowerTaskByTaskNo(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 가져오기");
		return lowerTaskMapper.selectLowerTaskByTaskNo(taskNo);
	}
	
	// 하위 업무가 아닌 것 가져오기
	@Override
	public List<Map<String, Object>> getLowerTaskByProjectNo(Map<String, Integer> map) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무가 아닌 것 가져오기");
		
		List<Map<String, Object>> lowerTask = lowerTaskMapper.selectLowerTaskByProjectNo(map);
		List<Map<String, Object>> result = new ArrayList<>();
		
		// 디버깅
		log.debug(TeamColor.CSH + lowerTask);
		
		
		// 반복문으로 null인 값을 result에 담는다
		for(Map<String, Object> m : lowerTask) {
			if(m.get("lowerTaskNo") == null) {
				result.add(m);
			}
		}
		
		return result;
	}
	
	// 하위 업무 추가
	@Override
	public int modifyinsertLowerTask(Map<String, Integer> m) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 추가");
		return lowerTaskMapper.updateinsertLowerTask(m);
	}
	
	// 하위 업무 해제
	@Override
	public int modifydeleteLowerTask(int lowerTaskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 해제");
		return lowerTaskMapper.updatedeleteLowerTask(lowerTaskNo);
	}
}
