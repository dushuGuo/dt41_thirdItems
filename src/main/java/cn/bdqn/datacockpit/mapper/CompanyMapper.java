package cn.bdqn.datacockpit.mapper;

import java.util.List;

import cn.bdqn.datacockpit.entity.Company;

public interface CompanyMapper {

    List<Company> selectAllCompanies();

    int selectCompany(String compname);

    int insertCompany(String compname);
}
