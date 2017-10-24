package cn.bdqn.datacockpit.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class GlobalException implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj,
            Exception e) {
        ModelAndView mv = new ModelAndView();
        if (e instanceof UnauthorizedException) {
            mv.addObject("message", "亲，你的权限不足，无权访问！");
        } else {

        }
        mv.setViewName("refuse.page");
        return mv;
    }

}
