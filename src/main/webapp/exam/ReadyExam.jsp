<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/4
  Time: 11:04
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<jsp:useBean id="exam" class="entity.Exam" scope="application"/>
<%
    Subject subject = (Subject) session.getAttribute("subject");
    String no = subject.getPrincipal().toString();
    exam.findReadyExam(no);
%>
<html>
<head>
    <title>εΎθθθ―</title>
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
                        <h1>εΎθθθ―</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">ι¦ι‘΅</a></li>
                            <li class="breadcrumb-item active">εΎθθθ―</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button id="refresh1" type="button" class="btn btn-default" title="ε·ζ°">
                                                <i class="fa fa-refresh"></i> ε·ζ°
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <hr>

                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr style="text-align: center">
                                        <th>εΊε·</th>
                                        <th>θθ―εη§°</th>
                                        <th>ζε±θ―Ύη¨</th>
                                        <th>θ―ε·ζ»ε</th>
                                        <th>εΌε§ζΆι΄</th>
                                        <th>η»ζζΆι΄</th>
                                        <th>θθ―ζΆιΏ</th>
                                        <th>ζδ½</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${exam.examList}" var="exam" varStatus="status">
                                        <tr style="text-align: center">
                                            <td class="text-center">${status.index+1 }</td>
                                            <td class="text-center">${exam.EName }</td>
                                            <td class="text-center">${exam.course.CName }</td>
                                            <td class="text-center">${exam.paper.PScore }</td>
                                            <td class="text-center">${exam.startTime }</td>
                                            <td class="text-center">${exam.endTime }</td>
                                            <td class="text-center">${exam.duration }ει</td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs"
                                                        onclick="location.href='${pageContext.request.contextPath}/exam/Examing.jsp?pID=${exam.paper.PID}&eID=${exam.EID}'">εΌε§θθ―
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
    $(function () {
        $('#dataTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "columnDefs": [{"orderable": false, "targets": 0}],
            "ordering": false,
            "info": true,
            "autoWidth": true,
            "language": {
                "sLoadingRecords": "ζ­£ε¨ε θ½½...",
                "sProcessing": "ζ­£ε¨θ·εζ°ζ?οΌθ―·η¨ε...",
                "sInfo": "ε½εζΎη€Ίη¬¬ _START_ ε°η¬¬ _END_ ζ‘οΌε± _TOTAL_ ζ‘",
                "sInfoFiltered": "(δ»_MAX_ζ‘η­ι )",
                "sInfoEmpty": "ε±η­ιε°0ζ‘",
                "sSearch": "ζη΄’:",
                "sLengthMenu": "ζ―ι‘΅ζΎη€Ί _MENU_ ζ‘",
                "sZeroRecords": "ζ ηΈε³θ?°ε½",
                "paginate": {
                    "sFirst": "ι¦ι‘΅",  //ι¦ι‘΅εε°Ύι‘΅εΏι‘»ε¨pagingTypeθ?ΎδΈΊfull_numbersζΆζε―δ»₯
                    "sLast": "ε°Ύι‘΅",
                    "sPrevious": "δΈδΈι‘΅",
                    "sNext": "δΈδΈι‘΅",
                    "first": "First page",
                    "last": "Last page",
                    "next": "δΈδΈι‘΅",
                    "previous": "δΈδΈι‘΅"
                }
            },
            "buttons": ["copy", "csv", "excel", "pdf", "colvis"]
        }).buttons().container().appendTo('#dataTable_wrapper .col-md-6:eq(0)');
    });
</script>
</html>




