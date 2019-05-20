package com.unmatched.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unmatched.pojo.Goods;
import com.unmatched.service.GoodsService;
import com.unmatched.vo.Bmi;
import com.unmatched.vo.GoodsImgsVo;
import com.unmatched.vo.JsonResult;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    /*1、查询用户表中的信息，显示用户列表*/
    @RequestMapping("goods_byid")
    public String showGoodsByid(Model model,Integer item_id) {
        GoodsImgsVo vo = goodsService.findGoodsAndImgByItemId(item_id);
        Model itemvo = model.addAttribute("itemvo", vo);
        return "details";
    }
    @RequestMapping("get_bmi")
    @ResponseBody
    public JsonResult getBmi(Model model, String height, String weight){
        if (height==""||weight=="")
            throw new IllegalArgumentException("请先输入您的身高或体重");
        Double hheight=Double.parseDouble(height)*Double.parseDouble(height);
        Double bmi=Double.parseDouble(weight)/hheight;
        String statu="正常";
        if (bmi>25)
            statu="过重";
        if (bmi<18)
            statu="过轻";
        Bmi b = new Bmi();
        b.setBmi(bmi);
        b.setStatu(statu);
        JsonResult jr = new JsonResult();
        jr.setData(b);
        return jr;
    }
    
    @RequestMapping("doSearchByName")
    @ResponseBody
    public JsonResult doSearchByName(String itemName){
        List<Goods> list = goodsService.SearchByName(itemName);
        System.out.println(itemName);
        System.out.println("==========");
        return new JsonResult(list);
    }
}
