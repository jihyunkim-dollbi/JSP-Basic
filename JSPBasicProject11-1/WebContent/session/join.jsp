<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML 5 -->
<html>
<head>
<%--
-------- -------- ------------- 
ID       NOT NULL VARCHAR2(50)  
PWD      NOT NULL VARCHAR2(50)  
NAME     NOT NULL VARCHAR2(100) 
EMAIL             VARCHAR2(200) 
SEX               VARCHAR2(20)  
BIRTHDAY NOT NULL VARCHAR2(50)  
POST     NOT NULL VARCHAR2(10)  
ADDR1    NOT NULL VARCHAR2(500) 
ADDR2             VARCHAR2(500) 
TEL               VARCHAR2(50)  
CONTENT  NOT NULL CLOB     
// 여기까지 만들기     
REGDATE           DATE          
ADMIN             CHAR(1)  

 --%>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/shadowbox.css">
 <script type="text/javascript" src="js/shadowbox.js"></script>
 <script type="text/javascript">

 Shadowbox.init({
	
	 players:['iframe'] 
	 
 });
function postfind(){
	
	window.open("postfind.jsp","postfind","width=450,height=350,scrollbars=yes");
	
}  
function idcheck(){
	
	window.open("idcheck.jsp","idcheck","width=380,height=280,scrollbars=no");
	 
}
function join(){
	
	/*
	 태그에 접근 : 계층구조
	 
	 	1. window
	
	 	2.document (html전체를 갖고 있는 파일)
	 		
	 	3. form frm을 가진 form태그를 찾아라
	 		
	 		4  1)input
	 		4  2)select
	 		4  3)textarea
	
	 	include될때 = 해당jsp 파일안에 form태그가 여러개 있을수 있기때문에name으로 지정을 해줘야함.
	 		
	*/
	
	//유효성 검사 => 스프링 내부에 있다
	//document.frm.naame => $('#name')
	document.frm.submit(); //frm에 submit()을 실행해라
	
	
}

 </script>

<style type="text/css">
.row {

	margin:0px auto;
	width: 700px;
}

</style>

</head>
<body>
	<div class="container">
		<h1 class="text-center">회원가입</h1>
		<div class="row">
			<form name="frm" action="join_ok.jsp" method="post"> <!--  "join_ok.jsp"으로 이동! post 데이터가 많아서. 데이터를 db로 보내는 jsp -->
			<table class="table table-hover">
				<tr>
					<th width=15% class="danger text-right">ID</th>
					<td width=85%>
						<input type=text name=id size=15 class="input-sm" readonly> <!-- 중복체크 후 새창에서 확인을 하고 확정값을 id칸에 넣을 예정! -->
						<input type="button" value="중복체크" class="btn btn-sm btn-danger" onclick="idcheck()" >
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">비밀번호</th>
					<td width=85%>
						<input type=password name=pwd size=15 class="input-sm">&nbsp;
						재입력:<input type=password name=pwd1 size=15 class="input-sm"> <!-- JS에서 같은지 확인예정! -->
					
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">이름</th>
					<td width=85%>
						<input type=text name=name size=15 class="input-sm" > 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">이메일</th>
					<td width=85%>
						<input type=text name=email size=50 class="input-sm" > 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">성별</th>
					<td width=85%>
						<input type="radio" name=sex value="남자" checked>남자
						<input type="radio" name=sex value="여자" >여자
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">생년월일</th>
					<td width=85%>
						<input type=date name=birthday size=50 class="input-sm" > 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">우편번호</th>
					<td width=85%>
						<input type=text name=post1 size=5 class="input-sm" readonly> - 
						<input type=text name=post2 size=5 class="input-sm" readonly>
						<input type="button" class="btn btn-sm btn-primary" value="우편번호검색" onclick="postfind()">
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">주소</th>
					<td width=85%>
						<input type=text name=addr1 size=50 class="input-sm" readonly> <!-- db에서 가져올 예정!!readonly --> 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">상세주소</th>
					<td width=85%>
						<input type=text name=addr2 size=50 class="input-sm" > 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">전화번호</th>
					<td width=85%>
					<select class="input-sm" name=tel1>
						<option>010</option>
						<option>011</option>
						<option>017</option>
					</select>
						<input type=text name=tel2 size=5 class="input-sm" > - 
						<input type=text name=tel3 size=7 class="input-sm" > 
					</td>
				</tr>
				
				<tr>
					<th width=15% class="danger text-right">소개</th>
					<td width=85%>
						<textarea rows="8" cols="60" name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" class="text-center">
						<input type=button value="회원가입" class="btn btn-sm btn-info"
						onclick="join()"
						> <!--  button =submit(하면 화면 리셋됨!!) 클릭하면 join()함수 읽기!모든 데이터를 보냄! join_ok.jsp => 로 고고 !-->
						<input type=button value="취소" class="btn btn-sm btn-success"
							onclick="javascript:history.back()"
						>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>

</body>
</html>