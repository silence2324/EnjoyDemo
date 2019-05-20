package com.unmatched.vo;

import java.io.Serializable;
import java.util.Date;

public class Reply implements Serializable {
	
	private static final long serialVersionUID = 1503650608720430336L;
	private Integer sid;// 回帖id
	private Integer suid;// 用户id
	private Integer snum;// 对应主贴id
	private Integer stid;// 对应主贴id
	private String scontents;// 回帖内容
	private Date stime;// 回帖时间
	private String suname;//回帖用户
	

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getSuid() {
		return suid;
	}

	public void setSuid(Integer suid) {
		this.suid = suid;
	}

	public Integer getSnum() {
		return snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	public Integer getStid() {
		return stid;
	}

	public void setStid(Integer stid) {
		this.stid = stid;
	}

	public String getScontents() {
		return scontents;
	}

	public void setScontents(String scontents) {
		this.scontents = scontents;
	}

	public Date getStime() {
		return stime;
	}

	public void setStime(Date stime) {
		this.stime = stime;
	}
	
	public String getSuname() {
		return suname;
	}

	public void setSuname(String suname) {
		this.suname = suname;
	}

	@Override
	public String toString() {
		return "Replay [sid=" + sid + ", suid=" + suid + ", snum=" + snum + ", stid=" + stid + ", scontents="
				+ scontents + ", stime=" + stime + ", suname=" + suname + "]";
	}


}
