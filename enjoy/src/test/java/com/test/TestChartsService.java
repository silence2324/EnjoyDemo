package com.test;

import com.unmatched.dao.ChartsDao;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;

public class TestChartsService {
    @Test
    public void testAgePie(){
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        ChartsDao mapper = ctx.getBean("chartsMapper", ChartsDao.class);
        List<Map<String, Object>> agePie = mapper.agePie();
        System.out.println(agePie);
    }
}
