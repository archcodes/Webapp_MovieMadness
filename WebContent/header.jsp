<%-- 
    Document   : header
    Created on : Nov 20, 2017, 7:21:57 PM
    Author     : archus
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
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
					<%--<li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="${categories}.jsp">  --%>
                                        <c:out value = "    |    " />
                                        <a href="${categories}.jsp"> ${categories} </a>
                                        <c:out value = "    |    " />
                        <%--</a>--%>  
				</c:forEach>
                            
			</ul>
			<ul class="nav pull-right">
				<li class="dropdown"><a id="cartitem" class="dropdown-toggle" data-toggle="dropdown" href="#">
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
						<li><a tabindex="-1" href="checkout_unreg.jsp">Checkout Cart</a></li>
                                        </ul>
                                </li>
    </body>
</html>
