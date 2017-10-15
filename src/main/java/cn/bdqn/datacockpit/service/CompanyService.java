package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Company;
import cn.bdqn.datacockpit.entity.Companyinfo;


public interface CompanyService {

    List<Company> selectAllCompanies();
    
    

}
