package com.gd.safari.service;

import com.gd.safari.vo.ScheduleMember;

public interface IScheduleMemberService {
	// 일정 참석여부 변경
	int modifyScheduleAttend(ScheduleMember scheduleMember);
}
