<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<!--search-->
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/search.jsp"/>
	<!--Navigation-->
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/menu.jsp"/>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
    <div class="copyrights"> <a href="http://www.cssmoban.com/" ></a></div>
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="${pageContext.request.contextPath }/clientlib/images/main-banner1-1903x600.jpg" alt="First slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
								<img src="${pageContext.request.contextPath }/clientlib/images/main-banner2-1903x600.jpg" alt="Second slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
								<img src="${pageContext.request.contextPath }/clientlib/images/main-banner3-1903x600.jpg" alt="Third slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			<div class="row" id="container"></div>
	</div>

	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/client/common/footer.jsp"/>

</body>

<script>

	function searchPhone(inputText){
        //获取最新推荐的列表
		if (inputText == null){
            inputText = $("[name='searchText']").val();
		}
        $.ajax({
            type : 'get',
            url : "${pageContext.request.contextPath }/client/phone/getPhonePage",
            dataType : 'json',
            data:{
              "text":inputText,
              "category":inputText
            },
            success : function(data) {
                if (data.result) {
                    var pageViewVo = data.data;//PageViewVo
                    $("#container").empty();
                    if (pageViewVo.size > 0 && pageViewVo.data != null){
                        for (var i = 0; i < pageViewVo.data.length; i++ ){
                            var phone  = pageViewVo.data[i];
                            var row =  Math.floor(i / 4) ;
                            var col = i % 4 ;
                            var rowId = "products"+row;
                            if (col == 0){//4个一行
                                var rowView = '' +
                                    '<div class="row">'+
                                    '<div class="col-lg-12">'+
                                    '<div class="heading"><h2>最新推荐'+(row+1)+'</h2></div>'+
                                    '<div class="products" id="'+rowId+'"></div>'+
                                    '</div>'+
                                    '</div>';
                                $("#container").append(rowView);
                            }
                            var pc = ""${pageContext.request.contextPath };
                            if (phone.pictures != null){
                                pc =  '${pageContext.request.contextPath }'+phone.pictures[0].pathUrl;
                            }else {
                                pc = '${pageContext.request.contextPath }/clientlib/images/p'+((i+1)%8+1)+'.jpg';
                            }

                            <!-- 单个手机 -->
                            var productView = ''+
                                '<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">'+
                                ' <div class="product">'+
                                '<div class="image"><a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo"><img src="'+pc+'" style="width:150px;height:250px" /></a></div>'+
                                '<div class="buttons">'+<%----%>
                                '<a class="btn cart" href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo"><span class="glyphicon glyphicon-shopping-cart"></span></a>'+
                                /*'<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>'+
                                '<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>'+*/
                                '</div>'+
                                '<div class="caption">'+
                                '<div class="name"><h3><a href="${pageContext.request.contextPath }/client/phone/getPhoneById/'+phone.id+'?view=/client/phoneInfo">'+phone.name+'</a></h3></div>'+
                                '<div class="price">￥'+phone.salePrice;
                            if (phone.salePrice != phone.unitPrice ){
                                productView += '<span>￥'+phone.unitPrice+'</span>';
                            }
                            productView += '</div>'+
                               /* '<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>'+
                                */'</div>'+
                                '</div>'+
                                '</div>';
                            $("#"+rowId).append(productView);

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
	}

    $(document).ready(function(){
        //获取手机列表
        searchPhone();


    });

</script>

</html>
