package com.phone.dao;

import com.phone.pojo.EvelatePojo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.UserPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IEvelateDao {

    /**
     * 添加信息
     * @param evelatePojo
     * @return
     */
    public int addBean(EvelatePojo evelatePojo);

    /**
     * 通过id删除
     * @param id
     */
    public void deleteById(int id);

    /**
     * 更新
     * @param evelatePojo
     */
    public void updateBean(EvelatePojo evelatePojo);

    /**
     * 查询满足条件的信息
     * @param paramMap
     * @return
     */
    public List<EvelatePojo> selectEvelateList(Map<String, Object> paramMap);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public EvelatePojo getById(int id);


    /**
     * 通过id集合遍历删除
     * @param ids
     */
    public void deleteByChoiceId(@Param("ids") List ids);

    /**
     * 统计评论数目
     * @param queryMap
     * @return
     */
    public int countEvelateList(Map<String,Object> queryMap);

    /**
     * 批量更新状态
     * @param ids
     * @param status
     */
    public void updateStatus(@Param("ids") List<String> ids,@Param("status") int status);
}
