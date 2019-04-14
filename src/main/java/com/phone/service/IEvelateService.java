package com.phone.service;

import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.EvelatePojo;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.UserPojo;

import java.util.List;
import java.util.Map;

public interface IEvelateService {

    /**
     * 添加信息
     * @param evelatePojo
     * @return
     */
    public CommonResult addBean(EvelatePojo evelatePojo,UserPojo user);

    /**
     * 通过id删除
     * @param id
     */
    public CommonResult deleteById(int id);

    /**
     * 更新
     * @param evelatePojo
     */
    public CommonResult updateBean(EvelatePojo evelatePojo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param page
     * @return
     */
    public List<EvelatePojo> selectEvelateList(SearchVo searchVo,  PageBean page,UserPojo userInfo);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public EvelatePojo getById(int id);

    /**
     * 批量删除
     * @param choiceId
     * @return
     */
    public CommonResult deleteByChoiceId(String choiceId);

    /**
     * 获取
     * @param searchVo
     * @param pageBean
     * @return
     */
    public CommonResult getEvelatePage(SearchVo searchVo, PageBean pageBean,UserPojo userInfo);


    /**
     * 审核评论
     * @param choiceId
     * @param status
     * @return
     */
    public CommonResult auditEvelate(String choiceId, int status);
}
