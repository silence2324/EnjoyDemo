package com.unmatched.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品表实体类
 */
public class Goods implements Serializable {
    private static final long serialVersionUID = -208347990374463070L;
    //商品主键id
    private Integer item_id;
    //商品名
    private String item_name;
    //商品库存
    private Integer num;
    //商品价格
    private Integer price;
    //商品卖点
    private String sell_point;
    //商品图片地址
    private Integer img_id;
    //商品状态(0未上架,1已上架,2已下架)
    private Integer item_status;
    //创建时间
    private Date created_time;
    //修改时间
    private Date modified_time;

    public Integer getItem_id() {
        return item_id;
    }

    public void setItem_id(Integer item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getSell_point() {
        return sell_point;
    }

    public void setSell_point(String sell_point) {
        this.sell_point = sell_point;
    }

    public Integer getImg_id() {
        return img_id;
    }

    public void setImg_id(Integer img_id) {
        this.img_id = img_id;
    }

    public Integer getItem_status() {
        return item_status;
    }

    public void setItem_status(Integer item_status) {
        this.item_status = item_status;
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
        return "Goods{" +
                "item_id=" + item_id +
                ", item_name='" + item_name + '\'' +
                ", num=" + num +
                ", price=" + price +
                ", sell_point='" + sell_point + '\'' +
                ", img_id='" + img_id + '\'' +
                ", item_status=" + item_status +
                ", created_time=" + created_time +
                ", modified_time=" + modified_time +
                '}';
    }
}
