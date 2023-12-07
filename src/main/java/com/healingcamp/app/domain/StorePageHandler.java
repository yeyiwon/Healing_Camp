package com.healingcamp.app.domain;


public class StorePageHandler {
    private int U_num;
    private String menu;
    private int cate;
    private int sort;
    private int totalCount;
    private int page; // 현재 페이지 번호
    private int recordSize = 16; // 페이지 당 출력할 데이터 수
    private String keyword; // 검색 키워드
    private char option; // 검색 유형

    public int getU_num() {
        return U_num;
    }

    public void setU_num(int u_num) {
        U_num = u_num;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public int getCate() {
        return cate;
    }

    public void setCate(int cate) {
        this.cate = cate;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRecordSize() {
        return recordSize;
    }

    public void setRecordSize(int recordSize) {
        this.recordSize = recordSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public char getOption() {
        return option;
    }

    public void setOption(char option) {
        this.option = option;
    }

    @Override
    public String toString() {
        return "StorePageHandler{" +
                "U_num=" + U_num +
                ", menu='" + menu + '\'' +
                ", cate=" + cate +
                ", sort=" + sort +
                ", totalCount=" + totalCount +
                ", page=" + page +
                ", recordSize=" + recordSize +
                ", keyword='" + keyword + '\'' +
                ", option=" + option +
                '}';
    }
}
