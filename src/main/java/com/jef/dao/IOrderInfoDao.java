package com.jef.dao;

import com.jef.entity.OrderInfo;

import java.util.List;

public interface IOrderInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    OrderInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);

    /**
     * 根据用户ID查询订单信息
     * @param userId
     * @return
     */
    List<OrderInfo> getByUserId(Long userId);
}