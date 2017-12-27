package com.huawei.demo.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huawei.demo.entity.Department;
import com.huawei.demo.service.IDepartmentService;

@Controller
@RequestMapping("/demo/department")
public class DepartmentController {
	
	@Autowired
	private IDepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/list")
	public List<Department> getList(){
		return departmentService.listByDepartment();
		
	}
	@RequestMapping("/toList")
	public String toList(ModelMap map){
		map.put("list", departmentService.listByDepartment());
		return "department";
	}
	
	@ResponseBody
	@RequestMapping("/info/{id}")
	public Department getInfo(@PathVariable Integer id){
		Department departmentInfo = departmentService.getByDepartmentInfo(id);
		return departmentInfo;
	}
	
	@ResponseBody
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Integer id){
		departmentService.deleteDepartmentById(id);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public String save(Department department){
		return departmentService.saveDepartment(department);
	}
}
