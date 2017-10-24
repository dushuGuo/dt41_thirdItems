/**
 * Project Name:dt41_thirdItems
 * File Name:UploadExcelImpl.java
 * Package Name:cn.bdqn.datacockpit.service.impl
 * Date:2017年10月18日下午3:52:08
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.bdqn.datacockpit.entity.Companyinfo;
import cn.bdqn.datacockpit.entity.Tablecolumninfo;
import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.mapper.TablecolumninfoMapper;
import cn.bdqn.datacockpit.mapper.TableinfoMapper;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;
import cn.bdqn.datacockpit.utils.ImportExecl;
import cn.bdqn.datacockpit.utils.JdbcUtil;

/**
 * Description: <br/>
 * Date: 2017年10月18日 下午3:52:08 <br/>
 * 
 * @author huMZ
 * @version
 * @see
 */
@Service
public class UploadExcelServiceImpl {
    private ImportExecl importExecl = new ImportExecl();

    private ChineseToPinYin ctpYin = new ChineseToPinYin();

    @Autowired
    private TablecolumninfoMapper tablecolumninfoMapper;

    @Autowired
    private TableinfoMapper tableinfoMapper;

    @Autowired
    private Tableinfo tableinfo;

    JdbcUtil jdbcUtil = new JdbcUtil();

    /**
     * 
     * Description: 对excel文件进行比对后上传以及存入数据库<br/>
     *
     * @author huMZ
     * @param file
     * @param formula
     * @throws Exception
     */
    public List<String> upload(HttpServletRequest request, MultipartFile file) throws Exception {
        // 创建提示信息集合
        List<String> message = new ArrayList<String>();
        // 获取公司id
        Companyinfo comi = (Companyinfo) request.getSession().getAttribute("infos");
        Integer cid = comi.getId();
        String companyName = ctpYin.getPingYin(comi.getCorpname());
        // 获取文件名
        String fileName = file.getOriginalFilename();
        List<Map<String, Object>> excelList = new ArrayList<Map<String, Object>>();
        // 获取文件名并转换为表名
        String tableName = cid + ctpYin.getPingYin(fileName.substring(0, fileName.lastIndexOf(".")));
        tableinfo.setPhysicaltablename(tableName);
        tableinfo.setCid(cid);
        if (importExecl.validateExcel(file)) {
            Workbook workbook = importExecl.getWorkbook(file);
            tableinfo.setPhysicaltablename(tableName);
            tableinfo.setCid(cid);
            // 查询表id
            Tableinfo tableinfo1 = tableinfoMapper.selectPrimaryKey(tableinfo);
            if (tableinfo1 != null) {
                Integer tid = tableinfo1.getId();
                // 查询表字段名
                List<Tablecolumninfo> listColumnsName = tablecolumninfoMapper.selectColumnName(tid);
                // 查询表字段类型
                List<Tablecolumninfo> listColumnsType = tablecolumninfoMapper.selectColumnType(tid);
                // 获取表首行数据
                List<String> listTitle = importExecl.getColumns(workbook);
                // 判断表首行数据是否与数据库中的字段名匹配
                if (importExecl.columnIsMatches(listTitle, listColumnsName)) {
                    // 获取excel表中所有数据
                    excelList = importExecl.getExceList(importExecl.getWorkbook(file));
                    message.addAll(importExecl.checkExcel(excelList, listColumnsType, listColumnsName));
                } else {
                    message.add("上传文件首行字段与模板有区别,请检查");
                }

            } else {
                message.add("excel文件名与表名不匹配,请检查");
            }

        } else {
            message.add("上传文件不是excel文件,请检查");
        }
        if (message.size() == 0) {
            jdbcUtil.insertIntoTable(tableName, excelList);
            message.add("数据已上传成功");
            importExecl.uploadExcel(request, file, companyName);
        }
        return message;

    }
}
