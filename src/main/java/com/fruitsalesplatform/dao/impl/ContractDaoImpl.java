package com.fruitsalesplatform.dao.impl;

import com.fruitsalesplatform.dao.ContractDao;
import com.fruitsalesplatform.entity.Contract;
import com.fruitsalesplatform.entity.ContractVo;
import com.fruitsalesplatform.entity.MiddleTab;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository     // 为了包扫描的时候这个时候这个 Dao 被扫描到
public class ContractDaoImpl extends BaseDaoImpl<Contract> implements ContractDao {
    public ContractDaoImpl() {
        // 设置命名空间
        super.setNs("com.fruitsalesplatform.mapper.ContractMapper");
    }
    public int count(Map map) {
        return this.getSqlSession().selectOne(this.getNs() + ".count", map);
    }

    @Override
    public List<ContractVo> findContractList(Map map) {
        return this.getSqlSession().selectList(this.getNs() + ".findContractList", map);
    }

    @Override
    public void insertMiddleTab(MiddleTab middleTab) {
        this.getSqlSession().insert(this.getNs() + ".insertMiddleTab", middleTab);
    }

    @Override
    public int deleteMiddleTab(Serializable contractId) {
        return this.getSqlSession().delete(this.getNs() + ".deleteMiddleTab", contractId);
    }

    @Override
    public String getMaxBarCode() {
        return this.getSqlSession().selectOne(this.getNs() + ".getMaxBarCode");
    }
}
