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
import com.gd.safari.mapper.IBoardFileMapper;
import com.gd.safari.mapper.IBoardMapper;
import com.gd.safari.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper boardMapper;
	@Autowired
	private IBoardFileMapper boardFileMapper;

	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {

		// 워크넘버 디버깅
		log.debug(TeamColor.CJM + map.get("workNo") + "Controller workNo");

		// 보드 리스트 메서드
		return boardMapper.selectBoardList(map);
	}

	@Override
	public int addBoard(Map<String, Object> map, List<MultipartFile> file) {

		// 워크넘버 디버깅
		log.debug(TeamColor.CJM + map.get("workNo") + "Controller workNo");

		// 보드 넣기
		boardMapper.insertBoard(map);

		int boardNo = (int) map.get("boardNo");

		log.debug(TeamColor.CJM + map.get("boardNo") + "Service boardNo 디버깅");

		map.put("boardNo", boardNo);

		if(file.size()<1) {
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
			boardFileMapper.insertBoardFile(map);
			// 새로운 빈 파일안에 MultipartFile안에 파일을 넣기
			try {
				(mf).transferTo(new File(path + filename + ext));

			} catch (Exception e) {
				e.printStackTrace();

				// @트랜잭션 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는)발생
				throw new RuntimeException();
			}

		}
		}
		return 0;
	}

}
