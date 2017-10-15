package cn.bdqn.datacockpit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.datacockpit.datatable.DatatableResult;
import cn.bdqn.datacockpit.datatable.IsSearchCondition;
import cn.bdqn.datacockpit.datatable.SearchCondition;
import cn.bdqn.datacockpit.entity.Analysistasks;
import cn.bdqn.datacockpit.entity.Datarelation;
import cn.bdqn.datacockpit.entity.Result;
import cn.bdqn.datacockpit.entity.Tableinfo;
import cn.bdqn.datacockpit.service.AnalysistasksService;
import cn.bdqn.datacockpit.service.DatarelationService;
import cn.bdqn.datacockpit.service.ResultService;
import cn.bdqn.datacockpit.service.TableinfoService;
import cn.bdqn.datacockpit.service.XsTableService;
import cn.bdqn.datacockpit.utils.BaseDao;

@Controller
public class Json2Controller {
    @Autowired
    private XsTableService xs;

    @Autowired
    private TableinfoService ts;

    @Autowired
    private DatarelationService datarelationService;

    @Autowired
    private AnalysistasksService analysistasksService;

    @Autowired
    private ResultService resultService;

    // =================================================================
    /**
     * 
     * @Description (平台——数据表管理，查询企业的数据表)
     * @param searchCondition
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shujus_2")
    public DatatableResult<Tableinfo> datatable6(@RequestBody SearchCondition searchCondition, HttpServletRequest req) {
        DatatableResult<Tableinfo> list = new DatatableResult<>();
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");

        Integer id = Integer.parseInt(ids);
        List<Tableinfo> lists = ts.selectAll(id);
        list.setData(lists);
        return list;
    }

    /**
     * 
     * @Description (用户——查看数据，用dataTable查询数据)
     * @param searchCondition
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shuju_3")
    public Map<String, Object> datatable3(@IsSearchCondition SearchCondition searchCondition,
            HttpServletRequest request) {

        HttpSession session = request.getSession();

        // ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
        // Integer cid=user.getCompanyId();

        // 需修改
        String cid = "8";

        String name = cid + request.getParameter("id");
        BaseDao baseDao = new BaseDao();
        List<List<Object>> excel = baseDao.getExcel(name);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", excel);

        return map;
    }

    /**
     * 
     * @Description (用户——数据列表页面，显示数据表)
     * @param searchCondition
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shuju_2")
    public DatatableResult<Tableinfo> datatable(@IsSearchCondition SearchCondition searchCondition,
            HttpServletRequest req) {
        DatatableResult<Tableinfo> list = new DatatableResult<>();
        HttpSession session = req.getSession();

        // ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
        // Integer cid=user.getCompanyId();

        // 需修改
        int cid = 8;

        List<Tableinfo> lists = ts.selectAll(cid);
        list.setData(lists);
        return list;
    }

    // =============================================================================

    /**
     * 
     * @Description (用户——数据关系图页面查询数据表显示)
     * @param datarlation
     * @param req
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/shuju_table")
    public Map<String, Object> shuju_table(Datarelation datarlation, HttpServletRequest req) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        HttpSession session = req.getSession();

        // ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
        // Integer cid=user.getCompanyId();

        // 需修改
        Integer cid = 8;

        List<Tableinfo> tableinfoList = ts.selectAll(cid);
        List<Datarelation> datarelationList = datarelationService.selectByCid(cid);
        map.put("tableinfoList", tableinfoList);
        map.put("datarelationList", datarelationList);
        return map;
    }

    // ======================================================================
    /**
     * 
     * @Description (用户——获取企业的分析任务)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shuju_0")
    public List<Analysistasks> getAllAnalysistasks(HttpServletRequest req) {
        Analysistasks analysistasks = new Analysistasks();
        HttpSession session = req.getSession();

        // ActiveUser user=(ActiveUser)session.getAttribute("activeUser");
        // Integer cid=user.getCompanyId();

        // 需修改
        int cid = 8;

        analysistasks.setCid(cid);
        List<Analysistasks> analysistasks2 = analysistasksService.getAnalysistasks(analysistasks);
        return analysistasks2;
    }

    /**
     * 
     * @Description (用户—— 通过分析任务查看结果)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shuju_1")
    public List<Result> datatable2(HttpServletRequest req) {
        String aid = req.getParameter("aid");
        List<Result> result = resultService.getResult(Integer.parseInt(aid));
        return result;
    }

    /**
     * 
     * @Description (平台——得到公司id，获取所有关联关系)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "shujus_3")
    public DatatableResult<Analysistasks> datatable7(HttpServletRequest req) {
        DatatableResult<Analysistasks> list = new DatatableResult<>();
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");
        Integer id = Integer.parseInt(ids);
        Analysistasks analysistasks = new Analysistasks();
        analysistasks.setCid(id);
        List<Analysistasks> lists = analysistasksService.getAnalysistasks(analysistasks);
        list.setData(lists);
        return list;
    }

    /**
     * 
     * @Description (平台——获取企业表的关联)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getDatarelation")
    public List<Datarelation> getDatarelation(HttpServletRequest req) {
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");
        Integer id = Integer.parseInt(ids);
        List<Datarelation> selectByCid = datarelationService.selectByCid(id);
        return selectByCid;
    }

    /**
     * 
     * @Description (平台——添加分析任务)
     * @param analysistasks
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "saveAnalysis")
    public String saveAnalysis(Analysistasks analysistasks, HttpServletRequest req) {
        HttpSession session = req.getSession();
        String ids = (String) session.getAttribute("No1");
        Integer id = Integer.parseInt(ids);
        analysistasks.setCid(id);
        List<Analysistasks> analysistasks2 = analysistasksService.getAnalysistasks(analysistasks);
        if (analysistasks2.size() == 0) {
            int insertAnalysistasks = analysistasksService.insertAnalysistasks(analysistasks);
            return insertAnalysistasks + "";
        } else {
            return "0";
        }
    }

    /**
     * 
     * @Description (用户—— 启动任务)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "startResult")
    public String startResult(HttpServletRequest req) {
        String aid = req.getParameter("aid");
        Result result = new Result();
        result.setAid(Integer.parseInt(aid));
        result.setStarttime(new Date());
        result.setState(0);
        int insertResult = resultService.insertResult(result);
        return insertResult + "";
    }

    /**
     * 
     * @Description (用户——分析任务页面，显示任务的表关联)
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getDataTable")
    public Datarelation getDataTable(HttpServletRequest req) {
        String parameter = req.getParameter("aid");
        Datarelation datarelation = analysistasksService.getDataTable(Integer.parseInt(parameter));
        return datarelation;
    }
}
