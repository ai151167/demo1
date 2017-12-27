function QueryOrgTreeObj(){
	 
	 var setting = {   
		        data: {    
		            simpleData: {    
		                enable: true  //使用简单 Array格式的数据 
		            }    
		        },
		        async: {    
		            enable: true, //开启异步加载处理   
		            url:"/SSM/tree/orgSubList",    
		            autoParam:["id", "name"],    
		            //otherParam:{"otherParam":"zTreeAsyncTest"},//向后台传入其他参数
		            dataType: "json",//默认text  
		            type:"get"//默认post  
		        }  
		        ,callback:{  
		            onClick:ClickQueryOrgTreeNodeFunc
		        }  
		    };    
	 	   
	     
	     var zNodes=[];  
	     
	     var  zTreeObj  =  $.fn.zTree.init($("#QueryOrgTree"), setting, zNodes); 
	     
 }
