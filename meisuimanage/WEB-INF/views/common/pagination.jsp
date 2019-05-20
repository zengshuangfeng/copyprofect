<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<c:set var="ctx" value="/res" />
<c:set var="BASE_PATH" value="" />
<tfoot>
	<tr>
		<td colspan="${showPage.columns}" class="footable-visible">
			<ul class="pagination pull-right">
			<c:if test="${showPage.totalPage>0}">
				<c:choose>
					<c:when test="${showPage.currentPage!=1}">
						<li class="footable-page-arrow "><a data-page="first"
								href="${BASE_PATH}/${showPage.urlName}?page=1${query}#">«</a></li>
						<li class="footable-page-arrow "><a data-page="prev"
								href="${BASE_PATH}/${showPage.urlName}?page=${showPage.prePage}${query}#">‹</a></li>
					</c:when>
					<c:otherwise>
						<li class="footable-page-arrow disabled"><a data-page="first"
								href="#">«</a></li>
						<li class="footable-page-arrow disabled"><a data-page="prev"
								href="#">‹</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${showPage.pageNumStart }"
					end="${showPage.pageNumEnd }" var="pageIndex">
					<c:if test="${showPage.currentPage==pageIndex }">
						<li class="footable-page active"><a data-page="0" href="#">${pageIndex }</a></li>
					</c:if>
					<c:if test="${showPage.currentPage!=pageIndex }">
						<li class="footable-page ">
						<a data-page="0" href="${BASE_PATH}/${showPage.urlName}?page=${pageIndex }${query}#">${pageIndex }</a></li>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${showPage.currentPage!=showPage.totalPage}">
						<li class="footable-page-arrow "><a data-page="next"
							href="${BASE_PATH}/${showPage.urlName}?page=${showPage.nextPage}${query}#">›</a></li>
						<li class="footable-page-arrow "><a data-page="last"
							href="${BASE_PATH}/${showPage.urlName}?page=${showPage.totalPage}${query}#">»</a></li>
					</c:when>
					<c:otherwise>
						<li class="footable-page-arrow disabled"><a data-page="next"
							href="#">›</a></li>
						<li class="footable-page-arrow disabled"><a data-page="last"
							href="#">»</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
			</ul>
		</td>
	</tr>

</tfoot>


<script type="text/javascript">
	function jumpPage() {
		var pageNum = $("#pageNum").val();
		if (pageNum != '')
			window.location.href = '${BASE_PATH}/${showPage.urlName}?page=' + pageNum + '${query}';
		else
			window.location.reload();
	}
</script>