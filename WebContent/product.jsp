<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://onlinekart.com/commonFunctions" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MovieMadness</title>
<link href="bootstrap/css/shop-homepae.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css"
	rel="stylesheet">
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<style>
body {
	background-color: white;
}

#cartitem {
	display: inline;
}

#welcome {
	display: inline;
	height: 20px;
}
</style>
</head>
<body>
	<!--Header-->
	<header> <nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-inner">
		<a class="brand" href="home.jsp">MOVIE MADNESS</a> <a
			class="btn btn-navbar" data-toggle="collapse"
			data-target=".nav-collapse"> <span class="icon-bar"></span> <span
			class="icon-bar"></span> <span class="icon-bar"></span>
		</a>

		<div class="nav-collapse collapse">
			<ul class="nav">
				<c:forEach var="categories" items="${product.category}">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <c:out
								value="${product.category}" /></b>
					</a>

						
				</c:forEach>
			</ul>
			<ul class="nav pull-right">
				<li class="dropdown"><a id="cartitem" class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span id="itemcount"
						class="btn btn-default btn-sm"><i
							class="icon-shopping-cart icon-red"></i> <c:set var="cartItems"
								scope="session" value="${cart.numberOfItems}" /> <span
							class="headerCartItemsCount"> <c:choose>
									<c:when test="${empty cartItems}">0
							</c:when>
									<c:otherwise>
										<c:out value="${cartItems}" />
									</c:otherwise>
								</c:choose>
						</span> <span class="headerCartItemsCountWord"><c:out
									value="${cartItems==1?'item':'items'}" /></span> <b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="cart">View Cart</a></li>
						<li><a tabindex="-1" href="checkout">Checkout Cart</a></li>
					</ul></li>
				
			</ul>
		</div>
	</div>
	</nav> </header>

	<!-- Body -->
	<section>
	<div class="container">
		<ul class="breadcrumb">
			<li class="active"><c:url var="url" value="/category">
					<c:param name="categ" value="${product.category}" />
				</c:url> <a href="${product.category}.jsp">${product.category}</a> <span class="divider">/</span></li>
			<li class="active">${product.name}</li>
		</ul>
		<div class="row">
			<div class="span6">
                            <br><br>
				<input type="hidden" value="${product.id}" name="id">
				<p class="lead">${product.name}</p>
				<a href="#themodal" role="button" id="btn-buynow"
					class="btn btn-primary pull-right" data-toggle="modal">Buy Now</a>
				<p>$ ${product.price}</p>
				<br>
				<p>${product.details}</p>
			</div>
			<div id="themodal" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3>Add Item to the Cart</h3>
				</div>

				<div class="modal-body">
					<c:choose>
						<c:when test="${f:checkProductInCart(pageContext)}">
							<p class="text-warning">Product - ${product.name} is
								already added to your Shopping Cart.</p>
						</c:when>
						<c:otherwise>
							<p class="text-success">Product - ${product.name} will
								be added to your Shopping Cart.</p>
						</c:otherwise>
					</c:choose>

					<hr />
					<div>
						<table class="table table-condensed">
							<thead>
								<tr>
									<td>Product</td>
									<td>Price</td>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td><img src="images/small/${product.id}.jpg" /></td>
									<td class="price">$ ${product.price}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<form method="post" action="addProducts" class="addCartForm">
							<c:choose>
								<c:when test="${f:checkProductInCart(pageContext)}">
									<button class="btn btn-primary pull-left" id="disabledbutton"
										onload="disableButton">In Cart!</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-primary pull-left" id="addtocart">Add
										to Cart</button>
								</c:otherwise>
							</c:choose>

							<a href="#" class="btn btn-primary pull-right" data-dismiss="modal">Continue
								Shopping</a> 
						</form>
					</div>
				</div>
			</div>
			<div class="span3" >
                            <br> <br> <br> <br>
				<img alt="${product.name}"
					src="images/small/${product.id}.jpg" />
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
	<script>
		var productPrice = "${product.price}";
		var productId = "${product.id}";

		function updateHeaderCartItemsCount(newCount) {
			$('.headerCartItemsCount').html(newCount);
			$('.headerCartItemsCountWord').html(
					(newCount === 1) ? ' item' : ' items');
		}

		function ajax(options, callback) {
			var defaults = {
				success : function(data) {
					if (!redirectIfNecessary($(data))) {
						var extraData = getExtraData($(data));
						callback(data, extraData);
					}
				}
			};

			$.extend(options, defaults);
			$.ajax(options);
		}

		function serializeObject($object) {
			var o = {};
			var a = $object.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		}

		// This script is used to update the price
		// based on the provided quantity
		$(function() {
			$('input.input-mini').keyup(function(event) {
				var quantity = $('input.input-mini').val();
				var totalPrice = quantity * productPrice;

				var subTotal = totalPrice + ".0";
				if ($.isNumeric(quantity)) {
					$('td.price').text(subTotal);
				}
			});
		});
		// This script is used to update the price
		// when the quantity field is empty
		$(function() {
			$('input.input-mini').focusout(function() {
				var quant = $('input.input-mini').val();
				if (quant == '') {
					var totalPrice = productPrice;
					$('td.price').text(totalPrice);
				}
			});
		});
		var form = $('addCartForm');
		var itemRequest = serializeObject(form);
		var cartItems = "${cart.numberOfItems}";
		$(function() {
			$('#addtocart').click(function(event) {
				$('#themodal').modal('toggle');

				$.ajax({
					url : $form.attr('action'),
					type : "POST",
					success : function(data) {
						updateHeaderCartItemsCount(cartItems);
						alert(cartItems);
					}
				});
			});

		});

		// Disables a button
		$(function disableButton() {
			jQuery.fn.extend({
				disable : function(state) {
					return this.each(function() {
						this.disabled = state;
					});
				}
			});

			$('#disabledbutton').disable(true);
		});
	</script>
</body>
</html>