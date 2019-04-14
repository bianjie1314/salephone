<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="${pageContext.request.contextPath }/pageResources/favicon.ico" >
<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/pageResources/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="${pageContext.request.contextPath }/pageResources/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery/1.9.1/jquery.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>店铺名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="输入店铺名称" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">位置：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="location" id="location" placeholder="输入地理位置" value="" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">状态：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="status"class="status">
					<option value="1">正常</option>
					<option value="2">下架</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="description" cols="" rows="" class="textarea"  placeholder="" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)">

				</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="formSubmit()" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认添加</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">

    //确认添加
    function formSubmit(){
        if ($("[name='name']").val() == null || $("[name='name']").val() == ""){
            layer.msg("请输入商品名称",{icon:5,time:3000});
            return;
        } else if($("[name='location']").val() == null || $("[name='location']").val() == ""){
            layer.msg("输入位置",{icon:5,time:3000});
            return;
        } else if($("[name='description']").val() == null || $("[name='description']").val() == ""){
            layer.msg("请输入简介",{icon:5,time:3000});
            return;
        }else {
            layer.confirm('确认添加吗？',function(index){
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath }/shop/add',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    data:JSON.stringify({
                        "name":$("[name='name']").val(),
                        "location":$("[name='location']").val(),
                        "description":$("[name='description']").val(),
                        "status":$("[name='status']").val(),
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