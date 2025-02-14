package com.lec.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j // 메세지(로그) 출력 :sysout 대신할 아이 lombok의 기능
public class HelloController {
	@RequestMapping(value="/")
	public String index() {
		return "index";   // resources/templates/index.html 로 감
	}
	//@RequestMapping(value="/home",method= {RequestMethod.GET,RequestMethod.POST})
	//@PostMapping("/home")  // 이러면 post 매핑
	@GetMapping("/home") // 이러면 get 매핑을 해줌
	public String home(Model model) {
		log.info("첫 로그 메세지 ");
		model.addAttribute("greeting","안녕하세요(Hello), Spring, Boot!");  // 스프링부트는 한글넣고 스프링에서 web.xml에서 한 한글처리 안해도 안깨짐
		return "home";  // resources/templates/home.html 로 감
	}
}
