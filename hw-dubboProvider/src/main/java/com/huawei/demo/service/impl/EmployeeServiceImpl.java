package com.huawei.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huawei.demo.entity.Department;
import com.huawei.demo.entity.Employee;
import com.huawei.demo.entity.EmployeeExample;
import com.huawei.demo.entity.mapper.DepartmentMapper;
import com.huawei.demo.entity.mapper.EmployeeMapper;
import com.huawei.demo.service.IEmployeeService;

@Service
public class EmployeeServiceImpl implements IEmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Employee> listByEmployee() {
		EmployeeExample example = new EmployeeExample();
		example .createCriteria().andStatusEqualTo("01");
		List<Employee> byExample = employeeMapper.selectByExample(example);
		return byExample;
	}

	@Override
	public Employee getByEmployeeInfo(int id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public void deleteEmployeeById(int id) {
		Employee employee = new Employee();
		employee.setStatus("00");
		EmployeeExample example = new EmployeeExample();
		example.createCriteria().andEmployeeidEqualTo(id);
		employeeMapper.updateByExampleSelective(employee,example);
	}

	@Override
	public String saveEmployee(Employee employee) {
		if(employee.getEmployeeid()!=null&&employee.getEmployeeid()>0){
			employeeMapper.updateByPrimaryKeySelective(employee);
			return "updateOk";
		}else{
			employee.setStatus("01");
			employeeMapper.insertSelective(employee);
			Department department = departmentMapper.selectByPrimaryKey(employee.getDepartmentid());
			department.setCount(department.getCount()+1);
			departmentMapper.updateByPrimaryKeySelective(department);
			return "addOk";
		}
	}

}
