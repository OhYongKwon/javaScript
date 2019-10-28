<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="../webSchool/jquery/jquery.min.js"></script>

	<script>
	
	window.onload = function(){
//		document.getElementById("timeDiv").innerHTML =new Date();
//		document.getElementById('btnTimeView').onclick = function(){
//		document.getElementById("timeDiv").innerHTML =new Date();
//	}
	}
	
	
	$(document).ready(function (){

		$("#btnTimeView").on("click",function(){
			document.getElementById("timeDiv").innerHTML =new Date();
		})
	})
	
</script>

</head>
<body>
<h3>디지털 시계 출력</h3>
<button type = "button" id = "btnTimeView" >시계보이기</button>

<div id="timeDiv">

</div>



</body>
</html>