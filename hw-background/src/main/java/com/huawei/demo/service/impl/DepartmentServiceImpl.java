package com.huawei.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huawei.demo.entity.Department;
import com.huawei.demo.entity.DepartmentExample;
import com.huawei.demo.entity.mapper.DepartmentMapper;
import com.huawei.demo.service.IDepartmentService;

@Service
public class DepartmentServiceImpl implements IDepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> listByDepartment() {
		DepartmentExample example = new DepartmentExample();
		example.createCriteria().andStatusEqualTo("01");
		List<Department> byExample = departmentMapper.selectByExample(example );
		return byExample;
	}

	@Override
	public Department getByDepartmentInfo(int id) {
		Department department = departmentMapper.selectByPrimaryKey(id);
		return department;
	}

	@Override
	public void deleteDepartmentById(int id) {
		Department department = new Department();
		department.setStatus("00");
		DepartmentExample example = new DepartmentExample();
		example.createCriteria().andDepartmentidEqualTo(id).andStatusEqualTo("01");
		departmentMapper.updateByExampleSelective(department,example);
	}

	@Override
	public String saveDepartment(Department department) {
		if(department.getDepartmentid()!=null&&department.getDepartmentid()>0){
			departmentMapper.updateByPrimaryKeySelective(department);
			return "updateOk";
		}else{
			department.setParentid(0);
			department.setStatus("01");
			department.setCount(0);
			departmentMapper.insertSelective(department);
			return "addOk";
		}
	}
}
