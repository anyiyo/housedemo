<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>修改</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="container" style="width: 400px;">
        <h3 style="text-align: center;">更新信息</h3>
        <form action="${pageContext.request.contextPath}/house/update" method="post">
            <input type="hidden" name="id" value="${house.id}">

          <div class="form-group">
            <label for="typename">类型：</label>
              <select name="typename" id="typename" class="form-control" >
                  <c:if test="${house.typename == '海景房'}">
                  <option value="海景房" selected>海景房</option>
                  <option value="别墅">别墅</option>
                  </c:if>
                  <c:if test="${house.typename == '别墅'}">
                  <option value="海景房">海景房</option>
                  <option value="别墅" selected>别墅</option>
                  </c:if>
              </select>
          </div>

           <div class="form-group">
                <label for="address">区域：</label>
                <select name="address" id="address" class="form-control" >
                    <c:if test="${house.address == '洪山区'}">
                    <option value="洪山区" selected>洪山区</option>
                    <option value="江夏区">江夏区</option>
                    </c:if>
                    <c:if test="${house.address == '江夏区'}">
                    <option value="洪山区">洪山区</option>
                    <option value="江夏区" selected>江夏区</option>
                    </c:if>
                </select>
           </div>

          <div class="form-group">
            <label for="size">厅室大小：</label>
             <select name="size" id="size" class="form-control" >
                 <c:if test="${house.size == '两室一厅'}">
                    <option value="两室一厅" selected>两室一厅</option>
                    <option value="两室两厅">两室两厅</option>
                    <option value="三室两厅">三室两厅</option>
                    <option value="五室两厅">五室两厅</option>
                 </c:if>
                 <c:if test="${house.size == '两室两厅'}">
                    <option value="两室一厅">两室一厅</option>
                    <option value="两室两厅" selected>两室两厅</option>
                    <option value="三室两厅">三室两厅</option>
                    <option value="五室两厅">五室两厅</option>
                 </c:if>
                 <c:if test="${house.size == '三室两厅'}">
                    <option value="两室一厅">两室一厅</option>
                    <option value="两室两厅">两室两厅</option>
                    <option value="三室两厅" selected>三室两厅</option>
                    <option value="五室两厅">五室两厅</option>
                 </c:if>
                 <c:if test="${house.size == '五室两厅'}">
                    <option value="两室一厅">两室一厅</option>
                    <option value="两室两厅">两室两厅</option>
                    <option value="三室两厅">三室两厅</option>
                    <option value="五室两厅" selected>五室两厅</option>
                 </c:if>
            </select>
          </div>

            <div class="form-group">
                <label for="price">价格：</label>
                <input type="text" class="form-control" value="${house.price}" id="price"  name="price" placeholder="请输入价位" />
            </div>

             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
                <input class="btn btn-default" type="button" value="返回" onclick="javascript:history.back(-1);"/>
             </div>
        </form>
        </div>
    </body>
</html>