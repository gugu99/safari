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
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class FileService implements IFileService {

	@Autowired
	private IFileMapper fileMapper;

	// 프로젝트번호에 따른 파일 리스트
	@Override
	public List<com.gd.safari.vo.File> selectAllFileList(int ProjectNo) {

		// ProjectNo 디버깅
		log.debug(TeamColor.CJM + ProjectNo + "ProjectNo Service");

		return fileMapper.selectAllFileList(ProjectNo);
	}

	// 파일 인서트 메서드
	@Override
	public int addFile(Map<String, Object> map, List<MultipartFile> file) {

		// OriginName 디버깅
		for (MultipartFile mf : file) {

			// path 불러오기;
			String path = (String) map.get("path");

			// 파일 확장자 가져오기
			String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));

			// originName 불러오기
			String originName = mf.getOriginalFilename();

			// fileType 불러오기
			String fileType = mf.getContentType();

			// Size 불러오기
			long fileSize = mf.getSize();

			// 중복되지 않는 랜덤이름 새성 UUID API사용
			String filename = UUID.randomUUID().toString().replace("-", "");

			// Map 에 각각의 항목 넣어주기
			map.put("originName", originName);
			map.put("fileType", fileType);
			map.put("fileSize", fileSize);
			map.put("fileExt", ext);
			map.put("filename", filename);
			fileMapper.insertFile(map);
			// 새로운 빈 파일안에 MultipartFile안에 파일을 넣기
			try {
				(mf).transferTo(new File(path + filename + ext));

			} catch (Exception e) {
				e.printStackTrace();

				// @트랜잭션 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는)발생
				throw new RuntimeException();
			}

		}
		return 0;
	}

	// 파일 삭제
	@Override
	public int removeFile(int fileNo, String path) {

		// fileNo 디버깅
		log.debug(TeamColor.CJM + fileNo + "fileNo Service");

		// 파일 정보받기
		com.gd.safari.vo.File file = fileMapper.selectFileOne(fileNo);

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

	// 업무리스트 번호에따른 업무리스트
	@Override
	public List<Task> getTaskList(int tasklistNo) {
		// tasklistNo 디버깅
		log.debug(TeamColor.CJM + tasklistNo + "tasklistNo Service");

		// 업무리스트 번호에따른 업무리스트
		return fileMapper.selectTaskList(tasklistNo);
	}

	// 업무 번호에 따른 업무리스
	@Override
	public List<com.gd.safari.vo.File> getTaskNoFileList(int taskNo) {
		// taskNo 디버깅
		log.debug(TeamColor.CJM + taskNo + "taskNo Service");

		// 업무 번호에 따른 업무리스
		return fileMapper.selectTaskNoFileList(taskNo);
	}

	@Override
	public List<com.gd.safari.vo.File> getTasklistNoFileList(int tasklistNo) {
		// tasklistNo 디버깅
		log.debug(TeamColor.CJM + tasklistNo + "tasklistNo Service");

		return fileMapper.selectTasklistNoFileList(tasklistNo);
	}

}
