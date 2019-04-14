package com.phone.pojo.vo;

import com.phone.pojo.MenuPojo;
import com.phone.pojo.RoleMenuPojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色对应的菜单权限
 */
public class RoleMenuVo extends MenuPojo {

    //是否选中
    private boolean check;

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }
}