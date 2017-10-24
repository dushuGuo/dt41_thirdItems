package cn.bdqn.datacockpit.service;

import java.util.List;

import cn.bdqn.datacockpit.entity.Company;

public interface CompanyService {

    List<Company> selectAllCompanies();

    int selectCompany(String compname);

    int insertCompany(String compname);
}
