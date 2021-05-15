package com.sample.vienna.domain;

import java.util.Date;

public class ComBoardVO {

	int code, cnt;
	String title, type, contents, CBy, RBy, DelYn, DisplayYn;
	Date CDate, RDate;
	

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCBy() {
		return CBy;
	}

	public void setCBy(String cBy) {
		CBy = cBy;
	}

	public String getRBy() {
		return RBy;
	}

	public void setRBy(String rBy) {
		RBy = rBy;
	}

	public String getDelYn() {
		return DelYn;
	}

	public void setDelYn(String delYn) {
		DelYn = delYn;
	}

	public String getDisplayYn() {
		return DisplayYn;
	}

	public void setDisplayYn(String displayYn) {
		DisplayYn = displayYn;
	}

	public Date getCDate() {
		return CDate;
	}

	public void setCDate(Date cDate) {
		CDate = cDate;
	}

	public Date getRDate() {
		return RDate;
	}

	public void setRDate(Date rDate) {
		RDate = rDate;
	}

}
