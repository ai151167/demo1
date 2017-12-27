package com.huawei.demo.service;

import java.util.List;

import com.huawei.demo.entity.Employee;

public interface IEmployeeService {
	public List<Employee> listByEmployee();
	public Employee getByEmployeeInfo(int id);
	public void deleteEmployeeById(int id);
	public String saveEmployee(Employee Employee);
}
