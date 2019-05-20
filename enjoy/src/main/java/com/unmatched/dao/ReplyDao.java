package com.unmatched.dao;

import com.unmatched.vo.Reply;
import com.unmatched.vo.Topic;

import java.util.List;

/**
 * 回帖持久层
 * @author SiLenCE.YN && Xiaojp
 */
public interface ReplyDao {
    /**
     * 通过主贴tid查询主贴信息
     */
    Topic findTopicObject(Integer tid);

    /**
     * 通过主贴tid查询关联的回帖信息
     */
    List<Reply> findReplyObjects(Integer tid);

    /**
     * 新增回复帖子
     */
    int postReply(Reply reply);
}
