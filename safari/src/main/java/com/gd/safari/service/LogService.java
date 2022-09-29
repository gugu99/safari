package com.gd.safari.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.ILogMapper;
import com.gd.safari.vo.Log;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LogService implements ILogService {
	@Autowired
	private ILogMapper logMapper;
	
	// 로그리스트 띄우는 메서드
	@Override
	public List<Log> getLogList(Map<String,Object> map) {

		// 로그 디버깅
		LogService.log.debug(TeamColor.CJM + map.get("projectNo") + "Service projectNo");

		// 로그 리스트 보여주기
		List<Log> list = logMapper.selectLogList(map);

		// 몇 시간 몇 분전으로 createDate 변경
		for (Log a : list) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = null;
			try {
				date = df.parse(a.getCreateDate());

			} catch (ParseException e) {
				e.printStackTrace();
			}
			a.setCreateDate(LogService.calculateTime(date));

		}
		// 로그 리스트 디버깅
		LogService.log.debug(TeamColor.CJM + list + "Service list");
		
		// 리스트 보내기
		return list;
	}
	
	// 올린시간 현재시간과 비교 초, 분 ,시간, 일 , 달 , 년 구분하여 넣기
	public static String calculateTime(Date date) {
		
		// 현재 시간
		long curTime = System.currentTimeMillis();
		
		// 시간가져오기
		long regTime = date.getTime();
		
		// 다른시간
		long diffTime = (curTime - regTime) / 1000;
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = diffTime + "초 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// day
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		return msg;
	}

	private static class TIME_MAXIMUM {
		
		// 초
		public static final int SEC = 60;
		
		// 분
		public static final int MIN = 60;
		
		// 시간
		public static final int HOUR = 24;
		
		// 날
		public static final int DAY = 30;
		
		// 달
		public static final int MONTH = 12;
	}

	@Override
	public int getLogCount(Map<String,Object> map) {

		
		return logMapper.selectLogCount(map);
	}

	@Override
	public List<Log> getLogMemberList(int projectNo) {
		LogService.log.debug(TeamColor.CJM + projectNo + "Service projectNo");
		
		return logMapper.selectLogMemberList(projectNo);
	}
}
