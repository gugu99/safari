package com.gd.safari.service;

import java.io.File;
import java.util.HashMap;
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
import com.gd.safari.mapper.IWorkspaceMapper;
import com.gd.safari.vo.Board;
import com.gd.safari.vo.BoardFile;
import com.gd.safari.vo.BoardList;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper boardMapper;
	@Autowired
	private IBoardFileMapper boardFileMapper;
	@Autowired
	private IWorkspaceMapper workspaceMapper;

	@Override
	public Map<String, Object> getBoardList(Map<String, Object> paramMap) {
		log.debug(TeamColor.GDE + "paramMap --- " + paramMap);
		// 게시글 리스트와 관리자 여부를 담을 map
		Map<String, Object> map = new HashMap<>();
		
		// 워크스페이스 관리자인지 조회
		String admin = workspaceMapper.selectWorkspaceAdminEmail(paramMap);
		boolean manager = false;
		if (admin != null) { // admin 값이 null이 아니면 워크스페이스관리자
			manager = true;
		}
		// 보드 리스트 가져오기
		List<BoardList> list = boardMapper.selectBoardList((int)paramMap.get("workNo"));
		log.debug(TeamColor.GDE + "list --- " + list);
		
		map.put("boardList", list);
		map.put("manager", manager);

		return map;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addBoard(Map<String, Object> map, List<MultipartFile> file) {

		// 워크넘버 디버깅
		log.debug(TeamColor.CJM + map.get("workNo") + "Controller workNo");
		log.debug(TeamColor.GDE + "file --- " + file);

		// 보드 넣기
		boardMapper.insertBoard(map);

		int boardNo = (int) map.get("boardNo");

		log.debug(TeamColor.CJM + map.get("boardNo") + "Service boardNo 디버깅");

		map.put("boardNo", boardNo);
		
		
		if(file != null) {
			
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

	// 게시글 고정 여부 변경
	@Override
	public int modifyBoardFixByBoardNo(Board board) {
		log.debug(TeamColor.GDE + board);
		
		// 게시글 고정 여부 변경
		int row = boardMapper.updateBoardFixByBoardNo(board);
		log.debug(TeamColor.GDE + "modifyBoardFixByBoardNo row --- " + row);
		
		return row;
	}

	// 게시글 삭제하기
	@Override
	public int removeBoard(int boardNo) {
		log.debug(TeamColor.GDE + "boardNo --- " + boardNo);
		
		// 게시글 삭제하기
		int row = boardMapper.deleteBoard(boardNo);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}

	// 게시글 한개 조회하기
	@Override
	public Map<String, Object> getBoardOne(int boardNo) {
		log.debug(TeamColor.GDE + "boardNo --- " + boardNo);
		
		// 게시글 한개 조회
		Board boardOne = boardMapper.selectBoardOne(boardNo);
		log.debug(TeamColor.GDE + "boardOne --- " + boardOne);
		// 게시글에 등록된 파일 목록 조회
		List<BoardFile> fileList = boardFileMapper.selectBoardFileByBoardNo(boardNo);
		log.debug(TeamColor.GDE + "fileList --- " + fileList);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardOne", boardOne);
		map.put("fileList", fileList);
		
		return map;
	}

	// 게시글 수정하기
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyBoard(Map<String, Object> map, List<MultipartFile> file, int[] boardFileNo) {
		log.debug(TeamColor.GDE + "map --- " + map);
		log.debug(TeamColor.GDE + "file --- " + file);
		log.debug(TeamColor.GDE + "boardFileNo --- " + boardFileNo);
		
		// 게시글 수정
		int row = boardMapper.updateBoard(map);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		// 삭제하려는 파일번호 삭제하기
		if (boardFileNo != null) {
			for (int no : boardFileNo) {
				boardFileMapper.deleteBoardFile(map);
			}
		}
		
		// 추가하려는 파일 등록하기
		if(file != null) {
			log.debug(TeamColor.GDE + "--------" + file.get(0));
			
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
	}
	

}
