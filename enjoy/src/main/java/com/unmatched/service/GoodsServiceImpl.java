package com.unmatched.service;

import java.util.List;

import com.unmatched.dao.GoodsDao;
import com.unmatched.dao.ImgGoodsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unmatched.pojo.Goods;
import com.unmatched.pojo.Imgs;
import com.unmatched.vo.GoodsImgsVo;

/**
 * 商品业务层实现类
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsDao goodsDao;
    @Autowired
    ImgGoodsDao imgGoodsDao;
    /**
     * 根据itemId查询商品和图片信息
     * @param itemId
     * @return
     */
    @Override
    public GoodsImgsVo findGoodsAndImgByItemId(Integer itemId) {
        //校验参数
        if (itemId==null||itemId<1)
            throw new IllegalArgumentException("请选择一个商品");
        //查询商品信息
        Goods goods = goodsDao.findImgByGoodsId(itemId);
        //获得img_id查询图片信息
        Imgs imgs = imgGoodsDao.findImgs(goods.getImg_id());
        GoodsImgsVo gvo = new GoodsImgsVo();
        //封装成vo对象
        gvo.setGoods(goods);
        gvo.setImge1(imgs.getImge1());
        gvo.setImge2(imgs.getImge2());
        gvo.setImge3(imgs.getImge3());
        gvo.setImge4(imgs.getImge4());
        return gvo;
    }

    /**
     * 根据商品名进行模糊查询
     * @param itemName 商品名
     * @return 商品实体类集合
     */
    @Override
    public List<Goods> SearchByName(String itemName) {
        if (itemName==null||itemName=="")
            return null;
        List<Goods> list = goodsDao.SearchByName(itemName);
        return list;
    }

}
