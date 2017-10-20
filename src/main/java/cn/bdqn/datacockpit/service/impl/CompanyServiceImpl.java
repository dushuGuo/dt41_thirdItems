package cn.bdqn.datacockpit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.entity.Company;
import cn.bdqn.datacockpit.mapper.CompanyMapper;
import cn.bdqn.datacockpit.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    public List<Company> selectAllCompanies() {

        return companyMapper.selectAllCompanies();
    }

    @Override
    public int selectCompany(String compname) {

        return companyMapper.selectCompany(compname);
    }

    @Override
    public int insertCompany(String compname) {

        return companyMapper.insertCompany(compname);
    }

}
