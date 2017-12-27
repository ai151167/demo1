package com.huawei.demo.vo;

import java.io.Serializable;

import com.huawei.demo.entity.Employee;

public class EmployeeVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	private Employee employee;
	
	private String department;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
}
