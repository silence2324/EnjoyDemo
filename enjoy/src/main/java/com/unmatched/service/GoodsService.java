package com.unmatched.service;

import java.util.List;

import com.unmatched.pojo.Goods;
import com.unmatched.vo.GoodsImgsVo;

public interface GoodsService {
    /**
     * 根据itemId查询商品和图片信息
     * @param itemId
     * @return
     */
    GoodsImgsVo findGoodsAndImgByItemId(Integer itemId);

    /**
     * 根据用户输入的商品名进行模糊查询
     * @param itemName
     * @return
     */
    List<Goods> SearchByName(String itemName);
}
