package com.gd.safari.service;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProfileImgMapper;
import com.gd.safari.vo.ProfileImg;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ProfileImgService implements IProfileImgService {
	@Autowired
	IProfileImgMapper profileImgMapper;

	@Override
	public int addProfileImg(Map<String, Object> map) {
		// OriginName 디버깅
		log.debug(TeamColor.CJM + ((MultipartFile) map.get("imgFile")).getOriginalFilename() + "OriginName debug");
		
		// Map 에서 workMemberNo 꺼내오기
		int workMemberNo = ((int) map.get("workMemberNo"));
		
		// path 불러오기;
		String path = (String) map.get("path"); 
		
		// 기존이미지가 있다면삭제
		if (profileImgMapper.selectProfileImgOne(workMemberNo) != null) { 
			
			// 지난 img 정보 불러오는 메서드 
			ProfileImg lastfileImg = profileImgMapper.selectProfileImgOne(workMemberNo);
			
			// 확장자 삽입
			String lastExt = lastfileImg.getOriginName().substring(lastfileImg.getOriginName().lastIndexOf(".")); 
															
			// 지난 이미지정보 삭제
			profileImgMapper.deleteProfileImg(workMemberNo); 
			
			// 지난 파일 제거
			File file = new File(path + lastfileImg.getFilename() + lastExt); 
			if (file.exists()) {
				file.delete();
			}
		}
		// 파일 확장자 가져오기
		String ext = ((MultipartFile) map.get("imgFile")).getOriginalFilename()
				.substring(((MultipartFile) map.get("imgFile")).getOriginalFilename().lastIndexOf("."));
		
		// originName 불러오기
		String originName = ((MultipartFile) map.get("imgFile")).getOriginalFilename(); 
		
		// fileType 불러오기
		String fileType = ((MultipartFile) map.get("imgFile")).getContentType(); 
		
		// Size 불러오기
		long fileSize = ((MultipartFile) map.get("imgFile")).getSize(); 
		
		// 중복되지 않는 랜덤이름 새성 UUID API사용
		String filename = UUID.randomUUID().toString().replace("-", ""); 
		// Map 에 각각의 항목 넣어주기
		map.put("originName", originName);
		map.put("fileType", fileType);
		map.put("fileSize", fileSize);
		map.put("fileExt", ext);
		map.put("filename", filename);
		
		// 새로운 빈 파일안에 MultipartFile안에 파일을 넣기
		try {
			((MultipartFile) map.get("imgFile")).transferTo(new File(path + filename + ext));

		} catch (Exception e) {
			e.printStackTrace();
			
			// @트랜잭션 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는)발생
			throw new RuntimeException(); 
		}
		return profileImgMapper.insertProfileImg(map);
	}

	@Override
	public ProfileImg getProfileImgOne(int workMemberNo) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Controller workMemberNo"); 
		
		// 이미지 정보 꺼내오는 메서드
		return profileImgMapper.selectProfileImgOne(workMemberNo);
	}

	@Override
	public int removeProfileImg(int workMemberNo, String path) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Controller workMemberNo"); 
		
		// profile이지미 정보받기
		ProfileImg profileImg = profileImgMapper.selectProfileImgOne(workMemberNo); 
		
		// 확장자 검색
		String ext = profileImg.getOriginName().substring(profileImg.getOriginName().lastIndexOf("."));
		
		// 파일 제거
		File file = new File(path + profileImg.getFilename() + ext); 
		if (file.exists()) {
			file.delete();
		}
		return profileImgMapper.deleteProfileImg(workMemberNo);
	}

}
