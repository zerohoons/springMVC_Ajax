package com.ict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.VO;

@Repository("myDAOImpl")
public class MyDAOImpl implements MyDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<VO> selectAll() throws Exception {
		return sqlSessionTemplate.selectList("allList");
	}
	@Override
	public VO selectOne(String idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("select", idx);
	}
	@Override
	public int insert(VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("insert",vo);
	}
	@Override
	public int delete(String idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("delete", idx);
	}
	@Override
	public int update(VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("update",vo);
	}
	
}
