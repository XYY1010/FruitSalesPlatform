package com.fruitsalesplatform.entity;

public class PageEntity {
    private Integer currentPage; // 开始页面
    private Integer startPage;   // 起始数据位置
    private Integer pageSize;    // 每页要取得数据

    public Integer getCurrentPage() {
        if (currentPage == null) {
            currentPage = 1;
        }
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getStartPage() {
        if (startPage == null) {
            startPage = 0;
        }
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public Integer getPageSize() {
        if (pageSize == null) {
            pageSize = 10;
        }
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
