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
<h3>����</h3>
��ȭ�Ұ�
<button type ="button" id="btnInfo">��ȭ�󼼺���</button>

<div id="divInfo">
��ȭ�󼼼Ұ�
</div>
</body>
</html>