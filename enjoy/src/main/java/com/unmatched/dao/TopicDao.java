package com.unmatched.dao;

import com.unmatched.vo.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 主贴持久层
 * @author SiLenCE.YN && Zhaoph
 */
public interface TopicDao {

    /**查询当前页数据*/
    public List<Topic> findPageObjects(@Param("startIndex") Integer startIndex,@Param("pageSize") Integer pageSize);
    /**查询总记录数*/
    public int getRowCount();
    /**新增发帖*/
    public void postTopic(Topic topic);
}
