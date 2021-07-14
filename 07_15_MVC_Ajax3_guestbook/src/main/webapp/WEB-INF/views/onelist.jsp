<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse;;
	text-align: center;
}

table, th, td {
	border: 1px solid black;
	padding: 5px;
	margin: auto;
}

div {
	width: 600px;
	margin: 100px auto;
	text-align: center;
}

.bg {
	background-color: #99ccff
}

input {
	padding: 5px;
}
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action = "update.do";
		f.submit();
	}
	function delete_go(f) {
		f.action = "delete.do";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 내용화면</h2>
		<hr>
		<p>
			[ <a href="list.do">목록으로</a> ]
		</p>
		<form method="post">
			<table>
				<tbody id="tbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><input type="button" value="수정"
							onclick="update_go(this.form)"> <input type="button"
							value="삭제" onclick="delete_go(this.form)"> <input
							type="hidden" name="idx" value="${vo.idx}"> <input
							type="hidden" name="pwd" value="${vo.pwd}"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "select.do?idx=${idx}",
			method : "post",
			dataType : "json",
			data : "idx="+$(this).attr("idx"),
			success : function(data) {
				var tag = "";
				tag += "<tr><th class='bg'>작성자</th> <td>" + data.name + "</td></tr>";
				tag += "<tr><th class='bg'>제목</th><td>"+data.subject+"</td></tr>";
				tag += "<tr><th class='bg'>email</th><td>"+data.email+"</td></tr>";
				tag += "<tr style='text-align: left;'><td colspan='2' style='padding: 0px 50px;'><pre>"+data.content+"</pre></td></tr>";
				tag += "<input type='hidden' name='idx' value='"+data.idx+"' >";
				tag += "<input type='hidden' name='pwd' value='"+data.pwd+"' >";

				$("#tbody").append(tag);
			},
			error : function() {
				alert("읽기실패");
			}
		});
	})
</script>
</html>