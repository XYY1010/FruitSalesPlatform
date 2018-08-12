package com.fruitsalesplatform.service.impl;

import com.fruitsalesplatform.dao.ContractDao;
import com.fruitsalesplatform.entity.Contract;
import com.fruitsalesplatform.entity.ContractVo;
import com.fruitsalesplatform.entity.MiddleTab;
import com.fruitsalesplatform.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ContractServiceImpl implements ContractService {
    @Autowired
    ContractDao contractDao;
    @Override
    public Contract get(Serializable id) {
        return contractDao.get(id);
    }

    @Override
    public List<ContractVo> findContractList(Map map) {
        return contractDao.findContractList(map);
    }
    @Override
    @Transactional
    public void insert(Contract contract, String[] commoditiesIdArrays, String[] priceArray) {
        contractDao.insert(contract);
        // 保存中间表信息
        for (int i = 0; i < commoditiesIdArrays.length; i++) {
            MiddleTab middleTab = new MiddleTab();
            middleTab.setMiddleId(UUID.randomUUID().toString());     // 中间表 Id
            middleTab.setContractId(contract.getContractId());       // 关联合同 ID
            middleTab.setFruitId(commoditiesIdArrays[i]);            // 关联的货物 ID
            int number = Integer.parseInt(priceArray[i].equals("") ? "0" : priceArray[i]);
            middleTab.setNumber(number);
            this.insertMiddleTab(middleTab);
        }
    }

    @Override
    public void insertMiddleTab(MiddleTab middleTab) {
        contractDao.insertMiddleTab(middleTab);
    }

    @Override
    public void update(Contract contract) {
        contractDao.update(contract);
    }

    @Override
    @Transactional
    public void deleteById(Serializable contractId) {
        // 1.删除合同基本信息
        contractDao.deleteById(contractId);
        // 2.删除中间表以合同 id 为外键的所有货物关联信息
        contractDao.deleteMiddleTab(contractId);
    }

    @Override
    public void deleteMiddleTab(Serializable contractId) {
        contractDao.deleteMiddleTab(contractId);
    }

    @Override
    public String getMaxBarCode() {
        return contractDao.getMaxBarCode();
    }

    @Override
    public int count(Map map) {
        return contractDao.count(map);
    }
}
