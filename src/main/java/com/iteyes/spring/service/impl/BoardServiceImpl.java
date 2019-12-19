package com.iteyes.spring.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.iteyes.spring.dao.BoardDAO;
import com.iteyes.spring.service.BoardService;
import com.iteyes.spring.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<?> selectBoardList(Map<String, Object> paramMap) {
		return boardDAO.selectBoardList(paramMap);
	}

	@Override
	public BoardVO selectBoardOne(Map<String, Object> paramMap) {

		return boardDAO.selectBoardOne(paramMap);
	}

	@Override
	public int deleteBoard(Map<String, Object> paramMap) {

		return boardDAO.deleteBoard(paramMap);
	}

	@Override
	public int insertBoard(Map<String, Object> paramMap) {
		return boardDAO.insertBoard(paramMap);
		
	}

	@Override
	public int updateBoard(Map<String, Object> paramMap) {
		return boardDAO.updateBoard(paramMap);
		
	}
}
