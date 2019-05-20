package com.unmatched.vo;

import java.io.Serializable;

public class JsonResult implements Serializable{
    private static final long serialVersionUID = -5459980427747336519L;
    /**状态码*/
    private int state=1;//1表示SUCCESS,0表示ERROR
    /**状态码对应的状态信息*/
    private String message="ok";
    /**正确数据(输出到客户端的数据)*/
    private Object data;

    public JsonResult() {
    }

    public JsonResult(String message) {
        this.message = message;
    }
    /**一般查询时调用，封装查询结果*/
    public JsonResult(Object data) {
        this.data = data;
    }
    /**通过次构造方法初始化错误信息，出现异常时调用*/
    public JsonResult(Throwable e) {
        this.state =0;
        this.message = e.getMessage();
    }

    public int getState() {
        return state;
    }

    public JsonResult setState(int state) {
        this.state = state;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public JsonResult setMessage(String message) {
        this.message = message;
        return this;
    }

    public Object getData() {
        return data;
    }

    public JsonResult setData(Object data) {
        this.data = data;
        return this;
    }
}
