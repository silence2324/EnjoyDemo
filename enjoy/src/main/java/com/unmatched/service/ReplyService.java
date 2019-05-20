package com.unmatched.service;

import com.unmatched.vo.Reply;
import com.unmatched.vo.Topic;

import java.util.List;

/**
 * 回帖详情
 * @author SiLenCE.YN && Xiaojp
 */
public interface ReplyService {

    /**
     * 通过主贴tid查询主贴信息
     */
    Topic findTopicObject(Integer tid);

    /**
     * 通过主贴tid查询关联的回帖信息
     */
    List<Reply> findReplyObjects(Integer tid);

    /**
     * 发布回复帖子
     */
    int postReply(Reply reply);

}
