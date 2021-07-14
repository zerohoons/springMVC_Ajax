<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
	border: 1px solid red;
	padding: 8px;
}

table {
	width: 1200px;
	margin: 0 auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid gray;
	text-align: center;
}

h2 {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	function getList() {
		$("#tbody").empty();
		$.ajax({
			url : "list.do",
			method: "post",
			dataType : "json",
			success : function(data) {
			  // console.log(data);
			  var tag = "";
			  $.each(data,function(){
				 tag +="<tr>"; 
				 tag += "<td>"+this["idx"] +"</td>";
				 tag += "<td>"+this["id"] +"</td>";
				 tag += "<td>"+this["pw"] +"</td>";
				 tag += "<td>"+this["name"] +"</td>";
				 tag += "<td>"+this["age"] +"</td>";
				 tag += "<td>"+this["addr"] +"</td>";
				 tag += "<td>"+this["reg"].substring(0,10)+"</td>";
				 tag += "<td><button id = 'del' idx='"+this["idx"] +"'>삭제</button></td>";
				 tag +="</tr>";
			  });
			  $("#tbody").append(tag);
			},
			error : function() {
				alert("읽기실패");
			}
		});
	};
	
	$("#btn1").click(function() {
		if($("#id").val()==""){
			// alert 후 새로고침
			alert("아이디를 입력하세요\n회원가입을 위해서는 중복검사를 해야 합니다.");
			$("#id").focus();
			return false;
		}
		$.ajax({
			url : "idchk.do",
			method: "post",
			data : "id="+$("#id").val(),
			dataType : "text",
			success : function(data) {
			   if(data=='1'){
				   alert("중복된 아이디 입니다.");
				   $("#id").val('');
				   $("#id").focus();
			   }else{
				   alert("사용가능한 아이디 입니다.");
				   $("#btn2").attr("disabled", false);
			   }
			},
			error : function() {
				alert("읽기실패");
			}
		});
			return false;
	});
	
	$("#btn2").click(function() {
		// serialize(): form 안에 있는 모든 파라미터값이 직렬로 전달 된다.
		$.ajax({
			url : "insert.do",
			method: "post",
			data : $("#myForm").serialize(),
			dataType : "text",
			success : function(data) {
			   if(data=='1'){
				   alert("회원정보 가입 성공.");
			   }else{
				   alert("회원정보 가입 실패.");
			   }
				},
			   $("#btn2").attr("disabled", true);
			   $("#myForm")[0].reset();
			error : function() {
				alert("읽기실패");
			}
		});
	});
	
	//동적 바인딩변수이기 때문에 onclick이 적용되지 않음.
	$("table").on("click","#del",function(){
		$.ajax({
			url : "delete.do",
			method: "post",
			data :"idx="+$(this).attr("idx"), //파라미터값
			dataType : "text",
			success : function(data) {
			   if(data=='1'){
				   alert("회원정보 삭제 성공.");
				   getList();
			   }else{
				   alert("회원정보 삭제 실패.");
			   }
			},
			error : function() {
				alert("읽기실패");
				$("#myForm")[0].reset();
			}
		});
	})
	getList();
});
</script>
</head>
<body>
	<h2>회원 정보 입력하기</h2>
	<form method="post" id="myForm">
		<table>
			<thead>
				<tr>
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>NAME</th>
					<th>AGE</th>
					<th>ADDR</th>
				</tr>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="id" id="id">
						<button id="btn1">중복확인</button></td>
					<td><input type="password" name="pw"></td>
					<td><input type="text" name="name"></td>
					<td><input type="number" name="age"></td>
					<td><input type="text" name="addr"></td>
				</tr>
			</tbody>
			<tfoot>
				<td colspan="5"><input type="button" id="btn2" value="가입하기"
					disabled></td>
			</tfoot>
		</table>
	</form>

	<h2>회원정보보기</h2>
	<div>
		<table>
			<thead>
				<tr>
					<th>IDX</th>
					<th>ID</th>
					<th>PW</th>
					<th>NAME</th>
					<th>AGE</th>
					<th>ADDR</th>
					<th>REG</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
</body>
</html>