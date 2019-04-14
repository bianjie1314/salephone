package com.phone.service;

import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.UserPojo;
import com.phone.pojo.vo.PageViewVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IPhoneService {

    /**
     * 添加信息
     * @param phonePojo
     * @param userPojo
     * @return
     */
    public CommonResult addBean(PhonePojo phonePojo, UserPojo userPojo);

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
     * @param phonePojo
     */
    public CommonResult updateBean(PhonePojo phonePojo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param pageBean
     * @param userInfo
     * @return
     */
    public List<PhonePojo> selectPhoneList(SearchVo searchVo, PageBean pageBean,UserPojo userInfo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param pageBean
     * @return
     */
    public CommonResult selectPhonePage(SearchVo searchVo, PageBean pageBean,UserPojo userInfo);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public PhonePojo getById(int id);


    /**
     * 获取手机类型
     * @return
     */
    public CommonResult selectPhoneType();
}
