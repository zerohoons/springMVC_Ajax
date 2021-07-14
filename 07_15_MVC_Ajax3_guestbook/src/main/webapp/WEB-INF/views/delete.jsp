<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width: 500px;
	border-collapse: collapse;
	text-align: center;
}
th{
	background-color : skyblue;
	width: 100px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: left;
}
td{	
	text-align:left;
	border: 1px solid black;
	border-collapse: collapse;
	width: 400px;
}
div{ width: 600px; margin: 100px auto; text-align: center;}
</style>
<script type="text/javascript">
function delete_ok(f){
	if(f.pw.value == "${param.pw}"){
		var chk = confirm("삭제한 데이터는 돌릴 수 없습니다.");
		if(chk){
		f.action="delete_ok.do";
		f.submit();
		}else{
			hitstory.go(-1);
		}
	}else{
		alert("비밀번호틀림");
		f.pwd.value="";
		f.pwd.focus();
		return;
	}
}
</script>
</head>
<body>
	<h2 style="text-align: center;"> 방명록: 삭제화면 </h2>
	<hr>
	<h4 style="text-align: center;"> [<a href="list.do">게시물목록으로</a>]</h4>
	<form method = "post">
		<div>
		<table>
		<tbody>
		<tr>
		<th>비밀번호</th><td><input type="password" name="pw" placeholder="비밀번호를 입력하세요."></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="2" style="text-align: center;">
		<input type="button" value ="삭제" onclick="delete_ok(this.form)" >
		<input type="hidden" name = "idx" value = "${idx}">
		</td>
		</tr>
		</table>
		</div>
	</form>
</body>
</html>