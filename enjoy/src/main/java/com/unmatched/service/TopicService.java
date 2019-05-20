package com.unmatched.service;



import com.unmatched.vo.PageObject;
import com.unmatched.vo.Topic;

/**
 * 主贴详情
 * @author SiLenCE.YN && Zhaoph
 */
public interface TopicService {
    /**
     * 实现分页查询主帖
     * @param pageCurrent 当前页码值
     * @return 当前页记录+分页信息
     */
    public PageObject<Topic> findPageObjects(Integer pageCurrent);
    /**新增发帖*/
    public void postTpoic(Topic topic);
}
