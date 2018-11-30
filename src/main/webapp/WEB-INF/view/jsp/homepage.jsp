<%-- 本页面将会包含包含JSP常用的知识点  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>home page</title>
</head>
<body>
<jsp:include page="basic.jsp" />
Login Success，欢迎${sessionScope.user.name}访问<br>
UserInfo，姓名=${userInfo.name}，年龄=${userInfo.age}<br>
<a href="/jsp/jspIntroduce" target="_blank">JSP demo</a><br>
<a href="/postAll/post" target="_blank">Post demo</a><br>
<a href="/getAll/get" target="_blank">Get demo</a><br>
<a href="/myTest/test" target="_blank">Test demo</a><br>
<a href="/mail/gotoMail" target="_blank">Mail demo</a><br>
<a href="/model/modelJsp" target="_blank">Model传值 demo</a><br>
<a href="/other/otherIntroduce" target="_blank">Other demo</a><br>
<a href="/baidu/echart" target="_blank">Baidu demo</a><br>
<a href="/redis/redisIntroduce" target="_blank">Redis demo</a><br>
<c:if test="${userInfo.admin == 1}">
<a href="/user/getAllUserInfo" target="_blank">查看所有用户信息</a><br>
</c:if>
</body>
</html>
