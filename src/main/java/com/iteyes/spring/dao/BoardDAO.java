package com.iteyes.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iteyes.spring.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAO {
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	public List<?> selectBoardList(Map<String, Object> paramMap) {
		return sqlSession.selectList("board.selectBoardList", paramMap);
	}

	public BoardVO selectBoardOne(Map<String, Object> paramMap) {
		return sqlSession.selectOne("board.selectBoardOne", paramMap) ;
	}
	
	public int insertBoard(Map<String, Object> paramMap) {
		return sqlSession.insert("board.insertBoard", paramMap);
	}
	
	public int deleteBoard(Map<String, Object> paramMap) {
		System.out.println(paramMap+"번 게시물 delete 요청");
		return sqlSession.delete("board.deleteBoard", paramMap);
	}

	public int updateBoard(Map<String, Object> paramMap) {
		return sqlSession.update("board.updateBoard", paramMap);
	}
}
