package com.unmatched.service;

import com.unmatched.dao.TopicDao;

import com.unmatched.exception.ServiceException;
import com.unmatched.util.PageUtil;
import com.unmatched.vo.PageObject;
import com.unmatched.vo.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 主贴详情
 * @author SiLenCE.YN && Zhaoph
 */
@Service
public class TopicServiceImpl implements TopicService{
    @Autowired
    private TopicDao mapper;
    /**分页查询主帖*/
    @Override
    public PageObject<Topic> findPageObjects(Integer pageCurrent) {
        //1.验证参数合法性
        //1.1验证pageCurrent的合法性，
        //不合法抛出IllegalArgumentException异常
        if(pageCurrent==null||pageCurrent<1)
            throw new IllegalArgumentException("当前页码不正确");
        //2.基于条件查询总记录数
        //2.1) 执行查询
        int rowCount = mapper.getRowCount();
        //2.2) 验证查询结果，假如结果为0不再执行如下操作
        if(rowCount==0)
            throw new ServiceException("系统没有查到对应记录");
        //3.基于条件查询当前页记录(pageSize定义为5)
        //3.1)定义pageSize
        int pageSize=5;
        //3.2)计算startIndex
        int startIndex=(pageCurrent-1)*pageSize;
        //3.3)执行当前数据的查询操作
        List<Topic> records = mapper.findPageObjects(startIndex, pageSize);
        //.返回封装结果,利用工具类
        return PageUtil.newInstance(pageCurrent,rowCount,pageSize,records);
    }
    /**新增发帖*/
    @Override
    public void postTpoic(Topic topic) {
        mapper.postTopic(topic);
    }

}
