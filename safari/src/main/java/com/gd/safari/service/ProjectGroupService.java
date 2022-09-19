package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.mapper.IProjectGroupMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjectGroupService implements IProjectGroupService {
	@Autowired
	IProjectGroupMapper projectGroupMapper;
	
	@Override
	public int addProjectGroup(String projectGroupName) {
		return projectGroupMapper.insertProjectGroup(projectGroupName);
	}
	
	
}
