package com.lec.dto;

import java.sql.Date;

public class MemberDto {
	private int custno;
	private String custname;
	private String phone;
	private String address;
	private Date joinDate;
	private String grade;
	private String gradename;
	private String city;
	private int sum;
	
	public MemberDto(int custno, String custname, String phone, String address, Date joinDate, String grade,
			String gradename, String city, int sum) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joinDate = joinDate;
		this.grade = grade;
		this.gradename = gradename;
		this.city = city;
		this.sum = sum;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "MemberDto [custno=" + custno + ", custname=" + custname + ", phone=" + phone + ", address=" + address
				+ ", joinDate=" + joinDate + ", grade=" + grade + ", gradename=" + gradename + ", city=" + city
				+ ", sum=" + sum + "]";
	}
	
	
	
	
	
	
	
	
}
