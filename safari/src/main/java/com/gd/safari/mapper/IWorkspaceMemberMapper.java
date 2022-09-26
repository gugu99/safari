package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IWorkspaceMemberMapper {

	 // 관리자 워크스페이스 멤버추가
	int insertWorkspaceCreater(WorkspaceMember workspaceMember);
	
	// 워크스페이스멤버 추가
	int insertWorkspaceMember(WorkspaceMember workspaceMember);
	
	// 워크스페이스멤버 리스트
	List<WorkspaceMember> selectWorkspaceMemberList(int workNo);
	
	// 워크스페이스 멤버 삭제
	int deleteWorkspaceMember(int workNo);
	
	// 워크스페이스 멤버 상세정보
	Map<String,Object> selectWorkspaceMemberOne(int workMemberNo);
	
	// 워크스페이스 멤버 번호가져오기
	int selectWorkspaceMemberNo(WorkspaceMember workspaceMember);
	
	// 워크스페이스 멤버 수정
	int updateWorkspaceMember (WorkspaceMember workspaceMember);
	
	// 초대된 워크스페이스멤버 추가
	int inviteInsertWorkspaceMember(WorkspaceMember workspaceMember);
	
	// 워크스페이스멤버 활동여부 조회
	String selectWorkspaceMemberOneActive (int workMemberNo);
	
	// 초대된 워크스페이스멤버코드 조회 
	String selectWorkspaceMemberOneCode(int workMemberNo);
	
	// 가입된 이메일 확인 메서드
	String selectMemberEmailByConfirm(String memberEmail );
	
	// 초대된 워크스페이스멤버 정보입력 하는메서드 insert같은 update
	int updateWorkspaceMemberByInvite(WorkspaceMember workspaceMember);
	
	// 멤버 권한레벨 조정하는 메서드
	int updateWorkspaceMemberByLevel(WorkspaceMember workspaceMember);
	
	// 과거 관리자 권한 1로 바꾸는 하는메서드
	int updateWorkspaceMemberByAdminLevel (int workMemberNo);
	
	// 새로운 관리자 권한 4로 바꾸는 메서드
	int updateWorkspaceMemberByNewAdminLevel(int workMemberNo);
	
	// 멤버 추방 하는 메서드 (active N으로) 바꾸는 메서드
	int updateWorkspaceMemberByActive (int workMemberNo);
	
	// 멤버 레벨 알아오는 메서드
	int selectWorkspaceMemberLevel (WorkspaceMember workspaceMember);
	
	// active 값에 따른 메서드
	List<WorkspaceMember> selectWorkspaceMemberListByActive(WorkspaceMember workspaceMember);
	
	// active 값 Y로 바꾸는메서드
	int updateWorkspaceMemberActiveApprove(int workMemberNo);
	
	// 가입된 workspaceMemberEmail 인지 확인 하는 메서드
	String selectWorkspaceMemberEmailByConfirm(WorkspaceMember workspaceMember);
	
}
