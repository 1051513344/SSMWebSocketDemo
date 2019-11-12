package com.ssm.controller;

import com.ssm.model.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(HttpServletRequest request, @RequestParam("username") String username) {
        HttpSession session = request.getSession();
        session.setAttribute(Constants.DEFAULT_SESSION_USERNAME, username);
        return "redirect:test.jsp";
    }

    @RequestMapping("index")
    public String index() {
        return "index.jsp";
    }
}
