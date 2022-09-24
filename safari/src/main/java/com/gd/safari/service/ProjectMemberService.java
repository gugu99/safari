package com.gd.safari.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.vo.ProjectMember;

@Service
public class ProjectMemberService implements IProjectMemberService {
	@Autowired
	IProjectMemberMapper projectMemberMapper;
	
	@Override
	public List<Map<String, Object>> modifyProjectMember(int workNo, ProjectMember projectMember) {
		// update
		int row = projectMemberMapper.updateProjectMember(projectMember);
		
		if(row == 0) {
			// projectNo와 workMemberNo 조건으로 업데이트한 항목이 없을 때,
			// 즉 미리 속해있지 않은 멤버일 때
			// insert
			// TODO 멤버 insert 메소드 동적쿼리로 바꿔야 함
			projectMemberMapper.insertProjectMember(projectMember);
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("projectNo", (int)projectMember.getProjectNo());
		paramMap.put("workNo", workNo);
		
		return projectMemberMapper.selecProjectMemberListByMemberAuth(paramMap);
	}
}
