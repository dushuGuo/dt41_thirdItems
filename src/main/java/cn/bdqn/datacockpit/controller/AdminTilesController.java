package cn.bdqn.datacockpit.controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.datacockpit.entity.Analysistasks;
import cn.bdqn.datacockpit.entity.Companyinfo;
import cn.bdqn.datacockpit.entity.Datarelation;
import cn.bdqn.datacockpit.entity.Info;
import cn.bdqn.datacockpit.entity.Result;
import cn.bdqn.datacockpit.entity.Tablecolumninfo;
import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.entity.UserRole;
import cn.bdqn.datacockpit.entity.Userinfo;
import cn.bdqn.datacockpit.service.AdminTilesService;
import cn.bdqn.datacockpit.service.AnalysistasksService;
import cn.bdqn.datacockpit.service.CompanyinfoService;
import cn.bdqn.datacockpit.service.DatarelationService;
import cn.bdqn.datacockpit.service.InfoService;
import cn.bdqn.datacockpit.service.ResultService;
import cn.bdqn.datacockpit.service.TablecolumninfoService;
import cn.bdqn.datacockpit.service.TableinfoService;
import cn.bdqn.datacockpit.service.UserinfoService;
import cn.bdqn.datacockpit.service.impl.UserRoleServiceImpl;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;
import cn.bdqn.datacockpit.utils.JdbcUtils_40;

@Controller
public class AdminTilesController {
    @Autowired
    private TableinfoService ts;

    @Autowired
    private UserinfoService us;

    @Autowired
    private InfoService is;

    @Autowired
    private UserRoleServiceImpl userRoleServiceImpl;

    @Autowired
    private CompanyinfoService companyinfo;

    @Autowired
    private DatarelationService datarelationService;

    @Autowired
    private AnalysistasksService analysistasksService;

    @Autowired
    private ResultService resultService;

    @Autowired
    private TablecolumninfoService tcs;

    @Autowired
    private AdminTilesService adminTilesService;

    @RequestMapping("/admin_index")
    public String index(Model model) {
        return "admin_index.page";
    }

    @RequestMapping("/admin_pass")
    public String index1(Model model) {
        return "admin_pass.page";
    }

    @RequestMapping("/admin_tongzhi1")
    public String tongzhi1(Model model) {
        model.addAttribute("menus", "1");
        return "admin_tongzhi1.page";
    }

    @RequestMapping("/admin_tongzhi2")
    public String tongzhi2(Model model) {
        return "admin_tongzhi2.page";
    }

    @RequestMapping("/admin_tongzhi3")
    public String tongzhi3(Model model, HttpServletRequest req) {
        // 获取id
        Integer id = Integer.parseInt(req.getParameter("id"));
        Info info = is.selectByPrimaryKey(id);
        model.addAttribute("info", info);
        return "admin_tongzhi3.page";
    }

    @RequestMapping("/tongzhi_update")
    public String tongzhi_update(Info info) {
        // 获取实体类信息
        is.updateByPrimaryKeySelective(info);
        return "admin_tongzhi1.page";
    }

    @RequestMapping("/tongzhi_insert")
    public String tongzhi_insert(Info info) {
        // 获取实体类信息，将新增数据存入数据库
        is.insertSelective(info);
        // 获取本地时间与数据库时间格式一致
        java.util.Date date = new java.util.Date();
        java.sql.Date data1 = new java.sql.Date(date.getTime());
        info.setPublishDate(data1);
        // 获取最新一条记录ID
        Integer infoMax = is.selectMaxId();
        info.setId(infoMax);
        // 将时间存入最后一条记录中
        is.updateByPrimaryKey(info);
        return "admin_tongzhi1.page";
    }

    @RequestMapping("/tongzhi_delete")
    public String tongzhi_delete(HttpServletRequest req) {
        // 获取id
        Integer id = Integer.parseInt(req.getParameter("id"));
        is.deleteByPrimaryKey(id);
        return "admin_tongzhi1.page";
    }

    // 删除内容需要权限
    @RequiresPermissions(value = { "delete" })
    @RequestMapping("/admin_delete")
    public String admin_delete(HttpServletRequest req) {
        // 获取id
        Integer id = Integer.parseInt(req.getParameter("id"));
        // 删除管理员
        us.deleteByPrimaryKey(id);
        // 删除管理员角色表中的对应数据
        userRoleServiceImpl.deleteByUid(id);
        return "admin_shuju4.page";
    }

    @RequestMapping("/adminus_delete")
    public String adminus_delete(HttpServletRequest req) {
        // 获取id
        Integer id = Integer.parseInt(req.getParameter("id"));
        companyinfo.deleteByPrimaryKey(id);
        return "admin_userDsh.page";
    }

    @RequestMapping("/aduser_update")
    public String aduser_update(Model model, HttpServletRequest req) {
        // 获取实体类信息
        Integer id = Integer.parseInt(req.getParameter("id"));
        Companyinfo comp = companyinfo.selectByPrimaryKey(id);
        model.addAttribute("comp", comp);
        return "aduser_update.page";
    }

    @RequestMapping("/adminuss_updatee")
    public String adminuss_updatee(HttpServletRequest req) {
        // 获取实体类信息
        Integer id = Integer.parseInt(req.getParameter("id"));
        Companyinfo comp = companyinfo.selectByPrimaryKey(id);
        comp.setApproval(1);
        companyinfo.updateByPrimaryKey(comp);
        return "admin_userDsh.page";
    }

    /***
     * 
     * @param req:通过id更新approval状态
     * @return
     */
    @RequestMapping("/adminuss_updatee0")
    public String adminuss_updatee0(HttpServletRequest req) {
        // 获取实体类信息
        Integer id = Integer.parseInt(req.getParameter("id"));
        Companyinfo comp = companyinfo.selectByPrimaryKey(id);
        comp.setApproval(0);
        companyinfo.updateByPrimaryKey(comp);
        return "admin_userDsh.page";
    }

    /***
     * 
     * @param req:通过id更新state状态:1
     * @return
     */
    @RequestMapping("/aduser_update1")
    public String aduser_update1(HttpServletRequest req) {
        // 获取实体类信息
        Integer id = Integer.parseInt(req.getParameter("id"));
        Companyinfo comp = companyinfo.selectByPrimaryKey(id);
        comp.setState(1);
        companyinfo.updateByPrimaryKey(comp);
        return "admin_userMan.page";
    }

    /***
     * 
     * @param req:通过id更新state状态:0
     * @return
     */
    @RequestMapping("/aduser_update0")
    public String aduser_update0(HttpServletRequest req) {
        // 获取实体类信息
        Integer id = Integer.parseInt(req.getParameter("id"));
        Companyinfo comp = companyinfo.selectByPrimaryKey(id);
        comp.setState(0);
        companyinfo.updateByPrimaryKey(comp);
        return "admin_userMan.page";
    }

    @RequestMapping("/aduser_update2")
    public String aduser_insert(Companyinfo comps) {
        // 获取实体类信息
        int flag = companyinfo.updateByPrimaryKey(comps);

        System.out.println(flag);
        return "admin_userMan.page";
    }

    @RequestMapping("/admin_shuju2")
    public String shuju2(Model model, HttpServletRequest req) {
        return "admin_shuju2.page";
    }

    @RequestMapping("/admin_shuju4")
    public String shuju4(Model model) {
        model.addAttribute("menus", "2");
        return "admin_shuju4.page";
    }

    @RequestMapping("insertAdminReg")
    public String insertAdminReg(Userinfo record) {
        // 获取原始密码
        String password = record.getPassword();
        // 加密盐
        String salt = record.getEmail();
        // MD5
        Md5Hash md5 = new Md5Hash(password, salt, 2);
        // 加密后
        String md5PassWord = md5.toString();
        // 存储修改后的密码
        record.setPassword(md5PassWord);
        //
        int flag = us.insertSelective(record);
        // 角色用户关联表
        int result = us.selectByMaxId();
        System.out.println(result);
        // 创建对象
        UserRole ur = new UserRole();
        ur.setUid(result);
        ur.setRid(2);
        int result1 = userRoleServiceImpl.insertSelective(ur);
        // 转发
        return "admin_shuju4.page";
    }

    @RequestMapping("/selectAllCompanyinfo")
    public String selectAllCompanyinfo(Model model, HttpServletRequest req) {
        List<Companyinfo> lists = companyinfo.selectAllCompanies();
        model.addAttribute("lists", lists);
        List<Info> infoList = is.selectAllInfo();
        if (infoList != null) {
            for (Info info : infoList) {
                Date date = info.getPublishDate();
                System.out.println(date);
            }
        }
        HttpSession session = req.getSession();
        session.setAttribute("tongzhi", infoList);
        // 转发
        return "admin_index.page";
    }

    // 显示内容需要权限
    @RequiresPermissions(value = { "select" })
    @RequestMapping("/admin_userDsh")
    public String dshCompanyinfo(Model model) {
        // 显示待审核账户
        List<Companyinfo> lists = companyinfo.selectAllCompanies();
        model.addAttribute("menus", "5");
        model.addAttribute("lists", lists);
        // 转发
        return "admin_userDsh.page";
    }

    @RequestMapping("/admin_userMan")
    public String userMan(Model model) {
        List<Companyinfo> lists = companyinfo.selectAllCompanies();
        model.addAttribute("menus", "4");
        model.addAttribute("lists", lists);

        // 转发
        return "admin_userMan.page";
    }

    @RequestMapping("/admin_uppassword")
    public String admin_uppassword(Model model) {
        model.addAttribute("checks", "geren2");
        return "admin_pass.page";
    }

    // 后台添加管理员
    @RequiresPermissions(value = { "add" })
    @RequestMapping("/admin_addUsers")
    public String admin_addUser(Model model) {
        // model.addAttribute("checks", "geren2");
        return "redirect:/admRegister.jsp";
    }

    @RequestMapping("/admin_selects")
    public String selects(Model model) {
        List<Companyinfo> lists = companyinfo.selectAllCompanies();
        System.out.println(lists);
        model.addAttribute("menus", "4");
        model.addAttribute("lists", lists);
        // 转发
        return "admin_userMan.page";
    }

    /**
     * 公告详情
     * 
     * @param req
     * @return
     */
    @RequestMapping("/admin_gongGao")
    public String gongGao1(Integer id, Model model) {
        Info infos = is.selectByPrimaryKey(id);
        model.addAttribute("ggg", infos);
        return "admin_gongGao.page";
    }

    @RequestMapping("/admin_adds")
    public String adds(Model model) {

        List<Companyinfo> lists = companyinfo.selectAllCompanies();
        System.out.println(lists);
        model.addAttribute("menus", "4");
        model.addAttribute("lists", lists);

        // 转发
        return null;
    }

    // =========================================================================
    // =========================================================================
    // =========================================================================
    /**
     * 
     * @param model 平台——企业数据管理
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping("/admin_cominfo")
    public String cominfo(Model model) {
        model.addAttribute("menus", "3");
        return "admin_cominfo.page";
    }

    /**
     * 
     * @Description (平台— 跳转到 数据表管理页面)
     * @param model
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping("/admin_shuju1_1")
    public String shuju1_1(HttpServletRequest req) {
        // 获取企业的id
        String id = req.getParameter("id");
        HttpSession session = req.getSession();
        if (id != null) {
            // 存入session，方便 数据分析管理和分析任务管理页面使用
            session.setAttribute("No1", id);
            // 跳到数据表管理页面
            return "admin_shuju1.page";
        } else {
            String ids = (String) session.getAttribute("No1");
            if (ids != null) {
                // 跳到数据表管理页面
                return "admin_shuju1.page";
            } else {
                // 跳到企业名单页面
                return "admin_cominfo.page";
            }
        }

    }

    /**
     * 
     * @Description (平台——新建数据表)
     * @param id
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping("/admin_create")
    public Map<String, String> creats(@RequestParam("values") String id, HttpServletRequest req) {
        String No1Id = (String) req.getSession().getAttribute("No1");
        String[] attr = id.split(",");
        ChineseToPinYin ctp = new ChineseToPinYin();
        String tbName = No1Id + ctp.getPingYin(attr[1]);
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(dt);
        Tableinfo record = new Tableinfo();
        record.setName(attr[1]);
        record.setUpdatetime(date);
        record.setShowtype(attr[0]);
        record.setPhysicaltablename(tbName);
        Integer cid = Integer.parseInt(No1Id);
        record.setCid(cid);
        ts.insert(record);
        Tableinfo tableinfo = ts.selectPrimaryKey(record);

        return adminTilesService.creats(attr, No1Id, req, tbName, tableinfo);

    }

    /**
     * 
     * @Description (平台——查询数据表的数据详情)
     * @param model
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping("/admin_shujus")
    public String shuju3(Model model, HttpServletRequest req) throws Exception {
        Properties pro = new Properties();
        // 获取jdbc配置文件内容。
        InputStream ips = JdbcUtils_40.class.getClassLoader().getResourceAsStream("jdbc.properties");
        pro.load(ips);
        String driver = pro.getProperty("jdbc.driver");
        String localhost = pro.getProperty("jdbc.url");
        String username = pro.getProperty("jdbc.username");
        String password = pro.getProperty("jdbc.password");
        // 2、加载驱动
        Class.forName(driver);
        // 3、通过java代码连接上数据库(ip、3306、username、password)
        Connection conn = DriverManager.getConnection(localhost, username, password);
        // 4、书写sql语句，执行sql语句，接收结果

        ChineseToPinYin ctpy = new ChineseToPinYin();
        String tableName = req.getParameter("id");
        String tableId = req.getParameter("infoId");
        System.out.println("表的名字是:" + tableName);
        System.out.println("公司id是:" + tableId);
        String tableAllName = tableId + ctpy.getPingYin(tableName);
        System.out.println("表的拼音是:" + tableAllName);
        String sql = "select * from " + tableAllName;

        PreparedStatement stmt;
        stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery(sql);
        ResultSetMetaData data = rs.getMetaData();
        List list = new ArrayList();
        int columnCount = 0;
        for (int i = 1; i <= data.getColumnCount(); i++) {
            // 获得所有列的数目及实际列数
            columnCount = data.getColumnCount();
            // 获得指定列的列名
            String columnName = data.getColumnName(i);
            System.out.println("第" + i + "列的列名是:" + columnName);
            list.add(columnName);
        }
        for (Object lists : list) {
            System.out.println(lists);
        }
        System.out.println("总列数是=" + columnCount);
        req.getSession().setAttribute("tableColumn", list);
        // String infoId = req.getParameter("infoId");
        // Tableinfo tableinfo =
        // ts.selectByPrimaryKey(Integer.parseInt(infoId));
        // String tableName = tableinfo.getPhysicaltablename();
        // List<Tablecolumninfo> TablecolumninfoList =
        // tcs.selectView(tableName);
        // TablecolumninfoList.get(0).setColumnname("序号");
        // HttpSession session = req.getSession();
        // session.setAttribute("TablecolumninfoList", TablecolumninfoList);
        //
        // model.addAttribute("menus", "3");
        // String names = req.getParameter("id");
        //
        // ChineseToPinYin ctp = new ChineseToPinYin();
        // String name = ctp.getPingYin(names);
        // model.addAttribute("name2", names);
        // model.addAttribute("name1", name);
        //
        // JdbcUtil jdbc1 = new JdbcUtil();
        // ApplicationContext context = jdbc1.getContext();
        // context = new ClassPathXmlApplicationContext("spring-common.xml");
        // JdbcTemplate jt = (JdbcTemplate) context.getBean("jdbcTemplate");

        return "admin_shujus.page";
    }

    // =======================================================================

    /**
     * 
     * @Description (平台—跳转到分析任务管理页面)
     * @param model
     * @param req
     * @return
     */
    @RequestMapping("/admin_shuju1_3")
    public String admin_shuju1_3(HttpServletRequest req) {
        HttpSession session = req.getSession();
        // 获取企业的id
        String ids = (String) session.getAttribute("No1");
        if (ids != null) {
            // 跳到分析任务管理页面
            return "admin_shuju1_3.page";
        } else {
            // 跳到企业名单页面
            return "admin_cominfo.page";
        }
    }

    /**
     * 
     * @param model 平台—跳转到 分析任务结果页面
     * @param req
     * @return 得到aid，获取result
     */
    @RequestMapping("/admin_shuju3")
    public String admin_shuju3(Model model, HttpServletRequest req) {
        String aid = req.getParameter("id");
        if (aid != null) {
            List<Result> result = resultService.getResult(Integer.parseInt(aid));
            model.addAttribute("result", result);

            Analysistasks analysistasks = new Analysistasks();
            analysistasks.setId(Integer.parseInt(aid));
            List<Analysistasks> lists = analysistasksService.getAnalysistasks(analysistasks);
            model.addAttribute("message2", lists.get(0));

            return "admin_shuju3.page";
        } else {
            return "admin_shuju1_3.shtml";
        }
    }

    // ==============================================================

    /**
     * 
     * @param model 平台——企业数据关系管理
     * @param req
     * @return
     * @throws Exception
     */
    @RequestMapping("/admin_shuju1_2")
    public String shuju1_2(Model model, HttpServletRequest req) throws Exception {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("No1");
        Integer cid = Integer.parseInt(id);
        List<Datarelation> datarelationList = datarelationService.selectByCid(cid);
        model.addAttribute(datarelationList);
        return "admin_shuju1_2.page";
    }

    /**
     * 
     * @param datarelation 平台——新增数据表关联
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping("/insert_guanlian")
    public Integer insertGL(Datarelation datarelation, HttpServletRequest req) {
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");
        Integer cid = Integer.parseInt(ids);
        datarelation.setCid(cid);
        datarelation.setState(1);
        Integer flag = -2;
        Tableinfo tableinfo1 = ts.selectByPrimaryKey(datarelation.getTid1());
        String tableName1 = tableinfo1.getPhysicaltablename();
        List<Tablecolumninfo> TablecolumninfoList1 = tcs.selectView(tableName1);
        Tableinfo tableinfo2 = ts.selectByPrimaryKey(datarelation.getTid2());
        String tableName2 = tableinfo2.getPhysicaltablename();
        List<Tablecolumninfo> TablecolumninfoList2 = tcs.selectView(tableName2);
        Tablecolumninfo tablecolumninfo1 = TablecolumninfoList1.get(datarelation.getCol1() - 1);
        Tablecolumninfo tablecolumninfo2 = TablecolumninfoList2.get(datarelation.getCol2() - 1);
        String columntype1 = tablecolumninfo1.getColumntype();
        String columntype2 = tablecolumninfo2.getColumntype();
        if (columntype1.equals(columntype2)) {
            flag = datarelationService.insert(datarelation);
            tablecolumninfo1.setTid(datarelation.getTid1());
            tablecolumninfo2.setTid(datarelation.getTid2());
            tcs.insertSelective(tablecolumninfo1);
            tcs.insertSelective(tablecolumninfo2);
            if (flag >= 1)
                return flag;
            else
                return flag;
        } else
            return flag;
    }

    /**
     * 增加方法 平台——获得数据表
     * 
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping("admin_shuju_table")
    public List<Tableinfo> datatable(HttpServletRequest req) {
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");
        Integer id = Integer.parseInt(ids);
        List<Tableinfo> lists = ts.selectAll(id);
        return lists;
    }

    /**
     * 增加方法 平台——获得数据表关联集合
     * 
     * @param id
     * @param req
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/admin_shuju_datarelation")
    public List<Tablecolumninfo> shuju_datarelation(Integer id, HttpServletRequest req) throws Exception {
        Tableinfo tableinfo = ts.selectByPrimaryKey(id);
        String tableName = tableinfo.getPhysicaltablename();
        List<Tablecolumninfo> TablecolumninfoList = tcs.selectView(tableName);
        return TablecolumninfoList;
    }

    /**
     * 
     * @param datarlation 平台——修改数据表关联状态
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/admin_shuju_updateByState")
    public Integer shuju_updateByState(Datarelation datarlation) throws Exception {
        return datarelationService.updateByPrimaryKeySelective(datarlation);
    }

    /**
     * 
     * Description: <br/>
     * 
     * @author shuY
     * @param ma
     * @param id
     * @param option
     * @return
     */
    @RequestMapping("/shujus_updatebyid")
    @ResponseBody
    public Integer shujus_updatebyid(Integer id, Integer option) {
        Tableinfo tableinfo = new Tableinfo();
        tableinfo.setId(id);
        tableinfo.setState(option);
        System.out.println(tableinfo);
        System.out.println(option);
        return ts.shujus_updatebyid(tableinfo);
    }
}
