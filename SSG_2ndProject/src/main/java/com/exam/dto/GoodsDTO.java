package com.exam.dto;

import lombok.Data;

public class GoodsDTO {
	
    String gCode;
    String gCategory;
    String gName;
    String gContent;
    int gPrice;
    String gImage;
    int stock;  // 추가된 재고 정보 필드
    
    public GoodsDTO() {}

    public GoodsDTO(String gCode, String gCategory, String gName, String gContent, int gPrice, String gImage, int stock) {
        super();
        this.gCode = gCode;
        this.gCategory = gCategory;
        this.gName = gName;
        this.gContent = gContent;
        this.gPrice = gPrice;
        this.gImage = gImage;
        this.stock = stock;
    }

    public String getgCode() {
        return gCode;
    }

    public void setgCode(String gCode) {
        this.gCode = gCode;
    }

    public String getgCategory() {
        return gCategory;
    }

    public void setgCategory(String gCategory) {
        this.gCategory = gCategory;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public String getgContent() {
        return gContent;
    }

    public void setgContent(String gContent) {
        this.gContent = gContent;
    }

    public int getgPrice() {
        return gPrice;
    }

    public void setgPrice(int gPrice) {
        this.gPrice = gPrice;
    }

    public String getgImage() {
        return gImage;
    }

    public void setgImage(String gImage) {
        this.gImage = gImage;
    }

    // 추가된 getter 및 setter
    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "GoodsDTO [gCode=" + gCode + ", gCategory=" + gCategory + ", gName=" + gName + ", gContent=" + gContent
                + ", gPrice=" + gPrice + ", gImage=" + gImage + ", stock=" + stock + "]";
    }
}