<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MovieMadness</title>
<link href="bootstrap/css/shop-homepae.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

<style>
#cartitem {
	display: inline;
}

#welcome {
	display: inline;
	height: 20px;
}

#Login {
	display: inline;
	height: 20px;
}
</style>

</head>
<body>
	<!--Header-->
        
 
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-inner">
		<c:url var="home" value="/home" />
		<a class="brand" href="${home}">MOVIE MADNESS</a> 
                <a
			class="btn btn-navbar" data-toggle="collapse"
			data-target=".nav-collapse"> <span class="icon-bar"></span> <span
			class="icon-bar"></span> <span class="icon-bar"></span>
		</a>

                        <br>
		<div class="nav-collapse collapse">
			<ul class="nav">
				<c:forEach var="categories" items="${categoriesList}">
				<c:url var="url" value="/category">
							<c:param name="category" value="${categories}" />
						</c:url>
                                        <c:out value = "    |    " />
                                        <a href="${url}"> ${categories} </a>
                                        <c:out value = "    |    " />
				</c:forEach>
                            
			</ul>
			<ul class="nav pull-right">
				<a id="cartitem" class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        <span id="itemcount" class="btn btn-default btn-sm">
                                            <i class="icon-shopping-cart icon-red"></i> 
                                            <c:set var="cartItems" scope="session" value="${cart.numberOfItems}" /> 
                                            <span class="headerCartItemsCount"> 
                                                <c:choose>
									<c:when test="${empty cartItems}">0</c:when>
									<c:otherwise>
										<c:out value="${cartItems}" />
									</c:otherwise>
						</c:choose>
						</span> 
                                            <span class="headerCartItemsCountWord">
                                                <c:out value="${cartItems==1?'item':'items'}" />
                                            </span> 
                                            <b class="caret"></b>
                                        </span></a>
                                            
                                        <ul class="dropdown-menu">
						<c:url var="cart" value="/cart" />
						<li><a tabindex="-1" href="${cart}">View Cart</a></li>
						<li><a tabindex="-1" href="final_checkout.jsp">Checkout Cart</a></li>
                                                <li><a tabindex="-1" href="search.jsp">Card Based Search</a></li>
                                        </ul>
                                </li>
                            </ul>
		</div>
	</div>
	</nav>

<!-- Body -->

<form action="/search" method="get">
    <input type="text" id="cardID" placeholder="Enter card number"/>
    <input type="submit" value="Search"/>
</form>             <br> <br> <br>
                    <div class="container">
			<div class="row" style="align:center" >
				<div class="span12" align="center" >
                                    <br> <br>
					<c:forEach var="products" items="${searchResults}">
						<c:url var="url" value="/search">
							<c:param name="cardID" value="cardID" />
						</c:url>
                                                
                                                <div class="span3" style="align-content:center; border:3px solid black; background-color:#F0F0E9"
                                                        <br><br><br>
							<img src="images/small/${products.id}.jpg"/>
                                                        <br><br>
                                                        <a href="${url}">${products.name}</a>
                                                        <br><br>
                                                </div>
					</c:forEach>
                                </div>

			</div>
		</div>
            <br> <br> <br>
</body>
</html>
