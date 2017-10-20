/**
 * Project Name:DataCockpit
 * File Name:LoginController.java
 * Package Name:cn.bdqn.datacockpit.controller
 * Date:2017年8月23日上午9:44:48
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.bdqn.datacockpit.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.datacockpit.entity.Companyinfo;
import cn.bdqn.datacockpit.entity.Info;
import cn.bdqn.datacockpit.entity.Userinfo;
import cn.bdqn.datacockpit.service.CompanyService;
import cn.bdqn.datacockpit.service.CompanyinfoService;
import cn.bdqn.datacockpit.service.InfoService;
import cn.bdqn.datacockpit.service.UserinfoService;
import cn.bdqn.datacockpit.utils.Assert;
import cn.bdqn.datacockpit.utils.LoggerUtils;
import cn.bdqn.datacockpit.utils.VerifyCodeUtils;

/**
 * Description: <br/>
 * Date: 2017年8月23日 上午9:44:48 <br/>
 * 
 * @author jiaoHJ
 * @version
 * @see
 */
@Controller
@Scope("prototype")
public class LoginController {
    private static final Exception IncorrectCredentialsException = null;

    @Autowired
    private CompanyinfoService companyinfo;

    @Autowired
    private CompanyService company;

    @Autowired
    private UserinfoService userinfo;

    @Autowired
    private InfoService infoService;

    // 验证码
    @RequestMapping(value = "getYzm")
    public @ResponseBody
    List<String> getYzm(HttpServletResponse response, HttpServletRequest request) {

        List<String> lists = new ArrayList<String>();
        try {
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/jpeg");
            // 生成随机字串
            String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
            // 存入会话session
            HttpSession session = request.getSession(true);
            // 忽略大小写
            session.setAttribute("code", verifyCode.toLowerCase());
            // 生成图片
            int w = 146, h = 33;
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
            lists.add("OK");
            return lists;
        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "获取验证码异常：%s", e.getMessage());
        }
        return lists;

    }

    /**
     * 登录
     * 
     * @param phone
     * @param password
     * @param onLine
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/login2")
    public String login(HttpSession session, String code2, HttpServletResponse res, HttpServletRequest req) {
        session = req.getSession();
        String phone = (String) session.getAttribute("phone");
        List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
        Companyinfo compi = companyinfo.selectByPhoneOrEmail(phone);
        Userinfo ui = userinfo.getByPhoneOrEmail(phone);
        // 从session获取验证码方法中存入的验证码
        String trueCode = (String) session.getAttribute("code");
        // 对比验证码
        if (!trueCode.equalsIgnoreCase(code2)) {
            // 验证码不正确则返回不正确
            req.setAttribute("erroMessage", "*验证码不正确");
        }
        // 根据账号判断该用户属于公司还是管理员
        List<Info> infoList = infoService.selectAllInfo();
        Date time = new Date();
        Date ti1 = new Date(time.getTime() - 2 * 24 * 60 * 60 * 1000);
        for (Info info : infoList) {
            Date date = info.getPublishDate();
            Map<String, Object> map = new HashMap<String, Object>();
            if (ti1.before(date)) {
                map.put("date", 1);
            } else {
                map.put("date", 0);
            }
            map.put("info", info);
            lists.add(map);
        }
        if (compi != null) {
            session.setAttribute("infos", compi);
            session.setAttribute("flag", lists);
            return "redirect:/user_index.shtml";
        }
        // 判断账号密码是否正确（管理员）
        if (ui != null) {
            session.setAttribute("infos", ui);
            session.setAttribute("flag", lists);
            return "redirect:/selectAllCompanyinfo.shtml";
        }
        session.setAttribute("erroMessage", "*账号或者密码输入有误！");
        return "redirect:/login.jsp";
    }

    /*
     * shiro方法登录
     */
    @RequestMapping("/login")
    public String login(Userinfo user, String code2, HttpSession session, HttpServletRequest request) {
        // 首先判断验证码是否正确
        String trueCode = (String) session.getAttribute("code");
        if (!code2.equalsIgnoreCase(trueCode)) {
            session.setAttribute("erroMessage", "*验证码错误！");
            return "redirect:/login.jsp";
        }
        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(user.getPhone(), user.getPassword());
        try {
            subject.login(token);
            Session session2 = subject.getSession();
            session.setAttribute("phone", user.getPhone());
            return "redirect:/login2.shtml";
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("erroMessage", "*用户名或密码错误！");
            return "redirect:/login.jsp";
        }
    }

    /**
     * 注册（申请合作）
     * 
     * @param cominfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/register")
    public String register(Companyinfo cominfo, HttpServletRequest req) {
        String msg = "5";
        try {

            String regex = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";// 手机号的的正则
            String regex1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";// 邮箱的正则

            Boolean phoneFlag = cominfo.getPhone().matches(regex);
            Boolean emailFlag = cominfo.getEmail().matches(regex1);

            Assert.isTrue(phoneFlag, "手机号输入不正确");

            Assert.isTrue(emailFlag, "邮箱输入不正确");

            Assert.isTrue(companyinfo.selectPhoneNum(cominfo.getPhone()) <= 0, "手机号已存在");

            Assert.isTrue(companyinfo.selectEmailNum(cominfo.getEmail()) <= 0, "邮箱已存在");

            // 获取原始密码
            String password = cominfo.getPassword();
            // 加密盐
            String salt = cominfo.getEmail();
            // MD5方式加密，加密次数和配置文件中保持一致
            Md5Hash md5 = new Md5Hash(password, salt, 2);
            // 加密后
            String md5PassWord = md5.toHex();
            // md5.toHex();
            // 存储到用户中去
            cominfo.setPassword(md5PassWord);

            int flag = companyinfo.insert(cominfo);
            if (flag >= 1) {

                if (company.selectCompany(cominfo.getCorpname()) <= 0) {

                    if (company.insertCompany(cominfo.getCorpname()) >= 1) {
                        return "front/shenqing.jsp";
                    }
                }
                return "front/shenqing.jsp";
            } else {
                req.getSession().setAttribute("error", "可能网速不给力，注册失败");
                return "redirect:pages/register.jsp";

            }
        } catch (Exception e) {

            if (e.getMessage() != null) {

                req.getSession().setAttribute("error", e.getMessage());
                msg = "0";
                req.setAttribute("msg", msg);

            }
            e.printStackTrace();

        }
        return "front/register.jsp";
    }

    /**
     * 修改资料，先获取存在session里面的实体类
     * 
     * @param req
     * @return
     */
    @RequestMapping("/updateInfo")
    public String updateInfo(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Companyinfo compi = (Companyinfo) session.getAttribute("infos");
        session.setAttribute("comp", compi);

        return "redirect:/user_update.shtml";
    }

    /**
     * 动态修改资料，修改密码不在此页面
     * 
     * @param company
     * @param req
     * @return
     */
    @RequestMapping("/updateInfo1")
    public String updateInfo1(Companyinfo company, HttpServletRequest req) {
        // System.out.println(company);
        HttpSession session = req.getSession();
        int flag = companyinfo.updateByPrimaryKeySelective(company);
        if (flag >= 1) {
            return "redirect:/user_index.shtml";
        }
        session.setAttribute("message", "*修改失败！");
        return "redirect:/user_update.shtml";
    }

    /**
     * 把密码带到页面
     * 
     * @param req
     * @return
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Companyinfo compi = (Companyinfo) session.getAttribute("infos");
        session.setAttribute("comp", compi);
        return "redirect:/user_pass.shtml";
    }

    /**
     * 修改密码 lllllll[[[
     * 
     * @return
     */
    @RequestMapping("/updatePassword1")
    public String updatePassword1(Companyinfo company) {
        int flag = companyinfo.updateByPrimaryKeySelective(company);
        if (flag >= 1) {
            return "redirect:/user_index.shtml";
        }
        return "redirect:/user_pass.shtml";
    }

    /**
     * 检验注册的手机号码是否存在
     * 
     * @param phone
     * @return
     */
    @RequestMapping("/testPhone")
    @ResponseBody
    public Map<String, Object> testPhone(String phone) {
        int flag = companyinfo.selectPhoneNum(phone);
        System.out.println(phone);
        Map<String, Object> hm = new HashMap<String, Object>();
        if (flag >= 1) {
            hm.put("num", 1);
            hm.put("error", "*您输入的手机号码已存在！");
        } else {
            hm.put("num", 0);
            hm.put("error", "");
        }
        return hm;
    }

    @RequestMapping("/testEmail")
    @ResponseBody
    public Map<String, Object> testEmail(String email) {
        int flag = companyinfo.selectEmailNum(email);
        System.out.println(flag);
        System.out.println(email);
        Map<String, Object> hm = new HashMap<String, Object>();
        if (flag >= 1) {
            hm.put("num", 1);
            hm.put("error", "*您输入的邮箱已存在！");
        } else {
            hm.put("num", 0);
            hm.put("error", "");
        }
        return hm;
    }

    /**
     * 退出登录
     * 
     * @param req
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpServletRequest req) {
        req.getSession().removeAttribute("comp");
        return "front/exit.jsp";
    }

    /**
     * 公告详情
     * 
     * @param req
     * @return
     */
    @RequestMapping("/gongGao")
    public String gongGao(Integer id, Model model) {
        // System.out.println(id);

        Info info = infoService.selectByPrimaryKey(id);
        model.addAttribute("gg", info);
        return "user_gongGao.pages";
    }

    /**
     * 公告详情
     * 
     * @param req
     * @return
     */
    @RequestMapping("/selectTongzhi")
    public String selectTongzhi(Model model) {
        List<Info> lists = infoService.selectAllInfo();
        model.addAttribute("infoList", lists);
        return "user_tongzhi.pages";
    }
}
