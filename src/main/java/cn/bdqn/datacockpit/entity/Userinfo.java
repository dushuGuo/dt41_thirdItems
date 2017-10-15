/**
 * Project Name:adminlte
 * File Name:Record.java
 * Package Name:cn.bdqn.lesson.model
 * Date:2017年8月21日下午3:47:38
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 */

package cn.bdqn.datacockpit.entity;

import java.util.List;
import java.util.Set;

/**
 * Description: <br/>
 * Date: 2017年8月21日 下午3:47:38 <br/>
 * 
 * @author junwen.bao@airintelli.com
 * @version
 * @see
 */

public class Userinfo {

    private Integer id;

    private String name;

    private String job;

    private String password;

    private String phone;

    private String email;

    private Integer state;

    private List<String> roles;

    private Set<String> permission;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Userinfo [id=" + id + ", name=" + name + ", job=" + job + ", password=" + password + ", phone=" + phone
                + ", email=" + email + ", state=" + state + ", roles=" + roles + ", permission=" + permission + "]";
    }

}
