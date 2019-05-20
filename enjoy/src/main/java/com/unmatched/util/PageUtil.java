package com.unmatched.util;

import com.unmatched.vo.PageObject;

import java.util.List;

/**分页工具类*/
public abstract class PageUtil {//抽象类不能final修饰，允许被继承
    /*泛型方法
     * 泛型是实现通用编程的一种方式可以让代码更加灵活
     * */
    public static <T> PageObject<T> newInstance(Integer pageCurrent, int rowCount, int pageSize, List<T> records) {
        PageObject<T> po = new PageObject<T>();
        po.setPageCurrent(pageCurrent);
        po.setPageSize(pageSize);
        po.setRowCount(rowCount);
        po.setRecords(records);
        po.setPageCount((rowCount - 1) / pageSize + 1);
        return po;
    }
}
