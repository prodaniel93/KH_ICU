package com.kh.icu.party.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.icu.party.model.vo.Party;

@Repository
public class PartyDao {
	
	// ott가격 표시
	public int getPrice(SqlSession sqlSession, String ottNo) {
		return sqlSession.selectOne("partyMapper.getPrice", ottNo);
	}
	
	public int insertParty(SqlSession sqlSession, Party p) {
		return sqlSession.insert("partyMapper.insertParty", p);
	}

	public List<Object> findPartyForm(SqlSession sqlSession) {
		return sqlSession.selectList("partyMapper.findPartyForm");
	}
	
	
}
