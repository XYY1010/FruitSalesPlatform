package com.fruitsalesplatform.service;

import com.fruitsalesplatform.entity.Contract;
import com.fruitsalesplatform.entity.ContractVo;
import com.fruitsalesplatform.entity.MiddleTab;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface ContractService {
    public Contract get(Serializable id);                   // 查询合同详情
    public List<ContractVo> findContractList(Map map);            // 根据条件查询合同列表
    public void insert(Contract contract, String[] commoditiesIdArrays, String[] priceArray);                  // 插入合同信息
    public void insertMiddleTab(MiddleTab middleTab);       // 插入合同与货物关联信息
    public void update(Contract contract);                  // 修改合同信息
    public void deleteById(Serializable contractId);        // 删除合同信息
    public void deleteMiddleTab(Serializable contractId);   // 删除合同下关联货物信息
    public String getMaxBarCode();                          // 获取数据库中最大编号
    public int count(Map map);                              // 根据条件统计结果集数量
}
