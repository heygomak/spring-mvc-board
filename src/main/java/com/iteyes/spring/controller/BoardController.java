package com.iteyes.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iteyes.spring.service.BoardService;
import com.iteyes.spring.vo.BoardVO;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/boardList")
	public String boardList(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<?> boardList = boardService.selectBoardList(paramMap);
		modelMap.addAttribute("boardList", boardList);
		return "boardList";
	}

	@RequestMapping(value = "/boardOne")
	public String boardOne(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", request.getParameter("boardNo"));
		modelMap.addAttribute("vo", boardService.selectBoardOne(paramMap));
		return "boardOne";
	}

	@RequestMapping(value = "/boardInsertForm")
	public String boardInsertForm(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		return "boardForm";
	}

	@RequestMapping(value = "/boardInsert")
	public String boardInsert(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardTitle", request.getParameter("boardTitle"));
		paramMap.put("boardContents", request.getParameter("boardContents"));
		boardService.insertBoard(paramMap);
		return "redirect:/boardList";
	}

	@RequestMapping(value = "/boardDelete")
	public String boardDelete(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", request.getParameter("boardNo"));
		boardService.deleteBoard(paramMap);
		return "redirect:/boardList";
	}

	@RequestMapping(value = "/boardUpdateForm")
	public String boardUpdateForm(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", request.getParameter("boardNo"));
		modelMap.addAttribute("vo", boardService.selectBoardOne(paramMap));
		return "boardForm";
	}
	
	@RequestMapping(value = "/boardUpdate")
	public String boardUpdate(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNo", request.getParameter("boardNo"));
		paramMap.put("boardTitle", request.getParameter("boardTitle"));
		paramMap.put("boardContents", request.getParameter("boardContents"));
		boardService.updateBoard(paramMap);
		return "redirect:/boardList";
	}
}
