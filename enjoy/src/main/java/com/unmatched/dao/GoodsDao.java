package com.unmatched.dao;

import com.unmatched.pojo.Goods;

import java.util.List;

/**
 * 商品表
 */
public interface GoodsDao {
    /**
     * 根据商品id查询出商品信息
     * @param itemId
     * @return
     */
    Goods findImgByGoodsId(Integer itemId);

    /**
     * 根据用户输入商品名称模糊查询商品
     * @param itemName
     * @return
     */
    List<Goods> SearchByName(String itemName);
    
}
