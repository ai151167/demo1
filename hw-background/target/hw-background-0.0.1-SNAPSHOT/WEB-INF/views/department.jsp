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
			$("#myModalLabel").html("添加部门信息");
			save();
			$('#myModal').modal({
				  keyboard: false
			});
			
		});
		
		$(".update").click(function(){
			$("#myModalLabel").html("编辑部门信息");
			var id =$(this).attr("btn_id");
			linitDepartmentInfo(id);
			save();
			$('#myModal').modal({
				  keyboard: false
			});
		});
		
		$(".delete").click(function(){
			var id =$(this).attr("btn_id");
			$.ajax({
				url : "/demo/department/delete/"+id,
				type : "POST",
				success : function(msg) {
					if (msg == "success") {
						location.href = "demo/department/toList";
					} else {
						alert("删除失败!");
					}
				}
			});
		})
		
		$("#toEmployee").click(function(){
			location.href = "demo/employee/list";
		});
		function save(){
			$("#save").click(function(){
				$.ajax({
					url : "/demo/department/save",
					type : "POST",
					data : $("#saveInfo").serialize(),
					success : function(msg) {
						if (msg == "addOk") {
							location.href = "demo/department/toList";
						} else if(msg == "updateOk"){
							location.href = "demo/department/toList";
						} else {
							alert("保存失败!");
						}
					}
				});
			});
		}
		
		
		function linitDepartmentInfo(id){
			$.ajax({
				url: "/demo/department/info/"+id,
				type:"POST",
				success:function(data){
					if(data==null){
						alert("获取信息失败");
					}else{
						$("#departmentid").val(data.departmentid);
						$("#name").val(data.name);
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
	  <div class="col-md-9">
		<table class="table table-hover">
			<tr>
				<div class="col-md-3">部门信息表</div>
				<div class="col-md-3 col-md-offset-6"><button type="button" class="btn btn-info" id="add">添加部门</button>
				<button type="button" class="btn btn-info" id="toEmployee" >管理员工信息</button></div></div>	
			</tr>
				<tr>
					<td></td>
					<td>序号</td>
					<td>部门</td>
					<td>人数</td>
					<td>操作</td>
				</tr>
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="depart">
						<tr>
							<th></th>
							<th></th>
							<th>${depart.name}</th>
							<th>${depart.count}</th>
							<th>
								<button type="button" class="btn btn-info update" btn_id="${depart.departmentid}">编辑</button>
								<button type="button" class="btn btn-info delete" btn_id="${depart.departmentid}">删除</button>
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
				 <form class="form-signin" action="/demo/department/save" id="saveInfo">
					    <input type="hidden"  id="departmentid" name="departmentid"/>
					       <div class="row">
							  <div class="col-lg-8 col-md-offset-2">
							    <div class="input-group">
							      <span class="input-group-btn">
							        <button class="btn btn-default"  type="button">部门名称：</button>
							      </span>
							      <input type="text" class="form-control" id="name" name="name" placeholder="Search for...">
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