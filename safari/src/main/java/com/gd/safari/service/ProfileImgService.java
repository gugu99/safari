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
	@Autowired IProfileImgMapper profileImgMapper;
		
	@Override
	public int addProfileImg(Map<String, Object> map) {
		log.debug(TeamColor.CJM+((MultipartFile)map.get("imgFile")).getOriginalFilename() +"OriginName debug"); // OriginName 디버깅
		int workMemberNo=((int)map.get("workMemberNo"));
		String path = (String)map.get("path");																	// path 불러오기;
		if(profileImgMapper.selectProfileImgOne(workMemberNo)!=null) {											// 기존이미지가 있다면삭제
			ProfileImg lastfileImg = profileImgMapper.selectProfileImgOne(workMemberNo);	
			String lastExt = lastfileImg.getOriginName().substring(lastfileImg.getOriginName().lastIndexOf(".")); // 확장자 검색
			profileImgMapper.deleteProfileImg(workMemberNo);													// 이미지정보 삭제
			File file = new File(path + lastfileImg.getFilename() + lastExt);									// 파일 제거
				if(file.exists()) {
					file.delete();
				}
		}
		String ext = ((MultipartFile)map.get("imgFile")).getOriginalFilename().substring(((MultipartFile)map.get("imgFile")).getOriginalFilename().lastIndexOf("."));// 파일 확장자
		String originName = ((MultipartFile)map.get("imgFile")).getOriginalFilename();	// originName 불러오기
		String fileType = ((MultipartFile)map.get("imgFile")).getContentType();			// fileType 불러오기
		long  fileSize = ((MultipartFile)map.get("imgFile")).getSize();					// path 불러오기
		String filename = UUID.randomUUID().toString().replace("-", "");				// 중복되지 않는 랜덤이름 새성 UUID API사용
		//Map 에 각각의 항목 넣어주기
		map.put("originName",originName); 												
		map.put("fileType", fileType);
		map.put("fileSize", fileSize);											
		map.put("fileExt", ext);
		map.put("filename", filename);
		
		try { ((MultipartFile)map.get("imgFile")).transferTo(new File(path+filename+ext));// 새로운 빈 파일안에 MultipartFile안에 파일을 하나씩 복사
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(); // @트랜잭션 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는)발생
		}
		return profileImgMapper.insertProfileImg(map);
	}

	@Override
	public ProfileImg getProfileImgOne(int workMemberNo) {
		log.debug(TeamColor.CJM+workMemberNo +"Controller workMemberNo"); 				// workMemberNo 디버깅
		return profileImgMapper.selectProfileImgOne(workMemberNo);
	}

	@Override
	public int removeProfileImg(int workMemberNo, String path) {
		log.debug(TeamColor.CJM+workMemberNo +"Controller workMemberNo"); 				// workMemberNo 디버깅
		ProfileImg profileImg= profileImgMapper.selectProfileImgOne(workMemberNo);		// profile이지미 정보받기
		
		String ext = profileImg.getOriginName().substring(profileImg.getOriginName().lastIndexOf(".")); // 확장자 검색
		File file = new File(path + profileImg.getFilename() + ext);		// 파일 제거
			if(file.exists()) {
				file.delete();
			}
		return profileImgMapper.deleteProfileImg(workMemberNo);
	}

}
