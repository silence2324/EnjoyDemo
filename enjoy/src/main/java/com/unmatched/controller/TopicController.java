package com.unmatched.controller;

import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Users;
import com.unmatched.service.TopicService;
import com.unmatched.vo.JsonResult;
import com.unmatched.vo.PageObject;
import com.unmatched.vo.Topic;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 主贴呈现
 * @author SiLenCE.YN && Zhaoph
 */
@Controller
public class TopicController {
    @Autowired
    private TopicService topicService;

    /**
     * 存储上传的文件的文件夹名称
     */
    private static final String UPLOAD_DIRECTORY = "builder";

    public static final String UPLOAD_TEMP = "upload";

    /**
     * 允许上传的文件的最大大小：1M
     * 不影响运行效率，在编译时(生成.class文件时)就已经算好了结果
     */
    public static final long UPLOAD_MAX_SIZE = 5 * 1024 * 1024;

    /**
     * 允许上传的类型的集合
     */
    public static final List<String> UPLOAD_CONTENT_TYPES = new ArrayList<String>();

    /**
     * 添加允许上传的文件类型：语义符合，上面用的是static，所以规范使用static{}，且保护初始化时可以最先加载
     * 另一个原因：
     */
    static {
        UPLOAD_CONTENT_TYPES.add("image/jpeg");//性价比最好，所以比较常用，图片质量好，压缩比适当
        UPLOAD_CONTENT_TYPES.add("image/png");//计算机值保存矩形图片，所以异形图片png实际时透明区域，素材图片
        UPLOAD_CONTENT_TYPES.add("image/gif");//同上，动图，分辨率、清晰度不高，
        UPLOAD_CONTENT_TYPES.add("image/bmp");//压缩比最大
    }

    /**查询帖子信息*/
    @RequestMapping("/topicList")
    public ModelAndView topicList(HttpServletRequest request) {
        Object userObj = request.getSession().getAttribute("userInfo");
        Map map = new HashMap(2);
        if (userObj == null) {
            map.put("ok", "-1");
            map.put("userInfo", new Users());
        } else {
            map.put("ok", "0");
            map.put("userInfo", userObj);
        }
        return new ModelAndView("bbs", map);
    }

    /**加载分页信息*/
    @RequestMapping("/doFindPageObjects")
    @ResponseBody
    public JsonResult doFindPageObjects(Integer pageCurrent) {
        PageObject<Topic> pageObject = topicService.findPageObjects(pageCurrent);
        return new JsonResult(pageObject);
    }

    /**新增发帖*/
    @RequestMapping(value = "/newTopic", method = RequestMethod.POST)
    //@ResponseBody
    public String newTopic(Topic topic, HttpServletRequest request,
                           @RequestParam("file") MultipartFile file) {
        //判断上传的文件是否为空：file.isEmpty()
        if (!file.isEmpty()) {
//            return null;
//        }
            //判断文件类型是否在允许的范围内：file.getContentType()
            String contentType = file.getContentType();
            if (!UPLOAD_CONTENT_TYPES.contains(contentType)) {
                //list只需要创建一次，因为是单例模式对象，所以就是static对象，功能上可以利用构造方法即可，但是此例子用的常量，所以使用static块添加类型值
                //static：创建List集合
                //static：向List集合中添加允许上传的文件类型如：image/jpeg  image/png   image/gif
                //list.contains(contentType)
                //是：抛出异常:ServiceException
                throw new ServiceException(
                        "上传文件失败！不支持上传" + contentType + "类型的文件！");
            }
            //判断大小是否超出了限制：file.getSize()
            long size = file.getSize();
            if (size > UPLOAD_MAX_SIZE) {
                //是：抛出异常：FileSizeException
                throw new ServiceException(
                        "上传文件失败！尝试上传的文件大小超出了限制！仅允许上传不超过"
                                + UPLOAD_MAX_SIZE / 1024 / 1024 + "M的文件");
            }
            //确定上传的文件夹
            String parentPath = request.getSession().getServletContext().getRealPath(File.separator+UPLOAD_DIRECTORY);
            String uploadFilePath = parentPath + File.separator + UPLOAD_TEMP;
            File parent = new File(uploadFilePath);
            //判断是否有此路径
            if (!parent.exists()) {
                parent.mkdirs();
            }
            //确定上传的文件名
            String originalFilename = file.getOriginalFilename();
            String suffix = "";//默认没有扩展名
            int beginIndex = originalFilename.lastIndexOf(".");
            if (beginIndex != -1) {
                suffix = originalFilename.substring(beginIndex);
            }
            String filename = UUID.randomUUID() + suffix;
            //执行存储
            File dest = new File(parent, filename);
            try {
                file.transferTo(dest);
            } catch (IOException e) {
                throw new ServiceException(
                        "上传文件失败！出现读写错误，请联系系统管理员，或稍后进行尝试！");
            }
            // 从request中获取session再获取uid
            //Integer tid = getUidFromSession(request.getSession());
            topic.setTimage(UPLOAD_DIRECTORY + File.separator + UPLOAD_TEMP + File.separator + filename);
        }
        Users users = (Users) request.getSession().getAttribute("userInfo");
        topic.setTuid(users.getUid());
        // 将上传的文件路径存储到数据库：service.postTpoic(topic)
        topicService.postTpoic(topic);
        //return new JsonResult("上传成功");
        return "redirect:/topicList";
    }
}
