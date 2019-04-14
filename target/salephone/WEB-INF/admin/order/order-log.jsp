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
	<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
		<thead>
		<tr class="text-c">
			<th width="50">序号</th>
			<th width="50">流程</th>
			<th width="120">时间</th>
		</tr>
	<c:if test="${logList != null }">
		<c:forEach items="${logList }" var="log" varStatus="status">
		<tr class="text-c">
			<td>${status.index+1}</td>
			<td class="td-status">
				<c:choose>
					<c:when test="${log.type == 1}">
						<span class="label label-danger radius">未支付 </span>
					</c:when>
					<c:when test="${log.type == 2}">
						<span class="label label-warning radius">待发货 </span>
					</c:when>
					<c:when test="${log.type == 3}">
						<span class="label label-success radius">待收获 </span>
					</c:when>
					<c:when test="${log.type == 4}">
						<span class="label label-success radius">已签收 </span>
					</c:when>
					<c:when test="${log.type == 5}">
						<span class="label label-success radius">已评价 </span>
					</c:when>
					<c:when test="${log.type == 6}">
						<span class="label label-warning radius">订单取消 </span>
					</c:when>
					<c:when test="${log.type == 7}">
						<span class="label label-default radius">订单完成 </span>
					</c:when>
					<c:when test="${log.type == 8}">
						<span class="label label-warning radius">退货申请 </span>
					</c:when>
					<c:when test="${log.type == 9}">
						<span class="label label-success radius">退货中</span>
					</c:when>
					<c:when test="${log.type == 10}">
						<span class="label label-success radius">退货拒绝</span>
					</c:when>
					<c:when test="${log.type == 11}">
						<span class="label label-success radius">完成退货</span>
					</c:when>
					<c:otherwise>
						<span class="label label-default radius">无效订单</span>
					</c:otherwise>
				</c:choose>
			</td>
			<td class="td-status">
				<fmt:formatDate value="${log.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" />
			</td>
		</c:forEach>
	</c:if>
</div>
<script type="text/javascript">

</script>
</body>
</html>