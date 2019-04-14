package com.phone.service;

import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.ShopPojo;
import com.phone.pojo.UserPojo;

import java.util.List;
import java.util.Map;

public interface IShopService {

    /**
     * 添加信息
     * @param shopPojo
     * @return
     */
    public CommonResult addBean(ShopPojo shopPojo,UserPojo userInfo);

    /**
     * 通过id删除
     * @param id
     */
    public CommonResult deleteById(int id);

    /**
     * 通过id遍历删除
     * @param idStr
     */
    public CommonResult deleteByChoiceId(String idStr);

    /**
     * 更新
     * @param shopPojo
     */
    public CommonResult updateBean(ShopPojo shopPojo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param page
     * @param userInfo
     * @return
     */
    public List<ShopPojo> selectShopList(SearchVo searchVo, PageBean page,UserPojo userInfo);

    /**
     * 更新状态
     * @param id
     * @param status
     * @return
     */
    public CommonResult updateStatus(int id, int status) ;

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public ShopPojo getById(int id);

}
