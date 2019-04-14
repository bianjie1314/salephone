<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pageResources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pageResources/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]--> 
<title>商品数据列表</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<form action="${pageContext.request.contextPath }/phone/getPhoneList" method="get">
		<div class="text-c">
			<span class="select-box inline">
			<select name="category"class="select">
					<option value="" selected="selected">全部分类</option>
					<c:if test="${roleNames != null }">
						<c:forEach items="${roleNames }" var="name" varStatus="status">
							<option value="${name}">&nbsp;&nbsp;&nbsp;${name}</option>
						</c:forEach>
					</c:if>
			</select>
			</span> 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
				id="logmin" class="input-text Wdate" style="width: 120px;" name="startTime" value="${searchVo.startTime}" >
			- <input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
				id="logmax" class="input-text Wdate" style="width: 120px;" name="endTime" value="${searchVo.endTime}" >
			<input type="text"  placeholder=" 商品名称" name="text" value="${searchVo.text}"
				style="width: 250px" class="input-text">
			<button name="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> 搜商品
			</button>
		</div>
		</form>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="return deleteChoice('${pageContext.request.contextPath }/phone/deletePhoneByChoice')" class="btn btn-danger  radius"><i class="Hui-iconfont">&#xe6e2;</i>批量删除</a>
					<a href="javascript:;" onclick="alertShow('添加商品','${pageContext.request.contextPath }/dispatcher?view=admin/phone/phone-add','1000','800')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a>
					</span> <span class="r"><strong></strong> 
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="50">编号</th>
						<th width="120">名称</th>
						<th width="80">原价</th>
						<th width="80">销售价</th>
						<th width="75">型号</th>
						<th width="60">简介</th>
						<th width="100">剩余库存数量</th>
						<th width="80">已经售出储量</th>
						<th width="80">创建时间</th>
						<th width="80">更新时间</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${phoneList != null }">
						<c:forEach items="${phoneList }" var="phone" varStatus="status">
      					<tr class="text-c">
						<td><input type="checkbox" value="${phone.id}" name="choice"></td>
						<td>${status.index+1}</td>
						<td class="text-l">${phone.name}</td>
						<td class="td-status"><span
							class="label label-success radius">${phone.unitPrice}</span></td>
						<td class="td-status"><span
							class="label label-success radius">${phone.salePrice}</span></td>
						<td class="td-status"><span
							class="label label-success radius">${phone.type}</span></td>
						<td class="td-status"><span
							class="label label-success radius">${phone.description}</span></td>
						<td class="td-status"><span
							class="label label-success radius">${phone.storeNum}</span></td>
						<td class="td-status"><span
							class="label label-success radius">${phone.offerNum}</span></td>
						<td class="td-status"><span
							class="label label-success radius"><fmt:formatDate value="${phone.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></span></td>
						<td class="td-status"><span
							class="label label-success radius"><fmt:formatDate value="${phone.updateTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></span></td>
						<td class="f-14 td-manage">
						<a style="text-decoration: none"
							onClick="alertShow('详细信息','${pageContext.request.contextPath }/phone/getPhoneById/${phone.id}?view=admin/phone/phone-info','1000','900')" href="javascript:;"
							title="详细信息"><i class="Hui-iconfont">&#xe111;</i></a>
							 <a style="text-decoration: none" class="ml-5"
							onClick="alertShow('修改信息','${pageContext.request.contextPath }/phone/getPhoneById/${phone.id}?view=admin/phone/phone-edit','1000','900')"
							href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a style="text-decoration: none" class="ml-5"
							onClick="deleteOne(this,'${pageContext.request.contextPath }/phone/delete/${phone.id}')" href="javascript:;"
							title="删除信息"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/pageResources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/pageResources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/newJs/curd.js"></script>
	<script type="text/javascript">
		// 设置所搜返回后的选中值
		$(".select").val("${searchVo.category}");
	</script>
</body>
</html>