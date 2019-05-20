package com.unmatched.vo;

import java.io.Serializable;
import java.util.List;

public class PageObject<T> implements Serializable {
    private static final long serialVersionUID = -1140333590925418370L;
    /** 当前页的页码值 */
    private Integer pageCurrent;
    /** 页面大小 */
    private Integer pageSize;
    /** 总行数(通过查询获得) */
    private Integer rowCount;
    /** 总页数(通过计算获得) */
    private Integer pageCount;
    /** 当前页记录 */
    private List<T> records;

    public Integer getPageCurrent() {
        return pageCurrent;
    }

    public PageObject<T> setPageCurrent(Integer pageCurrent) {
        this.pageCurrent = pageCurrent;
        return this;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public PageObject<T> setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public PageObject<T> setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
        return this;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public PageObject<T> setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
        return this;
    }

    public List<T> getRecords() {
        return records;
    }

    public PageObject<T> setRecords(List<T> records) {
        this.records = records;
        return this;
    }

    @Override
    public String toString() {
        return "PageObject{" +
                "pageCurrent=" + pageCurrent +
                ", pageSize=" + pageSize +
                ", rowCount=" + rowCount +
                ", pageCount=" + pageCount +
                ", records=" + records +
                '}';
    }
}
