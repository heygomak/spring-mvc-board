package com.iteyes.spring.service;

import java.util.List;
import java.util.Map;

import com.iteyes.spring.vo.BoardVO;

public interface BoardService {
	List<?> selectBoardList(Map<String, Object> paramMap);

	BoardVO selectBoardOne(Map<String, Object> paramMap);

	int deleteBoard(Map<String, Object> paramMap);

	int insertBoard(Map<String, Object> paramMap);

	int updateBoard(Map<String, Object> paramMap);

}
