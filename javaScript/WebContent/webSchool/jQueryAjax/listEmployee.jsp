<%@ page language="java" contentType="text/html; charset=EUC-KR"
			pageEncoding="EUC-KR"%>

<%
	String empId = request.getParameter("empId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="../jquery/jquery.min.js"></script>
<script>
	var focusId =<%=empId%>
	$.ajax({
		url : "../../EmpServlet",
		dataType : "json",
		success : function(result) {
			console.log(result)
			var table, tr, th, td;
			table = $("<table />");
			table.attr("border", "1");
			tr = $("<tr />");
			for (title in result[0]) {
				th = $("<th />").text(title);
				tr.append(th);
			}
			tr.append($("<th />").text("����"));

			table.append(tr);
			//td �����͸� ������ �����ִ� �κ�
			$.each(result, function(i, o) {
				tr = $("<tr />").attr("id", o.employeeId).dblclick(changeFunc)
						.mousemove(changeFunc2).mouseout(changeFunc3);
				for (filed in o) {
					if (filed == "employeeId") {
						var ahref = $("<a />").text(o[filed]);
						ahref.attr("href", "updateEmployee.jsp?empId="
								+ o[filed]);
						td = $("<td />").html(ahref);
						tr.append(td);
					} else {
						td = $("<td />").text(o[filed]);
						tr.append(td);
					}
					//console.log(filed);

				}
				if (focusId == o.employeeId) {
					tr.css("background-color","red");
					
					
				}
				var del = $("<button />").text("Del");
				del.click(delFunc);

				tr.append($("<td />").html(del));
				
				table.append(tr);
			})
			$("#show").append(table);

		}
	})

	function changeFunc3() {
		var employeeId = $(this).children().eq(5).text();
		$("#" + employeeId).css("background-color", "white");
	}

	function changeFunc2() {
		var employeeId = $(this).children().eq(5).text();
		$("#" + employeeId).css("background-color", "yellow");
	}
	function changeFunc() {
		var deptName = $(this).children().eq(0).text();
		var firstName = $(this).children().eq(1).text();
		var jobId = $(this).children().eq(2).text();
		var lastName = $(this).children().eq(3).text();
		var hireDate = $(this).children().eq(4).text();
		var employeeId = $(this).children().eq(5).text();
		var salary = $(this).children().eq(6).text();
		var email = $(this).children().eq(7).text();

		var tr = $("<tr />");
		tr.append($("<td />").text(deptName));
		tr.append($("<td />").text(firstName));
		tr.append($("<td />").text(jobId));
		tr.append($("<td />").text(lastName));
		tr.append($("<td />").text(hireDate));
		tr.append($("<td />").text(employeeId));
		tr.append($("<td />").html($("<input />").val(salary)));
		tr.append($("<td />").text(email));
		tr.append($("<td />")
				.html($("<button />").text("����").click(updateFunc)));

		console.log("#" + employeeId);

		$("#" + employeeId).after(tr); //()���� �ڿ� �����ϰڴ�.
		// $("#"+employeeId).css("visibility","hidden");
		$("#" + employeeId).css("display", "none");
	}
	//����
	function updateFunc() {
		console.log("����");
	}
	//����
	function delFunc() {
		//console.log("delFunc");
		//console.log($(this).parent().parent().attr("id"));
		$(this).parent().parent().remove();
		var empId = $(this).parent().parent().attr("id");
		$.ajax({
			url : "../../DeleteEmpServ",
			data : "empId=" + empId,
			success : function() {
				console.log("del success")
			}
		});
	}
</script>
</head>
<body>
			<a href="insertEmployee.html">�Է�ȭ��</a>
			<p id="show"></p>

</body>
</html>