package com.gd.safari.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IFileMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class FileService implements IFileService{
	
	@Autowired
	private IFileMapper fileMapper;
	
	@Override
	public List<com.gd.safari.vo.File> selectAllFileList(int ProjectNo) {
		
	// ProjectNo 디버깅
	log.debug(TeamColor.CJM +ProjectNo + "ProjectNo Service");
	
		return fileMapper.selectAllFileList(ProjectNo);
	}
	
	// 파일 인서트 메서드
	@Override
	public int insertProfileImg(List<Map<String, Object>> map) {
				// OriginName 디버깅
				
				for(Map<String, Object> mf : map) {
				log.debug(TeamColor.CJM + ((MultipartFile) mf.get("imgFile")).getOriginalFilename() + "OriginName debug");
				
				// Map 에서 workMemberNo 꺼내오기
				int workMemberNo = ((int) mf.get("workMemberNo"));
				
				// path 불러오기;
				String path = (String) mf.get("path"); 
				
				// 파일 확장자 가져오기
				String ext = ((MultipartFile) mf.get("imgFile")).getOriginalFilename()
						.substring(((MultipartFile) mf.get("imgFile")).getOriginalFilename().lastIndexOf("."));
				
				// originName 불러오기
				String originName = ((MultipartFile) mf.get("imgFile")).getOriginalFilename(); 
				
				// fileType 불러오기
				String fileType = ((MultipartFile) mf.get("imgFile")).getContentType(); 
				
				// Size 불러오기
				long fileSize = ((MultipartFile) mf.get("imgFile")).getSize(); 
				
				// 중복되지 않는 랜덤이름 새성 UUID API사용
				String filename = UUID.randomUUID().toString().replace("-", ""); 
				
				// Map 에 각각의 항목 넣어주기
				mf.put("originName", originName);
				mf.put("fileType", fileType);
				mf.put("fileSize", fileSize);
				mf.put("fileExt", ext);
				mf.put("filename", filename);
				fileMapper.insertFile(mf);
				// 새로운 빈 파일안에 MultipartFile안에 파일을 넣기
				try {
					((MultipartFile) mf.get("imgFile")).transferTo(new File(path + filename + ext));

				} catch (Exception e) {
					e.printStackTrace();
					
					// @트랜잭션 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는)발생
					throw new RuntimeException(); 
				}
				
				}
				return 0;
	}

	@Override
	public int deleteFile(int fileNo,String path) {
		
		// fileNo 디버깅
		log.debug(TeamColor.CJM +fileNo + "fileNo Service");
		
		// 파일 정보받기
		com.gd.safari.vo.File file =  fileMapper.selectFileOne(fileNo);
		
		// 확장자 검색
		String ext = file.getOriginName().substring(file.getOriginName().lastIndexOf("."));
		
		// 파일 제거
		File projectFile = new File(path + file.getFilename() + ext); 
		if (projectFile.exists()) {
			projectFile.delete();
		}
		
		
		// 파일삭제
		return fileMapper.deleteFile(fileNo);
	}

	
	
	

}
