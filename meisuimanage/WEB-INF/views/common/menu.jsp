<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav metismenu" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<span> <c:if test="${null==userIcon||userIcon==''}">
							<img alt="image" class="img-circle"
								style="width: 48px; height: 48px;"
								src="${ctx}/img/adminhead.jpg" />
						</c:if> <c:if test="${null!=userIcon&&userIcon!=''}">
							<img alt="image" class="img-circle" src="${userIcon}" />
						</c:if>
					</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"> <strong
								class="font-bold">${user}</strong>
						</span>
					</span>
					</a>
				</div>
			</li>
			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.f_id == 0 }">
					<li><a href="#"><i class="${menu.class_name}"></i><span
							class="nav-label">${menu.name}</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<c:forEach items="${menuList}" var="submenu">
								<c:if test="${submenu.f_id == menu.id}">
									<li<c:if test="${submenu.name_en==activeUrl}"> class="active"</c:if>><a href="javascript:void(0)" onclick="window.location.href='${BASE_PATH}/${submenu.url}?r='+Math.random()">${submenu.name}</a>
									</li>
								</c:if>
							</c:forEach>
						</ul></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</nav>