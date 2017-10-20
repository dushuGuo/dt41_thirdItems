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

import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.bdqn.datacockpit.mapper.XsTableMapper;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;
import cn.bdqn.datacockpit.utils.ImportExecl;

/**
 * Description: <br/>
 * Date: 2017年10月18日 下午3:52:08 <br/>
 * 
 * @author huMZ
 * @version
 * @see
 */
@Service
public class UploadExcelImpl {
    ImportExecl importExecl = new ImportExecl();

    ChineseToPinYin ctpYin = new ChineseToPinYin();

    @Autowired
    private XsTableMapper xsTableMapper;

    /**
     * 
     * Description: 对excel文件进行比对后上传以及存入数据库<br/>
     *
     * @author huMZ
     * @param file
     * @param formula
     * @throws Exception
     */
    public String upload(MultipartFile file, FormulaEvaluator formula) throws Exception {
        StringBuffer message = new StringBuffer();
        String tipInfo = null;
        // 获取文件名
        String fileName = file.getName();
        List<Map<String, Object>> excelList = new ArrayList<Map<String, Object>>();
        // 获取文件名并转换为表名
        String tableName = ctpYin.getPingYin(fileName.substring(0, fileName.lastIndexOf(".")));
        List<String> tableColumnsType = importExecl.changeSqlColumnTypeToJava(xsTableMapper.getColumnType(tableName));
        // 查询表字段名并删除主键字段名
        List<String> columnList = xsTableMapper.getColumnName(tableName);
        if (importExecl.validateExcel(file)) {
            excelList = importExecl.getExceList(importExecl.getWorkbook(file), formula);
            tipInfo = importExecl.checkExcel(excelList, tableColumnsType, columnList);
        }
        return tipInfo;

    }
}
