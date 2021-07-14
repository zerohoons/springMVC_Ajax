package com.ict.dao;

import java.util.List;

import com.ict.vo.VO;

public interface MyDAO {
	//전체 조회
	List<VO> selectAll() throws Exception;
	
	//상세보기
	VO selectOne(String idx) throws Exception;
	
	//삽입
	int insert(VO vo) throws Exception;
	
	//삭제
	int delete(String idx)throws Exception;
	
	//수정
	int update(VO vo) throws Exception;
}
