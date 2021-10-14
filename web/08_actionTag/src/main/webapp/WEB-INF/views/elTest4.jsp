<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL연산자</h1>
	<table border="1">
		<tr>
			<th>표현식</th><th>결과</th>
		</tr>
		<tr>
			<td>\${num1+num2 }</td><td>${num1+num2 }</td>
		</tr>
		<tr>
			<td>\${str1+str2 }</td><td>${str1}${str2}</td>
		</tr>
		<tr>
			<td>\${num1-num2 }</td><td>${num1-num2 }</td>
		</tr>
		<tr>
			<td>\${num1*num2 }</td><td>${num1*num2 }</td>
		</tr>
		<tr>
			<td>\${num1/num2 }</td><td>${num1/num2 }</td>
		</tr>
		<tr>
			<td>\${num1 &lt; num2 }</td><td>${num1 < num2 }</td>
		</tr>
		<tr>
			<td>\${num1 &lt; num2 }</td><td>${num1 lt num2 }</td>
		</tr>
		<tr>
			<td>\${num1 == num2 }</td><td>${num1 == num2 }</td>
		</tr>
		<tr>
			<td>\${str2 == str3 }</td><td>${str2 == str3 }</td>
		</tr>
		<tr>
			<td>\${str1 != str2 }</td><td>${str1 != str2 }</td>
		</tr>
		<tr>
			<td>\${str2 == str3 }</td><td>${str2 eq str3 }</td>
		</tr>
		<tr>
			<td>\${str1 != str2 }</td><td>${str1 ne str2 }</td>
		</tr>
		<tr>
			<td>\${str4 == null }</td><td>${str4 == null }</td>
		</tr>
		<tr>
			<td>\${str4 == null }</td><td>${empty str4 }</td>
		</tr>
		<tr>
			<td>\${str4 == null }</td><td>${not empty str4 }</td>
		</tr>
	</table>
</body>
</html>