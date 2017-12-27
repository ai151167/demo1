<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath}/">
<title>Insert title here</title>

<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="/js/department.js"></script>

<script type="text/javascript">
	$(function(){
		$('#add').click(function () {
			$("#myModalLabel").html("添加员工信息");
			limitDepartment();
			save();
			$('#myModal').modal({
				  keyboard: false
			});
			
		});
		
		$(".update").click(function(){
			$("#myModalLabel").html("编辑员工信息");
			var id =$(this).attr("btn_id");
			linitEmployeeInfo(id);
			limitDepartment();
			save();
			$('#myModal').modal({
				  keyboard: false
			});
		});
		
		$(".delete").click(function(){
			var id =$(this).attr("btn_id");
			$.ajax({
				url : "/demo/employee/delete/"+id,
				type : "POST",
				success : function(msg) {
					if (msg == "success") {
						location.href = "demo/employee/list";
					} else {
						alert("删除失败!");
					}
				}
			});
		});
		
		$("#toDepartment").click(function(){
			location.href = "demo/department/toList";
		});
		
		function save(){
			$("#save").click(function(){
				$.ajax({
					url : "/demo/employee/save",
					type : "POST",
					data : $("#saveInfo").serialize(),
					success : function(msg) {
						if (msg == "addOk") {
							location.href = "demo/employee/list";
						} else if(msg == "updateOk"){
							location.href = "demo/employee/list";
						} else {
							alert("保存失败!");
						}
					}
				});
			});
		}
		
		function limitDepartment(){
			$.ajax({
				url: "/demo/department/list",
				type:"POST",
				success:function(data){
					if(data==null){
						$("#chooseDepart").html("<option value='' selected='selected'>暂无部门可选</option>");
					}else{
						var sb ='';
						$.each(data,function(n,value){
							sb +="<option value='"+value.departmentid+"'>"+value.name+"</option>";
						});
						$("#chooseDepart").html(sb);
					}
				}
			});
		}
		
		function linitEmployeeInfo(id){
			$.ajax({
				url: "/demo/employee/info/"+id,
				type:"POST",
				success:function(data){
					if(data==null){
						alert("获取信息失败");
					}else{
						$("#employeeid").val(data.employeeid);
						$("#jobnum").val(data.jobnum);
						$("#name").val(data.name);
						$("#age").val(data.age);
						$("#position").val(data.position);
						$("#mobile").val(data.mobile);
						$("#chooseSex").val(data.sex);
						$("#chooseDepart").val(data.departmentid);
						
					}
				}
			});
		}
		
	});
	
</script>
</head>
<body>
<div class="row">
	<div class="col-md-1"></div>
	  <div class="col-md-10">
		<table class="table table-hover">
			<tr>
				<div class="col-md-3">员工信息表</div>
				<div class="col-md-3 col-md-offset-6"><button type="button" class="btn btn-info" id="add">添加员工</button>
					<button type="button" class="btn btn-info" id="toDepartment" >管理部门信息</button></div>	
			</tr>
				<tr>
					<td>序号</td>
					<td>工号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>年龄</td>
					<td>部门</td>
					<td>职位</td>
					<td>电话</td>
					<td>操作</td>
				</tr>
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="empVo">
						<tr>
							<th></th>
							<th>${empVo.employee.jobnum}</th>
							<th>${empVo.employee.name}</th>
							<c:choose>
								<c:when test="${empVo.employee.sex=='M'}">
									<th>男</th>
								</c:when>
								<c:when test="${empVo.employee.sex=='W'}">
									<th>女</th>
								</c:when>
								<c:otherwise>
									<th>未知</th>
								</c:otherwise>
							</c:choose>
							
							<th>${empVo.employee.age}</th>
							<th>${empVo.department}</th>
							<th>${empVo.employee.position}</th>
							<th>${empVo.employee.mobile}</th>
							<th>
								<button type="button" class="btn btn-info update" btn_id="${empVo.employee.employeeid}">编辑</button>
								<button type="button" class="btn btn-info delete" btn_id="${empVo.employee.employeeid}">删除</button>
							</th>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						暂无数据！
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	  <div class="col-md-1"></div>
</div>
	
	
	<!-- Modal -->
	
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
		     <div class="form-group">
				 <form class="form-signin" action="/demo/employee/save" id="saveInfo">
					    <input type="hidden"  id="employeeid" name="employeeid" value="${employee.employeeid}" />
					        <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default"  type="button">员工编号：</button>
							      </span>
							      <input type="text" class="form-control" id="jobnum" name="jobnum" placeholder="Search for...">
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
				
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default"  type="button">员工姓名：</button>
							      </span>
							      <input type="text" class="form-control" id="name" name="name" placeholder="Search for...">
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
					      <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default"  type="button">员工年龄：</button>
							      </span>
							      <input type="text" class="form-control" id="age" name="age" placeholder="Search for...">
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
					    
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default" type="button">员工性别：</button>
							      </span>
							      <select class="form-control" name="sex" id="chooseSex">
								      	<option value="M">男</option>
								      	<option value="W">女</option>
								  </select>
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
					      
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
								<div class="input-group">
									 <span class="input-group-btn">
							       		 <button class="btn btn-default" type="button">员工部门：</button>
							     	 </span>
							      <select class="form-control" name="departmentid" id="chooseDepart">
								      	<option value=""></option>
								  </select>
								</div>
							  </div>
					      </div>
					      
					      <div class="row"></div>
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default" type="button">员工职位：</button>
							      </span>
							      <input type="text" class="form-control" id="position" name="position" placeholder="Search for...">
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
					      
					      <div class="row"></div>
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default" type="button">员工电话：</button>
							      </span>
							      <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Search for...">
							    </div><!-- /input-group -->
							  </div><!-- /.col-lg-6 -->
					      </div>
					   </form>
				    </div>     

	      		<div class="modal-footer">
	       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	       		 <button type="button" class="btn btn-primary" id="save">保存信息</button>
	     		 </div>
	   		 </div>
	 	 </div>
		</div>
	</div>
</body>
</html>