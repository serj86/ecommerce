<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1 id="msg"><c:out value="${requestScope.notice}">Hello <c:out value="${sessionScope.user.firstName}">Guest</c:out>!</c:out></h1>
<nav id="nav">
	<ul>
	
		<li><a href="index.jsp" class="icon fa-home">Home</a></li>
		<c:if test = "${empty sessionScope.user}">
			<li><a href="index.jsp#login" class="icon fa-user">Login</a></li>
			<li><a href="index.jsp#register" class="icon fa-user-plus">Register</a></li>
		</c:if>
		
		<li><a href="catalog" class="icon fa-book">Catalog</a></li>
		<li><a href="cart.jsp" class="icon fa-shopping-cart">Cart <c:if test = "${cart.getProductsMap().size() > 0}">(${cart.getProductsMap().size()})</c:if></a></li>
		
		<c:if test = "${not empty sessionScope.user}">

			<li>
				<a href="" class="icon fa-caret-down">Account</a>
				<ul>
					<li><a href="index.jsp#edit" class="icon fa-edit">&nbsp;Edit User</a></li>
					<li><a href="logout" class="icon fa-sign-out">&nbsp;Logout</a></li>
				</ul>
			</li>
			
			<%-- 
			<c:if test = "${sessionScope.user.roleId == 1}">
				<li>
					<a href="" class="icon fa-caret-down">Manage</a>
					<ul>
						<li>
							<a href="" class="icon fa-angle-left"> Store</a>
							<ul>
								<li><a href="#">Products</a></li>
								<li><a href="#">Categories</a></li>
							</ul>
						</li>
						<li>
							<a href="" class="icon fa-angle-left"> Accounts</a>
							<ul>
								<li><a href="#">Users</a></li>
								<li><a href="#">Roles</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</c:if>
			--%>
			
		</c:if>
		
	</ul>
</nav>