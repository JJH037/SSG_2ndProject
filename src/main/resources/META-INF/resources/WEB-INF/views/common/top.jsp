<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header class="border-bottom border-light border-5">
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-expand-lg">
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="main">Home</a>
						</li>
					</ul>
				</div>

				<!-- 로그인 안된 경우 화면 -->
				<sec:authorize access="isAnonymous()">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="loginForm">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="signup">signup</a>
						</li>
					</ul>
				</sec:authorize>

				<!-- 로그인된 경우 화면 -->
				<sec:authorize access="isAuthenticated()">
					<ul class="navbar-nav">
						<li class="nav-item">${login.username}</li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="mypage">mypage</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="refrigerator">내 냉장고</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="cartList">cartList</a>
						</li>
					</ul>
				</sec:authorize>
			</nav>
		</div>
	</div>
</header>