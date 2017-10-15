/**
 * Project Name:adminlte
 * File Name:JsonController.java
 * Package Name:cn.bdqn.lesson.controller
 * Date:2017年8月21日下午3:45:28
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.datacockpit.datatable.DatatableResult;
import cn.bdqn.datacockpit.datatable.IsSearchCondition;
import cn.bdqn.datacockpit.datatable.SearchCondition;
import cn.bdqn.datacockpit.entity.Company;
import cn.bdqn.datacockpit.entity.Companyinfo;
import cn.bdqn.datacockpit.entity.Info;
import cn.bdqn.datacockpit.entity.Userinfo;
import cn.bdqn.datacockpit.service.CompanyService;
import cn.bdqn.datacockpit.service.CompanyinfoService;
import cn.bdqn.datacockpit.service.InfoService;
import cn.bdqn.datacockpit.service.UserinfoService;
import cn.bdqn.datacockpit.utils.BaseDao;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;

/**
 * Description: <br/>
 * Date: 2017年8月21日 下午3:45:28 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */
@Controller
public class JsonController {
    @Autowired
    private UserinfoService us;

    @Autowired
    private InfoService ifo;

    @Autowired
    private CompanyService companyService;
    
    @Autowired
    private CompanyinfoService companyinfoService;

    @RequestMapping(value = "dt_list")
    public DatatableResult<Userinfo> datatable(@IsSearchCondition SearchCondition searchCondition) {
        DatatableResult<Userinfo> list = new DatatableResult<>();
        Userinfo rec = new Userinfo();
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "dt_list2")
    public DatatableResult<Userinfo> datatable2(@RequestBody SearchCondition searchCondition) {
        DatatableResult<Userinfo> list = new DatatableResult<>();
        List<Userinfo> list2 = us.selectAllUserinfo();
        list.setData(list2);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "dt_lists3")
    public DatatableResult<Info> datatable23(@RequestBody SearchCondition searchCondition) {
        DatatableResult<Info> list = new DatatableResult<>();
        List<Info> list2 = ifo.selectAllInfo();
        list.setData(list2);
        return list;
    }

//============================================================================================    
    /***
     * 
     * @param searchCondition:使用datatable获取companyInfo信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "dt_lists5")
    public DatatableResult<Companyinfo> datatable5(@RequestBody SearchCondition searchCondition) {
        DatatableResult<Companyinfo> list = new DatatableResult<>();
        List<Companyinfo> list2 = companyinfoService.selectAllCompanies();
        list.setData(list2);
        return list;
    }
    
    
    /***
     * 
     * @param searchCondition:使用datatable获取companyInfo信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "dt_lists4")
    public DatatableResult<Company> datatable4(@RequestBody SearchCondition searchCondition) {
        DatatableResult<Company> list = new DatatableResult<>();
        List<Company> list2 = companyService.selectAllCompanies();
        list.setData(list2);
        return list;
    }
    
    /**
     * 
     * @Description (用户——导出数据)
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="/excle")
    public void excle(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String tableName = request.getParameter("tableName");
        String tName = tableName;
        ChineseToPinYin ctp = new ChineseToPinYin();
        HttpSession session = request.getSession();

//      ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
//      Integer cid=user.getCompanyId();
        
        //需修改
        String cid = "8";
        
        String pingYin =cid+ctp.getPingYin(tableName);
        BaseDao base = new BaseDao();
        
        HSSFWorkbook wk  = new HSSFWorkbook();
        
        //设置第一个sheet说明
        Sheet sheet = wk.createSheet("sheet");
        
        List<List<Object>> list = base.getExcel(pingYin);

        for (int i = 0; i < list.size(); i++) {
            Row row = sheet.createRow(i);
            for (int j = 1; j < list.get(i).size()-1; j++) {
                Cell cell = row.createCell(j);
                cell.setCellValue(list.get(i).get(j).toString());
            }
        }
        
        response.setContentType("application/x-execl;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String((tName+".xls").getBytes(), "ISO-8859-1"));
        OutputStream outputStream = response.getOutputStream();
        
        wk.write(outputStream);
        outputStream.flush();
        outputStream.close();
        
        
    }
}
