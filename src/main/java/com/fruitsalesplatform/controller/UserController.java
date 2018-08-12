package com.fruitsalesplatform.controller;

import com.fruitsalesplatform.entity.User;
import com.fruitsalesplatform.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class UserController {
    @Resource
    UserService userService;
    // 跳转至登录页面
    @RequestMapping("/user/toLogin.action")
    public String toLogin() {
        return "/login.jsp";    // 转向登录页面
    }
    // 列表
    @RequestMapping("/user/login.action")
    public String login(User user, Model model, HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("username", user.getUserName());
        map.put("password", user.getPassword());
        List<User> userList = userService.find(map);
        if (userList!=null && userList.size()>0) {
            request.getSession().setAttribute("user", userList.get(0));
            return "/home.jsp"; // 转向主页
        }
        model.addAttribute("errorMsg", "登录失败！账号或密码错误！");    // 错误信息
        return "/login.jsp";        // 转向登录界面
    }
    // 跳转至登录界面
    @RequestMapping("/user/registerPage.action")
    public String toRegister() {
        return "/register.jsp";
    }
    // 注册
    @RequestMapping("/user/register.action")
    public String register(User user, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 查找账户是否被注册
        Map<String, String> map = new HashMap<String, String>();
        map.put("username", user.getUserName());
        List<User> userList = userService.find(map);
        if (userList!=null&&userList.size()>0) {
            // 如果查询到了，说明账号已被注册，提示用户，并转发回注册界面
            model.addAttribute("errorMsg", "注册失败，该用户名已被占用！");
            return "/register.jsp";
        }
        user.setUserId(UUID.randomUUID().toString());           // 为用户设置 UUID 主键
        userService.insert(user);
        model.addAttribute("noticeMsg", "注册成功！请输入账号密码登录"); // 错误信息
        return "/login.jsp";    // 转向登录界面
    }
}
