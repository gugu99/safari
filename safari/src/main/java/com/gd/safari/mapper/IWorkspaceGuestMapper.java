package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IWorkspaceGuestMapper {
	
	// 워크스페이스 게스트 추가
	int insertWorkspaceGuest(WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 게스트 목록
	List<WorkspaceMember> selectWorkspaceGuestList(Map<String,Object> map);
	
	// 워크스페이스 게스트 추방
	int updateWorkspaceGuestByActive (WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 게스트 승인
	int updateWorkspaceGuestActiveApprove(WorkspaceGuest workspaceGuest);
	
	// 이미 생성된 게스트인지 확인
	String selectWorkspaceGuestEmailByConfirm(WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 게스트 active W count
	int selectWorkspaceGuestActiveWCount (int workNo);
	
	// 워크스페이스 게스트 카운트
	int selectWorkspaceGuestCount (int workNo);
	
	// 워크스페이스 게스트 active W count
	int selectWorkspaceGuestActiveNCount (int workNo);
	
	// 워크스페이스 게스트 index 목록 
	List<Map<String,Object>> selectWorkspaceGuestListByEmail (String memberEmail);

	// 워크스페이스 게스트인지 멤버인지 확인
	String selectWorkspaceGuestByEmailAndWorkNo(Map<String, Object> map);
	
	// 게스트 코드 확인 하기
	String selectWorkspaceGuestOneCode (WorkspaceGuest workspaceGuest);
	
	// 게스트 활동여부 확인
	String selectWorkspaceGuestOneActive(WorkspaceGuest workspaceGuest);
}
