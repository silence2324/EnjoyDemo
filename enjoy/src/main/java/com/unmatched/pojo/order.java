package com.unmatched.pojo;

import java.io.Serializable;
import java.util.Date;

public class order implements Serializable{
	private static final long serialVersionUID = 7393079110627901355L;
	
	private Integer oid;
	private Integer goods_id;
	private String goods_name;
	private String goods_image;
	private Integer goods_num;
	private String goods_message;
	private Integer uid;
	private String receiver;
	private String phone;
	private String address;
	private Integer total_price;
	private Integer state;
	private Date order_time;
	private Date pay_time;
	private Date created_time;
	private Date modified_time;
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public Integer getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Integer goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_message() {
		return goods_message;
	}
	public void setGoods_message(String goods_message) {
		this.goods_message = goods_message;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public Date getModified_time() {
		return modified_time;
	}
	public void setModified_time(Date modified_time) {
		this.modified_time = modified_time;
	}
	@Override
	public String toString() {
		return "order [oid=" + oid + ", goods_id=" + goods_id + ", goods_name=" + goods_name + ", goods_image="
				+ goods_image + ", goods_num=" + goods_num + ", goods_message=" + goods_message + ", uid=" + uid
				+ ", receiver=" + receiver + ", phone=" + phone + ", address=" + address + ", total_price="
				+ total_price + ", state=" + state + ", order_time=" + order_time + ", pay_time=" + pay_time
				+ ", created_time=" + created_time + ", modified_time=" + modified_time + "]";
	}
	
}
