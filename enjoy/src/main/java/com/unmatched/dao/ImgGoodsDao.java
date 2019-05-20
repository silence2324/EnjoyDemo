package com.unmatched.dao;

import com.unmatched.pojo.Imgs;

public interface ImgGoodsDao {
    /**
     * 根据id查询图片信息
     * @param id
     * @return
     */
    Imgs findImgs(Integer id);

}
