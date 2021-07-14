package com.ict.service;

import java.util.List;

import com.ict.vo.VO;

public interface MyService {
		// 리스트
		List<VO> selectAll() throws Exception;
		
		
		// 아이디체크 
		VO selectIdchk(String id) throws Exception;
		
		// 삽입
		int insertMembers(VO vo) throws Exception;
		
		
		// 삭제
		int deleteMembers(String idx)throws Exception;
}
