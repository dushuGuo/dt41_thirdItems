package cn.bdqn.datacockpit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.datacockpit.service.CheckService;
import cn.bdqn.datacockpit.utils.IndustrySMS;
@Service
public class CheckServiceImpl implements CheckService {
	

	@Override
    public String sendSms(String phone) {
        
        IndustrySMS is = new IndustrySMS();

        String code = "";
        for (int i = 0; i < 6; i++) {
            code += (int) (Math.random() * 10);
        }
        is.execute(code,phone);
        return code;
    }

	@Override
    public void sendSms2(String phone) {
        
        IndustrySMS is = new IndustrySMS();

        is.execute2(phone);
        
    }
}
