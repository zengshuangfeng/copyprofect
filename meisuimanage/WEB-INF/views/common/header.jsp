<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<c:set var="ctx" value="/res" />
<c:set var="BASE_PATH" value="" />
<c:set var="user" value="" /> 
<!DOCTYPE html>
<html>
<head>
<title>美岁直播管理后台</title>
<meta charset="utf-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/plugins/chosen/chosen.css">
<link rel="stylesheet" type="text/css" href="${ctx}/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/animate.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">

<script src="${ctx}/js/jquery-2.1.1.js" type="text/javascript"></script>
<script src="${ctx}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/js/inspinia.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js" type="text/javascript"></script>
</head>
<body>