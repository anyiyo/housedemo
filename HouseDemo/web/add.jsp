<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String  path =request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加房屋信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <center><h3>添加页面</h3></center>
    <form action="${pageContext.request.contextPath}/house/add" method="post">
        <div class="form-group">
            <label for="typename">类型：</label>
            <select name="typename" class="form-control" id="typename">
                <option value="海景房" selected>海景房</option>
                <option value="别墅">别墅</option>
            </select>
        </div>
        <div class="form-group">
            <label for="address">区域：</label>
            <select name="address" class="form-control" id="address">
                <option value="江夏区">江夏区</option>
                <option value="洪山区" selected>洪山区</option>
            </select>
        </div>
        <div class="form-group">
            <label for="size">厅室大小：</label>
            <select name="size" class="form-control" id="size">
                <option value="两室一厅" selected>两室一厅</option>
                <option value="两室两厅" >两室两厅</option>
                <option value="三室两厅" >三室两厅</option>
                <option value="五室三厅" >五室三厅</option>
            </select>
        </div>
        <div class="form-group">
            <label for="price">价位：</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="请输入价位">
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="submit" value="返回" onclick="javascript:history.back(-1);" />
        </div>
    </form>
</div>
</body>
</html>