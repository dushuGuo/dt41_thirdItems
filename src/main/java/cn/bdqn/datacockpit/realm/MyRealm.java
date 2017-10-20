package cn.bdqn.datacockpit.realm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.bdqn.datacockpit.entity.Companyinfo;
import cn.bdqn.datacockpit.entity.Userinfo;
import cn.bdqn.datacockpit.service.CompanyinfoService;
import cn.bdqn.datacockpit.service.UserinfoService;

public class MyRealm extends AuthorizingRealm {

    @Autowired
    private UserinfoService userService;

    @Autowired
    private CompanyinfoService companyinfoService;

    /**
     * 为当前登录的用户授予角色和权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 获取令牌
        String phone = (String) principals.getPrimaryPrincipal();
        // 根据phone查询权限数据
        phone = userService.selectByPanduan(phone);
        List<Map<String, Object>> listPermission = userService.selectByPhone(phone);
        // 创建list集合，存储权限数据
        List<String> listPermissions = new ArrayList<String>();
        // 判断
        if (listPermission != null && !listPermission.isEmpty()) {
            for (Map<String, Object> map : listPermission) {
                // 权限名称
                String perName = (String) map.get("per_name");
                // 如果没有就添加进去
                if (!listPermissions.contains(perName)) {
                    // 存储到list集合中
                    listPermissions.add(perName);
                }
            }
        }
        System.out.println(listPermissions);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addStringPermissions(listPermissions);
        // 返回
        return authorizationInfo;
    }

    /**
     * 验证当前登录的用户
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String phone = (String) token.getPrincipal();
        try {
            // 判断userInfo表是否有手机号
            Userinfo user = userService.getByPhoneOrEmail(phone);
            // 判断Compinfo表是否存在
            Companyinfo compi = companyinfoService.selectByPhoneOrEmail(phone);
            // 定义身份认证变量
            AuthenticationInfo authcInfo = null;
            // 判断是企业还是后台用户
            if (user != null) {
                // 获取盐（邮箱）
                String email = user.getEmail();
                // authcInfo = new SimpleAuthenticationInfo(user.getPhone(),
                // user.getPassword(), "xx");
                authcInfo = new SimpleAuthenticationInfo(user.getPhone(), user.getPassword(),
                        ByteSource.Util.bytes(email), "xx");
            }
            if (compi != null) {
                // 获取盐（邮箱）
                String email = compi.getEmail();
                authcInfo = new SimpleAuthenticationInfo(compi.getPhone(), compi.getPassword(),
                        ByteSource.Util.bytes(email), "xx");
                // authcInfo = new SimpleAuthenticationInfo(compi.getPhone(),
                // compi.getPassword(), "xx");
            }
            return authcInfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 清除缓存方法
    public void clearCache() {
        PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
    }
}
