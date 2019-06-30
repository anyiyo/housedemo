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
    <title>房屋信息管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteHouse(id){
            if(confirm("您确定要删除吗？")){
                location.href="${pageContext.request.contextPath}/house/deleteOne?id="+id;
            }
        }
        window.onload = function(){
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){
                   var flag = false;
                    var cbs = document.getElementsByName("hid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }
                    if(flag){
                        document.getElementById("form").submit();
                    }
                }
            }
            document.getElementById("firstCb").onclick = function(){
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div style="float:right;"> ${login.username} 欢迎你  <a href="${pageContext.request.contextPath}/admin/exit">注销</a></div>
    <h1 style="text-align: center">房屋信息列表</h1>
    <div style="float: left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/house/findByCondition" method="post">
            <div class="form-group">
                <label for="exampleInputName1">类型</label>
                <input type="text" name="typename" value="${condition.typename[0]}" class="form-control" id="exampleInputName1">
            </div>
            <div class="form-group">
                <label for="exampleInputName2">区域</label>
                <input type="text" name="address" value="${condition.address[0]}" class="form-control" id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">厅室大小</label>
                <input type="text" name="size" value="${condition.size[0]}" class="form-control" id="exampleInputName3">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加信息</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/house/deleteAll" method="post">
        <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>排序</th>
            <th>类型</th>
            <th>区域</th>
            <th>厅室大小</th>
            <th>价位</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="house" varStatus="s">
            <tr>
                <td><input type="checkbox" name="hid" value="${house.id}"></td>
                <td>${s.count}</td>
                <td>${house.typename}</td>
                <td>${house.address}</td>
                <td>${house.size}</td>
                <td>${house.price}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/house/findById?id=${house.id}">修改</a>&nbsp;
                    <a class="btn btn-default btn-sm" href="javascript:deleteHouse(${house.id});">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/house/findByCondition?currentPage=${pb.currentPage - 1}&rows=5&typename=${condition.typename[0]}&address=${condition.address[0]}&size=${condition.size[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                    <c:if test="${pb.currentPage == i}">
                        <li><a href="${pageContext.request.contextPath}/house/findByCondition?currentPage=${i}&rows=5&typename=${condition.typename[0]}&address=${condition.address[0]}&size=${condition.size[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/house/findByCondition?currentPage=${i}&rows=5&typename=${condition.typename[0]}&address=${condition.address[0]}&size=${condition.size[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/house/findByCondition?currentPage=${pb.currentPage + 1}&rows=5&typename=${condition.typename[0]}&address=${condition.address[0]}&size=${condition.size[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
