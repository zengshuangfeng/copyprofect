<%@ page contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
$(function(){
	$("#side-menu li ul li").each(function(){
		if($(this).hasClass("active"))
		{
			$(this).parent("ul").parent("li").addClass("active");
			$(this).parent("ul").addClass("in");
		}
	});
});
</script>
</body>
</html>