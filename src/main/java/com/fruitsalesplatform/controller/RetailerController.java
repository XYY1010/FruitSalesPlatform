package com.fruitsalesplatform.controller;

import com.alibaba.fastjson.JSONObject;
import com.fruitsalesplatform.entity.Retailer;
import com.fruitsalesplatform.service.RetailerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class RetailerController extends BaseController {
    @Resource
    RetailerService retailerService;
    // 跳转至列表首页
    @RequestMapping("/retailer/list.action")
    public String list(Model model, Retailer retailer, String startTime, String endTime) {
        Map<String, Object> map = this.retailerToMap(retailer);
        if (startTime!=null&&!startTime.equals("")) {
            map.put("startTime", startTime);
        }
        if (endTime!=null&&!endTime.equals("")) {
            map.put("endTime", endTime);
        }
        List<Retailer> retailerList = retailerService.find(map);
        model.addAttribute("list", retailerList);
        model.addAttribute("currentPage", retailer.getCurrentPage());   // 当前页数
        model.addAttribute("startPage", retailer.getStartPage());       // 当前请求位置，默认为0
        int countNumber = retailerService.count(map);
        model.addAttribute("countNumber", countNumber);
        int pageSize = retailer.getPageSize();
        model.addAttribute("pageSize", pageSize);       // 每页数据，默认为10
        int sumPageNumber = countNumber%pageSize==0?(countNumber/pageSize):((countNumber/pageSize)+1);
        model.addAttribute("sumPageNumber", sumPageNumber);     // 总页数
        return "/retailer/retailerHome.jsp";       // 转向首页
    }
    private Map<String, Object> retailerToMap(Retailer retailer) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", checkStringIsEmpty(retailer.getName()));
        map.put("telephone", checkStringIsEmpty(retailer.getTelephone()));
        map.put("address", checkStringIsEmpty(retailer.getAddress()));
        map.put("status", retailer.getStatus()==-1?null:retailer.getStatus());
        map.put("createTime", checkStringIsEmpty(retailer.getCreateTime()));
        map.put("startPage", retailer.getStartPage());
        map.put("pageSize", retailer.getPageSize());
        return map;
    }

    private String checkStringIsEmpty(String param) {
        return param==null?null:(param.equals("")?null:"%" + param + "%");
    }

    @RequestMapping("/retailer/editRetailer.action")
    public @ResponseBody Retailer editRetailer(@RequestBody String json) {
        String id = JSONObject.parseObject(json).getString("id");
        // @ResponseBody 将 Retailer 转换成 JSON 格式输出
        return retailerService.get(id);
    }
    @RequestMapping("/retailer/edit.action")
    public String edit(Model model, Retailer retailer) {
        retailerService.update(retailer);
        // 构建新的列表查询条件，只需分页数据即可
        Retailer queryRetailer = new Retailer();
        queryRetailer.setStartPage(retailer.getStartPage());
        queryRetailer.setCurrentPage(retailer.getCurrentPage());
        queryRetailer.setPageSize(retailer.getPageSize());
        queryRetailer.setStatus(-1);
        return list(model, queryRetailer, null, null);
    }
    @RequestMapping("/retailer/delete.action")
    public String delete(Model model, Retailer retailer) {
        retailerService.deleteById(retailer.getRetailerId());
        // 构建新的列表查询条件，只需分页信息
        Retailer queryRetailer = new Retailer();
        queryRetailer.setStartPage(retailer.getStartPage());
        queryRetailer.setCurrentPage(retailer.getCurrentPage());
        queryRetailer.setPageSize(retailer.getPageSize());
        queryRetailer.setStatus(-1);
        return list(model, queryRetailer,null,null);
    }
    @RequestMapping("/retailer/add.action")
    public String add(Model model, Retailer retailer) {
        retailer.setRetailerId(UUID.randomUUID().toString());
        retailer.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        retailerService.insert(retailer);
        // 构建新的列表查询条件，只需 status 状态即可
        Retailer queryRetailer = new Retailer();
        queryRetailer.setStatus(-1);
        return list(model, queryRetailer, null, null);
    }
}
