<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE HTML>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加用户</title>
<link href="${pageContext.request.contextPath }/pageResources/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/pageResources/calendar/tcal.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/calendar/tcal.css" />
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" action="">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="输入用户名称" name="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="输入手机号" name="mobile">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>初始化密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="输入密码" name="password">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">系统角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="roleId"class="select" id="roleId">
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账户余额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="number" class="input-text" value="" placeholder="账户余额" name="balance">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="formSubmit()" class="btn btn-secondary radius" type="button">确认添加</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript">
//设置所搜返回后的选中值
$(".select").val("${newsInfo.category}");

//设置滑动按钮 
$('#myswitch').on('switch-change', function (e, data) {
	if(data.value==true){    
	    $('#status').val(1);    
	}else{    
	    $('#status').val(2);
	}    
});

$('#roleId').empty();
$.ajax({
		type : 'get',
		url : "${pageContext.request.contextPath }/role/getRoleListJson",
		dataType : 'json',
		success : function(data) {
			if (data.result) {
				var menusParents = data.data;
				if (menusParents != null){
					for (var i = 0; i < menusParents.length; i++ ){
						var it = '<option value='+menusParents[i].id+'>'+menusParents[i].name+'</option>';
						$('#roleId').append(it);
					}
				} else {
					layer.msg(data.msg, {icon : 5,time : 1000});
				}
			}
		},
		error : function(data) {
			console.log(data.msg);
		}
	});



//确认添加
function formSubmit(){
    if ($("[name='username']").val() == null || $("[name='username']").val() == ""){
		layer.msg("请输入用户名",{icon:5,time:3000});
		return;
	} else if($("[name='mobile']").val() == null || $("[name='mobile']").val() == ""){
		layer.msg("请输入手机号",{icon:5,time:3000});
		return;
	} else if($("[name='password']").val() == null || $("[name='password']").val() == ""){
		layer.msg("请输入初始化密码",{icon:5,time:3000});
		return;
	} else if($("[name='roleId']").val() == null || $("[name='roleId']").val() == ""){
		layer.msg("请选择系统角色",{icon:5,time:3000});
		return;
	}else {
		layer.confirm('确认添加吗？',function(index){
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath }/user/add',
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				data:JSON.stringify({
					"username":$("[name='username']").val(),
					"mobile":$("[name='mobile']").val(),
					"password":$("[name='password']").val(),
					"balance":$("[name='balance']").val(),
					"roleId":$("[name='roleId']").val()
			}),
			success: function(data){
				if (data.result) {
					layer.msg(data.msg,{icon:1,time:2000});
					setTimeout(function(){
						parent.location.reload();
					}, 1200);//1.2秒后返回上一页
				} else {
					layer.msg(data.msg,{icon:5,time:3000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			}
		});
	});
	}


}

</script>
</body>
</html>