package com.huawei.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huawei.demo.entity.Department;
import com.huawei.demo.entity.Employee;
import com.huawei.demo.service.IDepartmentService;
import com.huawei.demo.service.IEmployeeService;
import com.huawei.demo.vo.EmployeeVo;

@Controller
@RequestMapping("/demo/employee")
public class EmployeeController {
	@Autowired
	private IEmployeeService employeeService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@RequestMapping("/list")
	public String getList(ModelMap map){
		List<EmployeeVo> list = new ArrayList<>();
		List<Employee> employeeList = employeeService.listByEmployee();
		if(employeeList!=null&&employeeList.size()>0){
			for (Employee employee : employeeList) {
				Department departmentInfo = departmentService.getByDepartmentInfo(employee.getDepartmentid());
				if(departmentInfo!=null) {
					EmployeeVo employeeVo = new EmployeeVo();
					employeeVo.setDepartment(departmentInfo.getName());
					employeeVo.setEmployee(employee);
					list.add(employeeVo);
				}
				
			}
			
		}
		map.put("list", list);
		return "employee";
	}
	
	@ResponseBody
	@RequestMapping("/info/{id}")
	public Employee getInfo(@PathVariable Integer id){
		Employee employeeInfo = employeeService.getByEmployeeInfo(id);
		return employeeInfo;
	}
	
	@ResponseBody
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Integer id){
		employeeService.deleteEmployeeById(id);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public String save(Employee employee){
		return employeeService.saveEmployee(employee);
	}
}
