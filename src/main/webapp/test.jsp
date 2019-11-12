<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'demo.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


</head>

<body>
<form action="${pageContext.request.contextPath}/message/send" method="post">
    <table>
        <tr>
            <td align="right">用户名:</td>
            <td><input name="username" type="text" style="width: 300px;"></td>
        </tr>
        <tr>
            <td align="right">内容:</td>
            <td><textarea name="message" style="width: 300px;"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center" ><input type="submit" /></td>
        </tr>
    </table>
</form>
<div>
    <ul>

    </ul>
</div>
<script src="jquery.js" type="text/javascript"></script>
<script src="sockjs.js" type="text/javascript"></script>
<script type="text/javascript">
    var PATH = "${pageContext.request.contextPath}";
    alert(PATH);
    var websocket = null;
    // 连接websocket
    if (window['WebSocket'])
        websocket = new WebSocket("ws://" + window.location.host + PATH + '/websocket');
    else
        websocket = new new SockJS(PATH + '/websocket/socketjs');

    websocket.onopen = function(event) {
        console.log('open', event);
    };
    websocket.onmessage = function(event) {
        console.log('message', event.data);
        $('div > ul').append('<li>' + event.data + '</li>');
    };
</script>
</body>
</html>
