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
		return sqlSessionTemplate.selectList("members.list");
	}
	@Override
	public VO selectIdchk(String id) throws Exception {
		return sqlSessionTemplate.selectOne("idchk", id);
	}
	@Override
	public int insertMembers(VO vo) throws Exception {
		return sqlSessionTemplate.insert("insert", vo);
	}
	@Override
	public int deleteMembers(String idx) throws Exception {
		return sqlSessionTemplate.delete("delete",idx);
	}
}
