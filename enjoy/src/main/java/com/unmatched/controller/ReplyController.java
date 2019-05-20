package com.unmatched.controller;

import com.unmatched.pojo.Users;
import com.unmatched.service.ReplyService;
import com.unmatched.vo.JsonResult;
import com.unmatched.vo.Reply;
import com.unmatched.vo.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 回帖页面
 * @author SiLenCE.YN && Xiaojp
 */
@Controller
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    /**
     * 呈现回帖页面
     */
    @RequestMapping("/replyList")
    public String replyList(String tid, Model model,HttpServletRequest request) {

        //判断session中是否有用户信息
        Object userInfo = request.getSession().getAttribute("userInfo");
        //判定userInfo是否为空
        //如果空，则未登录;非空，则已登录
        if (userInfo == null){
            model.addAttribute("ok","-1");
        } else {
            model.addAttribute("ok","0");
        }
        //检查主贴tid是否获取到
        //Integer tid = Integer.parseInt(request.getParameter("tid"));//不通过传参获取页面属性
        System.err.println("=====" + tid);
        //查询主贴内容
        Topic reTopic = replyService.findTopicObject(Integer.parseInt(tid));
        //调用findReplayObjects查询所有回帖信息
        List<Reply> rlist = replyService.findReplyObjects(Integer.parseInt(tid));

        //往model中添加一个属性(添加到request域中)
        model.addAttribute("topList", reTopic);
        model.addAttribute("reList", rlist);
        return "bbsreply";

    }


    /**
     * 呈现回帖页面--for ajax
     */
    @RequestMapping("/oldreplyList")
    @ResponseBody
    public JsonResult replyList(String tid) {
        JsonResult result = new JsonResult();
        try {
            System.err.println("=====" + tid);
            //查询主贴内容
            Topic reTopic = replyService.findTopicObject(Integer.parseInt(tid));
            //调用findReplayObjects查询所有回帖信息
            List<Reply> rlist = replyService.findReplyObjects(Integer.parseInt(tid));

            Map map = new HashMap();
            //往model中添加一个属性(添加到request域中)
            map.put("topList", reTopic);
            map.put("reList", rlist);
            result.setMessage("ok");
            result.setState(1);
            result.setData(map);
        } catch (Exception ex) {
            ex.printStackTrace();
            result.setMessage("error");
            result.setState(0);
        }
        return result;
    }

    /**
     * 发布回复帖子
     */
    @RequestMapping("/newReplay")
    public String newReplay(Reply reply,HttpServletRequest request) {
        /**获取当前登陆用户session*/
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        /**设置当前登陆用户名*/
        reply.setSuname(userInfo.getUsername());
        /**设置当前登陆用户id*/
        reply.setSuid(userInfo.getUid());
        replyService.postReply(reply);
        return "redirect:/replyList?tid="+reply.getStid();
    }
}
