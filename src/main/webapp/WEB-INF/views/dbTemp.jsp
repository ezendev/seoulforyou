<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광api</title>
</head>
<body>
	<h1>api 호출 후 db에 저장하기</h1>
	<form name="f" action="dbSave.do" method="post">
		<select name="api">
			<option value="TbVwEntertainment">문화</option>
			<option value="TbVwAttractions">명소</option>
			<option value="TbVwNature">자연</option>
			<option value="TbVwRestaurants">음식</option>
			<option value="LOCALDATA_031101">숙박</option>
		</select>
		<input type="submit" value="db에 저장">
	</form>
	<h1>db에서 api 데이터 삭제하기</h1>
	<form name="f" action="dbDelete.do" method="post">
		<select name="api">
			<option value="TbVwEntertainment">문화</option>
			<option value="TbVwAttractions">명소</option>
			<option value="TbVwNature">자연</option>
			<option value="TbVwRestaurants">음식</option>
			<option value="LOCALDATA_031101">숙박</option>
		</select>
		<input type="submit" value="db에서 삭제">
	</form>
	
</body>
</html>