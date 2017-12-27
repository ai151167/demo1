package com.huawei.demo.service;

import java.util.List;

import com.huawei.demo.entity.Department;

public interface IDepartmentService {
	public List<Department> listByDepartment();
	public Department getByDepartmentInfo(int id);
	public void deleteDepartmentById(int id);
	public String saveDepartment(Department department);
}
