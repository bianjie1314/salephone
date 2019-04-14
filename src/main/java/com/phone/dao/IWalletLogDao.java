package com.phone.dao;

import com.phone.pojo.WalletLogPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IWalletLogDao {

    /**
     * 添加信息
     * @param walletLogPojo
     * @return
     */
    public int addBean(WalletLogPojo walletLogPojo);

    /**
     * 批量添加
     * @param beans
     */
    public void insertBatch(@Param("beans") List<WalletLogPojo> beans);
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
     * 查询满足条件的信息
     * @param paramMap
     * @return
     */
    public List<WalletLogPojo> selectWalletLogList(Map<String, Object> paramMap);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public WalletLogPojo getById(int id);


}
