<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>手机销售系统</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/clientlib/css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/clientlib/css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/clientlib/font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/clientlib/fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="${pageContext.request.contextPath }/clientlib/js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="${pageContext.request.contextPath }/clientlib/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/clientlib/js/photo-gallery.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath }/clientlib/js/html5shiv.js"></script>
        <script src="${pageContext.request.contextPath }/clientlib/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--Top-->
<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/top.jsp"/>
<!--noSearch-->
<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/noSearch.jsp"/>
<!--Navigation-->
<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/menu.jsp"/>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Product Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="product">
						<div class="col-md-6">
							<div class="image">
								<c:choose>
									<c:when test="${phoneInfo.pictures != null }"><img src="${pageContext.request.contextPath }${phoneInfo.pictures[0].pathUrl}" style="width:100px;height:220px"  /></c:when>
									<c:otherwise><img src="${pageContext.request.contextPath }/clientlib/images/galaxy-note.jpg" style="width:70px;height:200px"  /></c:otherwise>
								</c:choose>
								<div class="image-more">
									 <ul class="row">
									<c:if test="${phoneInfo.pictures != null }">
										<c:forEach items="${phoneInfo.pictures }" var="pic" varStatus="status">
											<li class="col-lg-3 col-sm-3 col-xs-4">
												<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath }${pic.pathUrl}" style="width:50px;height:110px"></a>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${phoneInfo.pictures == null }">
										<li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath }/clientlib/images/galaxy-note-1.jpg" style="width:50px;height:110px"></a>
										</li>
										<li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath }/clientlib/images/galaxy-note-2.jpg" style="width:50px;height:110px"></a>
										</li>
										<li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath }/clientlib/images/galaxy-note-3.jpg" style="width:50px;height:110px"></a>
										</li>
										<li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath }/clientlib/images/galaxy-note-4.jpg" style="width:50px;height:110px"></a>
										</li>
									</c:if>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="caption">
								<div class="name"><h3>${phoneInfo.name}</h3></div>
								<div class="info">
									<ul>
										<li>型号: ${phoneInfo.type}</li>
										<li>库存数量: ${phoneInfo.storeNum}</li>
										<li>已售数量: ${phoneInfo.offerNum}</li>
									</ul>
								</div>
								<div class="price">售价:￥${phoneInfo.salePrice}
									<s:if test="${phoneInfo.salePrice != phoneInfo.unitPrice}">
										<span>￥${phoneInfo.unitPrice}</span>
									</s:if>
								</div>
								<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								<div class="well"><label>购买: </label> <input class="form-inline quantity" name="buyNum" min="1" type="number" style="width: 60px" value="1"><a href="javascript:;" onclick="addToCar()" class="btn btn-2 ">加入购物车</a></div>
								<div class="share well">
									<strong style="margin-right: 13px;">店铺 :</strong>
									<a href="#" class="share-btn" target="_blank">
										${phoneInfo.shop.name}
									</a>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>	
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#description">简介</a></li>
							<li><a href="#review">详细页面</a></li>
							<li><a href="#evalate">评论</a></li>
						</ul>
						<div class="tab-content">
							<div id="description" class="tab-pane fade in active">
								<p>${phoneInfo.description}</p>
							</div>
							<div id="review" class="tab-pane fade">
								${phoneInfo.htmlText}
							</div>
							<div id="evalate" class="tab-pane fade">
							</div>
						</div>
					</div>
					<div class="product-related">
						<div class="heading"><h2>相似商品</h2></div>
						<div class="products" id="similarProducts">
							<!-- 商品项 -->
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div id="sidebar" class="col-md-4">
					<div class="widget wid-product">
						<div class="heading"><h4>店铺推荐</h4></div>
						<div class="content" id="shopProduct">
							<!-- 店铺商品推荐 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/footer.jsp"/>
	
	<!-- IMG-thumb -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">         
          <div class="modal-body">                
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

	<script src="${pageContext.request.contextPath }/clientlib/js/functions.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/pageResources/newJs/curd.js"></script>
	<script>

		/**
		 * 添加到购物车
		 * */
		function addToCar(){
			//获取相似商品
            $.ajax({
                type : 'post',
                url : "${pageContext.request.contextPath }/client/order/addCar",
                dataType : 'json',
                contentType: 'application/json;charset=UTF-8',
                data:JSON.stringify({
                    "num":$("[name='buyNum']").val(),	//购买数量
                    "phoneId":${phoneInfo.id}	//手机
                }),
                success : function(data) {
                    if (data.result) {
                        layer.msg(data.msg,{icon:1,time:2000});
                        setTimeout(function(){
                            parent.location.href = '${pageContext.request.contextPath }/dispatcher?view=/client/order/cart';
                        }, 1200);//1.2秒后返回上一页
                    } else {
                        layer.msg(data.msg, {icon : 5,time : 1000});
                     }
                },
                error : function(data) {
                    console.log(data.msg);
                }
            });
		}

    $(document).ready(function(){
        $(".nav-tabs a").click(function(){
            $(this).tab('show');
        });
        $('.nav-tabs a').on('shown.bs.tab', function(event){
            var x = $(event.target).text();         // active tab
            var y = $(event.relatedTarget).text();  // previous tab
            $(".act span").text(x);
            $(".prev span").text(y);
        });

        //获取相似商品
        $.ajax({
            type : 'get',
            url : "${pageContext.request.contextPath }/client/phone/getPhonePage",
            dataType : 'json',
            data:{
              "text":"${phoneInfo.name}",	//名称
              "category":"${phoneInfo.type}",	//类型
              "start":0,	//起始页
              "offset":6	//数量
            },
            success : function(data) {
                if (data.result) {
                    var pageViewVo = data.data;//PageViewVo
                    if (pageViewVo.size > 0 && pageViewVo.data != null){
                        for (var i = 0; i < pageViewVo.data.length; i++ ){
                            var phone  = pageViewVo.data[i];
                            debugger

                            if(phone.id == ${phoneInfo.id}){
                                continue;
                            }

                            var pc = ""${pageContext.request.contextPath };
                            if (phone.pictures != null){
                                pc =  '${pageContext.request.contextPath }'+phone.pictures[0].pathUrl;
                            }else {
                                pc = '${pageContext.request.contextPath }/clientlib/images/p'+((i+1)%8+1)+'.jpg';
                            }
                            <!-- 单个手机 -->
                            var productView = ''+
                                '<div class="col-lg-4 col-md-4 col-xs-12">'+
                            		'<div class="product">'+
										'<div class="image"><a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo"><img src="'+pc+'"  style="width:100px;height:200px" /></a></div>'+
										'<div class="buttons">'+
											'<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>'+
											/*'<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>'+
											'<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>'+*/
										'</div>'+
										'<div class="caption">'+
											'<div class="name"><h3><a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo">'+phone.name+'</a></h3></div>'+
											'<div class="price">￥'+phone.salePrice;
											if (phone.salePrice != phone.unitPrice ){
												productView += '<span>￥'+phone.unitPrice+'</span>';
											}
                           				 productView += '</div>' +
											 '<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>'+
										'</div>'+
                            		'</div>'+
								'</div>';
                            $("#similarProducts").append(productView);
                        }
                    }
                } else {
                    layer.msg(data.msg, {icon : 5,time : 1000});
                }
            },
            error : function(data) {
                console.log(data.msg);
            }
        });

        //店铺推荐
        $.ajax({
            type : 'get',
            url : "${pageContext.request.contextPath }/client/phone/getPhonePage",
            dataType : 'json',
            data:{
                "index":"${phoneInfo.shopId}",	//店铺
                "start":0,	//起始页
                "offset":6	//数量
            },
            success : function(data) {
                if (data.result) {
                    var pageViewVo = data.data;//PageViewVo
                    if (pageViewVo.size > 0 && pageViewVo.data != null){
                        for (var i = 0; i < pageViewVo.data.length; i++ ){
                            var phone  = pageViewVo.data[i];
                            var pc = ""${pageContext.request.contextPath };
                            if (phone.pictures != null){
                                pc =  '${pageContext.request.contextPath }'+phone.pictures[0].pathUrl;
                            }else {
                                pc = '${pageContext.request.contextPath }/clientlib/images/p'+((i+1)%8+1)+'.jpg';
                            }

                            if(phone.id == ${phoneInfo.id}){
                                continue;
                            }

                            <!-- 单个手机 -->
                            var productView = ''+
                        		'<div class="product">'+
                                	'<a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo"><img src="'+pc+'"  style="width:70px;height:200px" /></a>'+
									'<div class="wrapper">'+
                                		'<h5><a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo">'+phone.name+'</a></h5>'+
                            			'<div class="price">￥'+phone.salePrice;
										if (phone.salePrice != phone.unitPrice ){
											productView += '<span>￥'+phone.unitPrice+'</span>';
										}
                            productView += '</div>' +
                                		'<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>'+
                            		'</div>'+
                            	'</div>'
                            $("#shopProduct").append(productView);
                        }
                    }
                } else {
                    layer.msg(data.msg, {icon : 5,time : 1000});
                }
            },
            error : function(data) {
                console.log(data.msg);
            }
        });

        //评论
        $.ajax({
            type : 'get',
            url : "${pageContext.request.contextPath }/client/evelate/getEvelatePage",
            dataType : 'json',
            data:{
                "index":"${phoneInfo.id}",	//商品id
                "status":2,
                "start":0,	//起始页
                "offset":10	//数量
            },
            success : function(data) {
                if (data.result) {
                    var pageViewVo = data.data;//PageViewVo
                    if (pageViewVo.size > 0 && pageViewVo.data != null){
                        for (var i = 0; i < pageViewVo.data.length; i++ ){
                            var evelate  = pageViewVo.data[i];
                            var timeStr = timeStamp2String(evelate.createTime);
                            var evelateView = ''+
                        		'<div class="product">'+
									'<div class="wrapper">'+
                            			'<div class="info">'+evelate.user.username+ '  '+timeStr+'</div>'+
                            			'<div class="content">'+evelate.content+'</span></div>'+
                                		'<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>'+
                            		'</div>'+
                            	'</div>'+
								'<hr/>'
                            $("#evalate").append(evelateView);
                        }
                    }
                } else {
                    layer.msg(data.msg, {icon : 5,time : 1000});
                }
            },
            error : function(data) {
                console.log(data.msg);
            }
        });

    });

	</script>
</body>
</html>
