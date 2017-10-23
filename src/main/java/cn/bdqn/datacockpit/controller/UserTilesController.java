package cn.bdqn.datacockpit.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.bdqn.datacockpit.entity.Info;
import cn.bdqn.datacockpit.entity.Tablecolumninfo;
import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.service.InfoService;
import cn.bdqn.datacockpit.service.TablecolumninfoService;
import cn.bdqn.datacockpit.service.TableinfoService;
import cn.bdqn.datacockpit.service.XsTableService;
import cn.bdqn.datacockpit.service.impl.UploadExcelServiceImpl;
import cn.bdqn.datacockpit.utils.ChineseToPinYin;

@Controller
public class UserTilesController {
    @Autowired
    private TableinfoService ts;

    @Autowired
    private XsTableService xs;

    @Autowired
    private InfoService infoService;

    @Autowired
    private TablecolumninfoService tcs;

    @Autowired
    private UploadExcelServiceImpl uploadExcelserviceImpl;

    @RequestMapping("/user_pass")
    public String pass(Model model) {
        model.addAttribute("checks", "geren2");
        return "user_pass.pages";
    }

    @RequestMapping("/user_update")
    public String update(Model model) {
        model.addAttribute("checks", "geren1");
        return "user_update.pages";
    }

    /**
     * 
     * Description: 转发到用户首页<br/>
     *
     * @author dengJ
     * @param model
     * @return
     */
    @RequestMapping("/user_index")
    public String index(Model model) {
        return "user_index.pages";
    }

    /**
     * 
     * Description: 取通知信息和系统信息并重定向到user_index<br/>
     *
     * @author dengJ
     * @param req
     * @return
     */
    @RequestMapping("/user_second")
    public String userSecond(HttpServletRequest req) {
        List<Info> infoList = infoService.selectAllInfo();
        if (infoList != null) {
            for (Info info : infoList) {
                Date date = info.getPublishDate();
                System.out.println(date);
            }
        }
        HttpSession session = req.getSession();
        session.setAttribute("tongzhi", infoList);
        return "redirect:/user_index.shtml";
    }

    // ===============================================================================
    // ===============================================================================
    /**
     * 
     * @Description (用户——查看数据)
     * @param model
     * @param req
     * @return
     */
    @RequestMapping("/user_shuju3")
    public String shuju3(Model model, HttpServletRequest req) {
        String infoId = req.getParameter("infoId");
        Tableinfo tableinfo = ts.selectByPrimaryKey(Integer.parseInt(infoId));
        String tableName = tableinfo.getPhysicaltablename();
        List<Tablecolumninfo> TablecolumninfoList = tcs.selectView(tableName);
        TablecolumninfoList.get(0).setColumnname("序号");
        HttpSession session = req.getSession();
        session.setAttribute("TablecolumninfoList", TablecolumninfoList);

        model.addAttribute("checks", "shuju3");
        String names = req.getParameter("id");
        ChineseToPinYin ctp = new ChineseToPinYin();
        String name = ctp.getPingYin(names);
        model.addAttribute("infoId", infoId);
        model.addAttribute("name2", names);
        model.addAttribute("name1", name);
        // JdbcUtil jdbc1 = new JdbcUtil();
        // ApplicationContext context = jdbc1.getContext();
        // context = new ClassPathXmlApplicationContext("spring-common.xml");
        // JdbcTemplate jt = (JdbcTemplate) context.getBean("jdbcTemplate");
        return "user_shuju3.pages";
    }

    /**
     * 
     * @Description (用户——上传数据)
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/user_uploads")
    public String upload(Model model, HttpServletRequest request, @RequestParam MultipartFile file) throws Exception {
        String info = uploadExcelserviceImpl.upload(request, file);
        model.addAttribute("tipinfo", info);
        return "user_shuju2.pages";
        // String uploadFilePath =
        // request.getSession().getServletContext().getRealPath("upload" +
        // File.separator)
        // + File.separator;
        // FileItemFactory factory = new DiskFileItemFactory();
        // ServletFileUpload upload = new ServletFileUpload(factory);
        // List<FileItem> fileItemList = upload.parseRequest(request);
        // String tableName = null;
        // for (FileItem item : fileItemList) {
        // if (!item.isFormField()) {
        // String fileName = item.getName();
        // uploadFilePath = uploadFilePath + fileName;
        // System.out.println(uploadFilePath);
        // File file = new File(uploadFilePath);
        // try {
        // item.write(file);
        // } catch (Exception e) {
        // e.printStackTrace();
        // }
        // } else {
        // if (item.getFieldName().equals("hidden")) {
        // tableName = item.getString("UTF-8");
        // }
        // }
        // }
        //
        // ChineseToPinYin ctp = new ChineseToPinYin();
        // // HttpSession session = request.getSession();
        //
        // // ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
        // // Integer cid=user.getCompanyId();
        // // tableName = cid+ctp.getPingYin(tableName);
        //
        // // 需修改
        // int cid = 8;
        // tableName = cid + ctp.getPingYin(tableName);
        // System.out.println(tableName);
        // ImportExecl poi = new ImportExecl();
        // List<List<String>> list = poi.read(uploadFilePath);
        // System.out.println(list);
        // for (List<String> list2 : list) {
        // if (xs.getTableList(tableName) >= list2.size()) {
        // BaseDao baseDao = new BaseDao();
        // baseDao.setExcel(list2, tableName);
        // }
        // }
        // return "user_shuju2.pages";
    }

    // ===============================================================================================
    /**
     * 
     * @Description (用户——跳转到分析任务列表页面)
     * @param model
     * @return
     */
    @RequestMapping("/user_shuju1")
    public String shuju1() {
        return "user_shuju1.pages";
    }

    /**
     * 
     * @Description (用户——跳转到数据关系图页面)
     * @param model
     * @return
     */
    @RequestMapping("/user_guanxitu")
    public String userGuanxitu(Model model) {
        model.addAttribute("checks", "shuju4");
        return "user_guanxitu.pages";
    }

    /**
     * 
     * @Description (用户——跳转到数据列表页面)
     * @param model
     * @return
     */
    @RequestMapping("/user_shuju2")
    public String shuju2(Model model) {
        model.addAttribute("checks", "shuju2");
        return "user_shuju2.pages";
    }

}
