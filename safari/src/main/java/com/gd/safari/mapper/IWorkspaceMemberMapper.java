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
	
	// 초대된 워크스페이스멤버 조회 
	String selectWorkspaceMemberOneCode(int workMemberNo);
	
	// 가입된 이메일 확인 메서드
	String selectMemberEmailByConfirm(String memberEmail );
	
	// 초대된 워크스페이스멤버 정보입력 하는메서드 insert같은 update
	int updateWorkspaceMemberByInvite(WorkspaceMember workspaceMember);
}
