package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ITaskMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TaskService implements ITaskService {
	@Autowired private ITaskMapper taskMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	
	// 프로젝트 번호에 맞는 업무 조회
	@Override
	public List<Task> getTaskByProjectNo(int projectNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 프로젝트 번호에 맞는 업무 조회");
		return taskMapper.selectTaskByProjectNo(projectNo);
	}
	
	// 상세 보기
	@Override
	public Map<String, Object> getTaskByTaskNo(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 상세 보기");
		return taskMapper.selectTaskByTaskNo(taskNo);
	}
	
	// 하위 업무 가져오기
	@Override
	public List<Map<String, Object>> getTaskByLowerTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 하위 업무 가져오기");
		return taskMapper.selectTaskByLowerTask(taskNo);
	}

	// 업무 생성
	@Override
	public int addTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 생성");
		return taskMapper.insertTask(task);
	}
	
	// 업무 수정
	@Override
	public int modifyTask(Task task) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 수정");
		return taskMapper.updateTask(task);
	}
	
	// 업무 삭제
	@Override
	public int removeTask(int taskNo) {
		log.debug(TeamColor.CSH + this.getClass() + " 업무 삭제 (업무멤버도 함께 삭제)");
		
		// 업무를 삭제할 시 같이 삭제될 업무번호에 따른 삭제 (부모 삭제 시 자식 삭제)
		int row = taskMemberMapper.deleteTaskMemberByTaskNo(taskNo);
		// 성공시 여러개의 줄이 나올 수 있음 (멤버가 여러명일 수 있기때문에)
		if(row == 0) { // 실패
			log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 업무번호에 따른 삭제 (부모 삭제 시 자식 삭제) -- 실패");
		} else { // 성공
			log.debug(TeamColor.CSH + "업무를 삭제할 시 같이 삭제될 업무번호에 따른 삭제 (부모 삭제 시 자식 삭제) -- 성공");
			
		}
		
		return taskMapper.deleteTask(taskNo);
	}

}
