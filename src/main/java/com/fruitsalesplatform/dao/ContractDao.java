package com.fruitsalesplatform.dao;

import com.fruitsalesplatform.entity.Contract;
import com.fruitsalesplatform.entity.ContractVo;
import com.fruitsalesplatform.entity.MiddleTab;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface ContractDao extends BaseDao<Contract> {
    // 这里可以直接使用继承的 BaseDao 的增、删、查、改的方法
    // 添加新的方法定义
    public int count(Map map);                              // 根据条件统计结果集数量
    public List<ContractVo> findContractList(Map map);      // 根据条件查询多个结果
    public void insertMiddleTab(MiddleTab middleTab);       // 插入合同与货物关联信息
    public int deleteMiddleTab(Serializable contractId);    // 删除合同下所有的货物信息
    public String getMaxBarCode();                          // 获取最大合同编号
}
