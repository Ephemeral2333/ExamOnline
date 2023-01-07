<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/5
  Time: 0:38
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ page import="entity.User" %>
<jsp:useBean id="user" class="entity.User" scope="session"/>
<%
    Subject subject = (Subject) session.getAttribute("subject");
    String no = (String) subject.getPrincipal();
    user.selectUser(no);
    String name = session.getAttribute("name").toString();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的信息</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jqvmap/jqvmap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap/">
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
    <jsp:include page="${pageContext.request.contextPath}/common/header.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/common/aside.jsp" />

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                &nbsp;我的信息
            </h1>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fas fa-edit"></i>
                                个人信息
                            </h3>
                        </div>
                        <div class="card-body">
                            <ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="custom-content-below-home-tab" data-toggle="pill" href="#custom-content-below-home" role="tab" aria-controls="custom-content-below-home" aria-selected="true">Home</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="custom-content-below-tabContent">
                                <div class="tab-pane fade show active" id="custom-content-below-home" role="tabpanel" aria-labelledby="custom-content-below-home-tab">
                                    <br>
                                    用户名：<input class="" id="userNo" disabled="disabled" value="<%=user.getU_id()%>">
                                    姓名：<input class="" disabled="disabled" value="<%=name%>">
                                    密码：<input class="" id="pwd" disabled="disabled" value="********">
                                    电子邮箱：<input class="" id="email" disabled="disabled" value="<%=user.getEmail()%>">
                                    <input type="hidden" id="salt" value="<%=user.getSalt()%>">
                                    <button class="btn btn-primary" onclick="changeProfile()">编辑</button>
                                    <button class="btn btn-primary" id="submitChange" disabled="disabled" onclick="submitChange()">提交</button>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/plugins/jQuery/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/sparklines/sparkline.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/adminlte.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/pages/dashboard.js"></script>
<script>
    function changeProfile() {
        $("#pwd").removeAttr("disabled");
        $("#email").removeAttr("disabled");
        $("#submitChange").removeAttr("disabled");
    }

    function submitChange() {
        var pwd = $("#pwd").val();
        var email = $("#email").val();
        var salt = $("#salt").val();
        var userNo = $("#userNo").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/user/changeProfile",
            type: "post",
            data: {
                pwd: pwd,
                email: email,
                salt: salt,
                userNo: userNo
            },
            success: function (data) {
                if (data == 1) {
                    alert("修改成功");
                    window.location.reload();
                } else {
                    alert("修改失败");
                }
            }
        })
    }
</script>
</html>

