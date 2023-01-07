<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/4
  Time: 22:21
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<jsp:useBean id="result" class="entity.Result" scope="application"/>
<%
  Subject subject = (Subject) session.getAttribute("subject");
  String no = subject.getPrincipal().toString();
  if (no.equals("admin")) {
    result.findAll();
  } else {
    result.selectAlreadyCheck(no);
  }
%>
<html>
<head>
  <title>成绩列表</title>
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
            <h1>成绩列表</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首页</a></li>
              <li class="breadcrumb-item active">成绩列表</li>
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

                <table id="dataTable" class="table table-bordered table-hover">
                  <thead>
                  <tr style="text-align: center">
                    <th>序号</th>
                    <th>考试名称</th>
                    <th>学生姓名</th>
                    <th>学生班级</th>
                    <th>试卷总分</th>
                    <th>学生成绩</th>
                    <th>考试状态</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${result.resultList}" var="result" varStatus="status">
                    <tr style="text-align: center">
                      <td class="text-center">${status.index+1 }</td>
                      <td class="text-center">${result.exam.EName }</td>
                      <td class="text-center">${result.student.stu_name }</td>
                      <td class="text-center">${result.student.classes.CName }</td>
                      <td class="text-center">${result.exam.paper.PScore }分</td>
                      <td class="text-center">${result.SScore == -1 ? "未批":result.SScore }分</td>
                        <td class="text-center">${result.stage }</td>
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
        "sLoadingRecords": "正在加载...",
        "sProcessing": "正在获取数据，请稍候...",
        "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
        "sInfoFiltered": "(从_MAX_条筛选 )",
        "sInfoEmpty": "共筛选到0条",
        "sSearch": "搜索:",
        "sLengthMenu": "每页显示 _MENU_ 条",
        "sZeroRecords": "无相关记录",
        "paginate": {
          "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
          "sLast": "尾页",
          "sPrevious": "上一页",
          "sNext": "下一页",
          "first": "First page",
          "last": "Last page",
          "next": "下一页",
          "previous": "上一页"
        }
      },
      "buttons": ["copy", "csv", "excel", "pdf", "colvis"]
    }).buttons().container().appendTo('#dataTable_wrapper .col-md-6:eq(0)');
  });
</script>
</html>

