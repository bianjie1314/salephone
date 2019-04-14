package com.phone.dao;

import com.phone.pojo.ShopPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IShopDao {

    /**
     * 添加信息
     * @param shopPojo
     * @return
     */
    public int addBean(ShopPojo shopPojo);

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
     * @param shopPojo
     */
    public void updateBean(ShopPojo shopPojo);

    /**
     * 查询满足条件的信息
     * @param paramMap
     * @return
     */
    public List<ShopPojo> selectShopList(Map<String, Object> paramMap);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public ShopPojo getById(int id);


    /**
     * 获取用户所属的店铺列表
     * @param userId
     * @return
     */
    public List<ShopPojo> getShopInfo(@Param("userId") int userId);
}
