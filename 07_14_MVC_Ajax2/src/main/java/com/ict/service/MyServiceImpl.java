package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.VO;

@Service("myServiceImpl")
public class MyServiceImpl implements MyService{
	@Autowired
	private MyDAO myDAO ;
	
	@Override
	public List<VO> selectAll() throws Exception {
		return myDAO.selectAll();
	}
	@Override
	public VO selectIdchk(String id) throws Exception {
		return myDAO.selectIdchk(id);
	}
	@Override
	public int insertMembers(VO vo) throws Exception {
		return myDAO.insertMembers(vo);
	}
	@Override
	public int deleteMembers(String idx) throws Exception {
		return myDAO.deleteMembers(idx);
	}
}
