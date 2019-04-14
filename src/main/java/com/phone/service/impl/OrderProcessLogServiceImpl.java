package com.phone.service.impl;


import com.phone.common.CommonResult;
import com.phone.common.MessageConstant;
import com.phone.dao.IOrderProcessLogDao;
import com.phone.pojo.OrderProcessLogPojo;
import com.phone.service.IOrderProcessLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class OrderProcessLogServiceImpl implements IOrderProcessLogService {

    @Autowired
    IOrderProcessLogDao iOrderProcessLogDao;

    @Override
    public List<OrderProcessLogPojo> selectByOrderId(int orderId) {
        if (StringUtils.isEmpty(orderId)){
            return null;
        }
        return iOrderProcessLogDao.selectByOrderId(orderId);
    }
}
