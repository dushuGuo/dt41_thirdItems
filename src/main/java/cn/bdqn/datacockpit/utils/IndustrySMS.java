package cn.bdqn.datacockpit.utils;



/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 */
public class IndustrySMS {

    private static String operation = "/industrySMS/sendSMS";

    private static String accountSid = Config.ACCOUNT_SID;
    private static String templateid = "88002963";
    private static String templateid2 = "88123423";

    /**
     * 审核通过通知短信
     */
    public void execute(String param, String to) {
        String url = Config.BASE_URL + operation;
        String body = "accountSid=" + accountSid + "&to=" + to + "&templateid=" + templateid + "&param=" + param
                + HttpUtil.createCommonParam();

        // 提交请求
        String result = HttpUtil.post(url, body);
        System.out.println("result:" + System.lineSeparator() + result);
    }
    
    /**
     * 审核未通过通知短信
     */
    public void execute2(String to) {
        String url = Config.BASE_URL + operation;
        String body = "accountSid=" + accountSid + "&to=" + to + "&templateid=" + templateid2+"&param=" + "很抱歉！您的申请条件不足，审核未通过！" 
                + HttpUtil.createCommonParam();

        // 提交请求
        String result = HttpUtil.post(url, body);
        System.out.println("result:" + System.lineSeparator() + result);
    }
}
