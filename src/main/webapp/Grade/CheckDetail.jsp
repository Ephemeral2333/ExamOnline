<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/4
  Time: 20:46
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="result" class="entity.Result" scope="application"/>
<%
    String rID = request.getParameter("rID");
    result.selectPaperDetail(Integer.parseInt(rID));
%>
<html>
<head>
    <title>试卷详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed">
<div class="wrapper">
    <jsp:include page="${pageContext.request.contextPath}/common/header.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/common/aside.jsp" />

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>试卷详细信息</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">试卷详细信息</li>
                        </ol>
                    </div>
                    <br>
                    <br>
                    <div class="row mb-2">
<%--                        <div class="col-sm-20">--%>
<%--                            <b>&nbsp;&nbsp;&nbsp;&nbsp;考试名称：<%=result.getPaper().getPName()%>；&nbsp;&nbsp;考试总分：<%=result.getPaper().getPScore()%>分；&nbsp;&nbsp;试卷科目：<%=result.getPaper().getCourse().getCName()%></b>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <form id="handleCheck" action="/handleCheck" method="post">
            <input type="hidden" name="rID" value="<%=rID%>">
            <section class="content">
                <div class="row">
                    <div class="col-12" id="accordion">
                        <div class="card card-primary card-outline">
                            <a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
                                <div class="card-header">
                                    <h4 class="card-title w-100">
                                        试卷详情
                                    </h4>
                                </div>
                            </a>
                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                <div class="card-body">
                                    <c:forEach items="${result.resultList}" var="result" varStatus="status">
                                        <div class="card-header">
                                            <h5 class="card-title w-100">
                                                    ${status.index+1}、${result.question.QName}&nbsp;&nbsp;&nbsp;（分值：${result.question.QScore}分）
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            答案：${result.QAnswer}<br><br>
                                            学生做答：${result.SContent}<br><br>
                                            评分：<input type="number" name="${result.QID}" oninput="if(value<=0)value=0;if(value>${result.question.QScore})value=0;value=parseInt(value)"><br><br>
                                            评语：<input type="text" name="评语${result.QID}">
                                        </div>
                                        <hr>
                                    </c:forEach>
                                    <button class="btn btn-block btn-primary btn-lg" type="button" id="submitCheck">提交评分</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </div>

    <aside class="control-sidebar control-sidebar-dark"></aside>
    <jsp:include page="${pageContext.request.contextPath}/common/footer.jsp" />
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jszip/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<script>
    $("#submitCheck").click(function () {
        $("#handleCheck").submit();
    })
</script>
</html>





