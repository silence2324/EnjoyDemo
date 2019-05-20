package com.unmatched.vo;

import com.unmatched.pojo.Goods;

import java.io.Serializable;

/**
 * 封装商品详情以及对应图片信息vo
 */
public class GoodsImgsVo implements Serializable {
    private static final long serialVersionUID = 1407745994560188370L;
    //商品详情po对象
    private Goods goods;
    private String imge1;//图片
    private String imge2;//图片
    private String imge3;//图片
    private String imge4;//图片

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public String getImge1() {
        return imge1;
    }

    public void setImge1(String imge1) {
        this.imge1 = imge1;
    }

    public String getImge2() {
        return imge2;
    }

    public void setImge2(String imge2) {
        this.imge2 = imge2;
    }

    public String getImge3() {
        return imge3;
    }

    public void setImge3(String imge3) {
        this.imge3 = imge3;
    }

    public String getImge4() {
        return imge4;
    }

    public void setImge4(String imge4) {
        this.imge4 = imge4;
    }
}
