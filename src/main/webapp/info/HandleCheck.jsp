<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/4
  Time: 22:41
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<jsp:useBean id="info" class="entity.Info" scope="application"/>
<%
    String iID = request.getParameter("iID");
    info.selectByPK(Integer.parseInt(iID));
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>收件箱</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/css/adminlte.min.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/common/header.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/aside.jsp" />

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>收件箱</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Inbox</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <a href="compose.html" class="btn btn-primary btn-block mb-3">写信</a>

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">文件夹</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item active">
                                <a href="#" class="nav-link">
                                    <i class="fas fa-inbox"></i> 收件箱
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-envelope"></i> 已发出
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="fas fa-filter"></i> 已删除
                                    <span class="badge bg-warning float-right">65</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">审查详情</h3>

                        <div class="card-tools">
                            <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                            <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="mailbox-read-info">
                            <h5>${info.result.exam.EName}成绩审查</h5>
                            <h6>From: ${info.student.stu_name}--学号:${info.SNo}
                                <span class="mailbox-read-time float-right">${info.time}</span></h6>
                            状态:${info.state}
                            <input type="hidden" id="state" value="<%=info.getState()%>">
                        </div>
                        <!-- /.mailbox-read-info -->
                        <div class="mailbox-controls with-border text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                                <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                                    <i class="fas fa-reply"></i>
                                </button>
                                <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
                                    <i class="fas fa-share"></i>
                                </button>
                            </div>
                            <!-- /.btn-group -->
                            <button type="button" class="btn btn-default btn-sm" title="Print">
                                <i class="fas fa-print"></i>
                            </button>
                        </div>
                        <!-- /.mailbox-controls -->
                        <div class="mailbox-read-message">
                            <P>
                                ${info.content}
                            </P>
                        </div>
                        <!-- /.mailbox-read-message -->
                    </div>
                    <div class="card-footer">
                        <div class="float-right">
                            <button type="button" id="reject" class="btn btn-default" onclick="rejectCheck()"><i class="fas fa-reply"></i> 拒绝该审查</button>
                            <button type="button" id="handle" class="btn btn-default" onclick="handleCheck()"><i class="fas fa-share"></i> 确认处理</button>
                        </div>
                        <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> 删除</button>
                        <button type="button" class="btn btn-default"><i class="fas fa-print"></i> 打印</button>
                    </div>
                    <!-- /.card-footer -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>

<aside class="control-sidebar control-sidebar-dark"></aside>
<jsp:include page="${pageContext.request.contextPath}/common/footer.jsp" />
</body>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<script>
    $(function () {
        //Enable check and uncheck all functionality
        $('.checkbox-toggle').click(function () {
            var clicks = $(this).data('clicks')
            if (clicks) {
                //Uncheck all checkboxes
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
                $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
            } else {
                //Check all checkboxes
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
                $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
            }
            $(this).data('clicks', !clicks)
        })

        //Handle starring for font awesome
        $('.mailbox-star').click(function (e) {
            e.preventDefault()
            //detect type
            var $this = $(this).find('a > i')
            var fa    = $this.hasClass('fa')

            //Switch states
            if (fa) {
                $this.toggleClass('fa-star')
                $this.toggleClass('fa-star-o')
            }
        })
    })

    $(document).ready(function () {
        var state = $("#state").val();
        if (state == "已处理"||state == "已拒绝") {
            $("#reject").attr("disabled", true);
            $("#handle").attr("disabled", true);
        }
    })

    function rejectCheck() {
        alert("确认拒绝该审查？");
        <%--location.href = "${pageContext.request.contextPath}/rejectCheck?rID=${info.RID}";--%>
        $.ajax({
            type: "POST",   //提交的方法
            url: "${pageContext.request.contextPath}/rejectCheck", //提交的地址
            async: false,
            data: {
                "rID": ${info.IID}
            },
            dataType: "json",
            error: function () {  //失败的话
                alert("更改成功!");
                location.reload();
            },
            success: function () {  //成功
                alert("更改成功!");
                location.reload();
            }
        });
    }

    function handleCheck() {
        alert("确认处理该审查？");
        var url = "${pageContext.request.contextPath}/handleA?rID=${info.IID}";
        $.post(url, function (data) {
        });
        location.href='${pageContext.request.contextPath}/Grade/CheckDetail.jsp?rID=${info.RID}'
    }
</script>
</html>
