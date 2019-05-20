package com.unmatched.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 特定页面呈现
 * @author SiLenCE.YN
 */
@Controller
public class PageController {
    /**分页UI呈现*/
    @RequestMapping("/doPageUI")
    public String doPageUI(){
        return "page";
    }

    /**报表登陆UI呈现*/
    @RequestMapping("/adminLoginUI")
    public String doLoginUI() {
        return "reportLogin";
    }
}
