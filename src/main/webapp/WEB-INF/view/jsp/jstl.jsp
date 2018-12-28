<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>jstl</title>
    <script>
        // model传过来的值，js中可以使用，jsp不适合使用
        var numberBitPage = ${numberBit};
    </script>
    <script type="text/javascript" src="/js/model/post.js"></script>
</head>
<body>
<%-- if表达式 --%>
<c:if test="${admin == true}">
    admin存在
</c:if>
<br>
<%-- choose表达式，相当于if {} else if {} else if {} ...else {}，适用于没有很多重复代码的情况下，否则用if代替 --%>
<c:choose>
    <c:when test="${status == '1'}">
        when status == '1'
    </c:when>
    <c:when test="${status == '2'}">
        when status == '2'
    </c:when>
    <c:otherwise>
        otherwise status == '3'
    </c:otherwise>
</c:choose>
<%-- forEach表达式 --%>
<table bgcolor="#faebd7" border="1" width="300px">
    <th>用户名</th>
    <th>年龄</th>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.name}</td>
            <td>${user.age}</td>
        </tr>
    </c:forEach>
</table>
<br>
<c:if test="${salary >= 4000}">
    前端设值之前>=4000
</c:if>
<c:if test="${salary < 4000}">
    前端设值之前<4000
</c:if>
<br>
<%-- 设置值，前端设值，必须在设值之后才能取出值 --%>
<c:set var="salary" value="${2000*2}"/>
<%-- 获取值展示，类似于JSP输出表达式，等效于直接${salary} --%>
<c:out value="${salary}"/><br>
<c:if test="${salary >= 4000}">
    前端设值之后>=4000
</c:if>
<c:if test="${salary < 4000}">
    前端设值之后<4000
</c:if>
<br>
<c:if test="${numberBitPage >= 4}">
    model传值numberBitPage>=4
</c:if>
<c:if test="${numberBitPage < 4}">
    model传值numberBitPage<4
</c:if>
<%-- 格式化日期 --%>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /><br>
<%-- 常用的为保留一定的小数位数，4舍5入，一般情况下保留2位 --%>
字符串格式，展现的就是原值=<h1><c:out value="${moneyStr}"/></h1><br>
普通输出=<c:out value="${money}"/><br>
当做金额输出，保留n位小数，会自动去除小数点后末尾的0=<fmt:formatNumber value="${money}" type="number" maxFractionDigits="${numberBit}" /><br>
当做金额输出，不限定保留小数=<fmt:formatNumber value="${money}" type="number" /><br>
浮点数输出=<fmt:parseNumber type="number" value="${money}" /><br>
浮点数输出2=<fmt:parseNumber type="number" value="${moneyFloat}" /><br>
浮点数取整输出=<fmt:parseNumber integerOnly="true" type="number" value="${money}" /><br>
设置精度的格式=<c:out value="${moneyTwo}"/><br>
设置精度的格式=<c:out value="${moneyThree}"/><br>
设置精度的格式=<c:out value="${moneyFour}"/>

<h1>fmt:formatNumber</h1>
<p>格式化数字 (1): <fmt:formatNumber value="${money}" type="currency"/></p>
<p>格式化数字 (2): <fmt:formatNumber type="number" maxIntegerDigits="3" value="${money}" /></p>
<p>格式化数字 (3): <fmt:formatNumber type="number" maxFractionDigits="3" value="${money}" /></p>
<p>格式化数字 (4): <fmt:formatNumber type="number" groupingUsed="false" value="${money}" /></p>
<p>格式化数字 (5): <fmt:formatNumber type="percent" maxIntegerDigits="3" value="${money}" /></p>
<p>格式化数字 (6): <fmt:formatNumber type="percent" minFractionDigits="10" value="${money}" /></p>
<p>格式化数字 (7): <fmt:formatNumber type="percent" maxIntegerDigits="3" value="${money}" /></p>
<p>格式化数字 (8): <fmt:formatNumber type="number" pattern="###.###E0" value="${money}" /></p>
<p>美元 :
    <fmt:setLocale value="en_US"/>
    <fmt:formatNumber value="${money}" type="currency"/></p>
<br>
<%-- 遍历map --%>
<select id="selectAllMap" name="selectAllMap">
    <c:if test="${!empty mapTest}">
        <c:forEach items="${mapTest}" var="item">
            <option value="${item.key }">${item.value}</option>
        </c:forEach>
    </c:if>
</select>
<br>
<select id="selectAllMapTWo" name="selectAllMapTwo">
    <c:if test="${!empty mapTestTwo}">
        <%-- 每一个item是一个map --%>
        <c:forEach items="${mapTestTwo}" var="item">
            <option value="${item.user.name}">${item.user.phone}</option>
        </c:forEach>
    </c:if>
</select>
<br>
<%-- 遍历list --%>
<table>
    <c:forEach items="${listTest}" var="item">
        <%-- 如果item是一个实体，那么取值就用item.id, item.name这种格式 --%>

        <tr>
            <c:if test="${not empty item}">
                <td>${item}</td>
            </c:if>
            <c:if test="${empty item}">
                <td>empty value</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
<c:if test="${!empty userOne}">对象有值</c:if><br>
<c:if test="${not empty userOne}">对象有值2</c:if><br>
<c:if test="${userOne != null}">对象有值3</c:if><br>

<c:if test="${empty userOne}">对象没有值</c:if><br>
<c:if test="${userOne == null}">对象没有值2</c:if><br>
<c:choose>
    <c:when test="${!empty userOne}">
        对象有值另一种方式
    </c:when>
    <c:otherwise>
        对象没有值另一种方式
    </c:otherwise>
</c:choose>

<c:if test="${!empty userTwo.name}">对象中属性有值</c:if><br>
<c:if test="${not empty userTwo.name}">对象中属性有值2</c:if><br>
<c:if test="${userTwo.name != null && userTwo.name != ''}">对象中属性有值3</c:if><br>

<c:if test="${empty userTwo.name}">对象中属性没有值</c:if><br>
<c:if test="${userTwo.name == null || userTwo.name == ''}">对象中属性没有值2</c:if><br>
<c:choose>
    <c:when test="${!empty userTwo.name}">
        对象中属性有值另一种方式
    </c:when>
    <c:otherwise>
        对象中属性没有值另一种方式
    </c:otherwise>
</c:choose>
</body>
</html>
