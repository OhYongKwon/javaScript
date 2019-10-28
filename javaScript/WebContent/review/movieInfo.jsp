<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#divInfo{display:none};
</style>
<script>
window.onload = function(){
	document.getElementById('btnInfo').onclick = function(){
	document.getElementById("divInfo").style.display ="block";
}
}

</script>


</head>
<body>
<h3>지영</h3>
영화소개
<button type ="button" id="btnInfo">영화상세보기</button>

<div id="divInfo">
영화상세소개
</div>
</body>
</html>