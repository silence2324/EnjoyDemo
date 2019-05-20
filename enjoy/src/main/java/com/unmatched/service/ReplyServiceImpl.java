package com.unmatched.service;

/**
 * 回帖详情
 * @author SiLenCE.YN && Xiaojp
 */
import com.unmatched.dao.ReplyDao;
import com.unmatched.vo.Reply;
import com.unmatched.vo.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyDao replayDao;

    /**基于主贴id查询主贴详情*/
    @Override
    public Topic findTopicObject(Integer tid) {
        return replayDao.findTopicObject(tid);
    }

    /**基于主贴tid查询关联的回帖信息*/
    @Override
    public List<Reply> findReplyObjects(Integer tid) {
        List<Reply> replyObjects = replayDao.findReplyObjects(tid);
        return replyObjects;
    }

    /**新增回帖信息*/
    @Override
    public int postReply(Reply reply) {
        return replayDao.postReply(reply);
    }
}
