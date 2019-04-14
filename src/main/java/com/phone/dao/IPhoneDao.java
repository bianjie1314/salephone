package com.phone.dao;

import com.phone.pojo.PhonePojo;
import com.phone.pojo.UserPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IPhoneDao {

    /**
     * 添加信息
     * @param phonePojo
     * @return
     */
    public int addBean(PhonePojo phonePojo);

    /**
     * 通过id删除
     * @param id
     */
    public void deleteById(int id);

    /**
     * 通过id集合遍历删除
     * @param ids
     */
    public void deleteByChoiceId(@Param("ids") List ids);

    /**
     * 更新
     * @param phonePojo
     */
    public void updateBean(PhonePojo phonePojo);

    /**
     * 查询满足条件的信息
     * @param paramMap
     * @return
     */
    public List<PhonePojo> selectPhoneList(Map<String, Object> paramMap);

    /**
     * 查询满足条件的信息
     * @param paramMap
     * @return
     */
    public List<PhonePojo> selectPhonePage(Map<String, Object> paramMap);

    /**
     * 获取手机类型
     * @return
     */
    public List<String> selectPhoneType();

    /**
     * 统计满足条件的信息
     * @param paramMap
     * @return
     */
    public int countPhoneList(Map<String, Object> paramMap);

    /**
     * 统计满足条件的信息
     * @param paramMap
     * @return
     */
    public int countPhonePage(Map<String, Object> paramMap);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public PhonePojo getById(int id);


}
