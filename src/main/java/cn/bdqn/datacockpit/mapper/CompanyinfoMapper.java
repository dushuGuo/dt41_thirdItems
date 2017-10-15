package cn.bdqn.datacockpit.mapper;

import java.util.List;

import cn.bdqn.datacockpit.entity.Companyinfo;

public interface CompanyinfoMapper {

    List<Companyinfo> selectAllCompanies();//wb

    List<Companyinfo> selectAllCompaniesByApproval();//wb
    
    int deleteByPrimaryKey(Integer id);//wb

    int insert(Companyinfo record);

    int insertSelective(Companyinfo record);

    Companyinfo selectByPrimaryKey(Integer id);//wb

    Companyinfo selectByPhone(String phone);

    
    
    int updateByPrimaryKeySelective(Companyinfo record);//wb
    

    int updateByPrimaryKey(Companyinfo record);//wb

    int selectPhoneNum(String phone);
}