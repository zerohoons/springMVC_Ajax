package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.service.MyService;
import com.ict.vo.VO;

@Controller
public class MyController {
	@Autowired
	private MyService myService;
	
	@RequestMapping(value = "list.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<VO> listCommand(){
		try {
			return myService.selectAll();
		} catch (Exception e) {
		}
		return null;
	}
	@RequestMapping(value = "idchk.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String idchkCommand(@RequestParam("id") String id){
		try {
			VO vo = myService.selectIdchk(id);
			if(vo==null) {
				return "0";
			}else {
				return "1";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@RequestMapping(value = "insert.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String insertCommand(VO vo) {
		try {
			int result = myService.insertMembers(vo);
			
			return String.valueOf(result);
			
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping(value = "delete.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String deleteCommand(@RequestParam("idx")String idx) {
		try {
			int result = myService.deleteMembers(idx);
			return String.valueOf(result);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
}
