package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.ProfileImg;

public interface IProfileImgService {
	int addProfileImg(Map<String, Object> map);
	ProfileImg getProfileImgOne(int workMemberNo);
}
