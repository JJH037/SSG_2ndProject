package com.exam.dto;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("CartDTO")
public class CartDTO {
	
    int num;
    String userid;
    String gCode;
    String gColor;
    int gAmount;
    LocalDate gCartDate;
    
    //GoodsDTO 저장
    List<GoodsDTO> goodsList;
    
	public CartDTO() {}

	public CartDTO(int num, String userid, String gCode,  String gColor, int gAmount, LocalDate gCartDate,
			List<GoodsDTO> goodsList) {
		this.num = num;
		this.userid = userid;
		this.gCode = gCode;
		this.gAmount = gAmount;
		this.gCartDate = gCartDate;
		this.goodsList = goodsList;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}




	public int getgAmount() {
		return gAmount;
	}

	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}

	public LocalDate getgCartDate() {
		return gCartDate;
	}

	public void setgCartDate(LocalDate gCartDate) {
		this.gCartDate = gCartDate;
	}

	public List<GoodsDTO> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<GoodsDTO> goodsList) {
		this.goodsList = goodsList;
	}

	@Override
	public String toString() {
		return "CartDTO [num=" + num + ", userid=" + userid + ", gCode=" + gCode + 
			 ", gAmount=" + gAmount + ", gCartDate=" + gCartDate + ", goodsList=" + goodsList + "]";
	}
	
	
	
   
}
