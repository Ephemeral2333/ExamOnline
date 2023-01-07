<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/12/26
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/12/25
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="department" class="entity.Department" scope="application"/>
<%
  department.findAll();
%>
<html>
<head>
  <title>学院信息管理</title>
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
            <h1>学院管理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首页</a></li>
              <li class="breadcrumb-item active">学院管理</li>
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
                      <button type="button" class="btn btn-default" title="新建"
                              data-toggle="modal" data-target="#myModal" onclick="">
                        <i class="fa fa-file-o"></i> 新建
                      </button>
                      <button id="refresh1" type="button" class="btn btn-default" title="刷新">
                        <i class="fa fa-refresh"></i> 刷新
                      </button>
                    </div>
                  </div>
                </div>
                <hr>

                <table id="dataTable" class="table table-bordered table-hover">
                  <thead>
                  <tr style="text-align: center">
                    <th>序号</th>
                    <th>学院</th>
                    <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${department.departmentList}" var="departments" varStatus="status">
                      <tr style="text-align: center">
                        <td class="text-center">${status.index+1 }</td>
                        <td class="text-center">${departments.d_name }</td>
                        <td class="text-center">
                          <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                  data-target="#myModal"
                                  onclick="modify(${departments.d_id})">修改
                          </button>
                          <button type="button" class="btn bg-red btn-xs "
                                  onclick="delt(${departments.d_id})">删除
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

    <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <form id="myForm" method="post">
          <div class="modal-content" style="border-radius: 6px">
            <div class="modal-header">
              <h4 class="modal-title" id="title">新建</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <input type="hidden" name="DId" id="DId">

                <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                <label for="DName" class="col-sm-3 control-label">学院名称</label>
                <div class="col-sm-9">
                  <input id="DName" type="text" class="form-control rounded"
                         name="DName" required="required" placeholder="学院名称"/>
                </div>
                <br>
                <br>
              </div>
            </div>

            <div class="modal-footer">
              <button id="Submitbtn" type="button" class="btn bg-maroon">保存</button>
              <button type="button" class="btn bg-blue" data-dismiss="modal" id="quit" onclick="quited()">关闭</button>
            </div>
          </div>
        </form>
      </div>
    </div>
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
  $('#myModal').on('hidden.bs.modal', function () {
    document.getElementById("myForm").reset();
    $("#btn").text('保存');
    $("#title").text('新增');
  });

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

  function modify(did) {
    document.getElementById("updateOrInsert").value = "update";
    $("#Submitbtn").text('修改');
    $("#title").text('修改');
    document.getElementById("DId").value = did;
  }

  function quited() {
    document.getElementById("updateOrInsert").value = "insert";
    $("#Submitbtn").text('保存');
    $("#title").text('新建');
  }

  function delt(dId) {
    if (confirm("您确定要删除吗？")) {
      location.href = '${pageContext.request.contextPath}/dept/deleteByPK?dId=' + dId;
      alert("删除成功!");
      location.reload();
    }
  }

  $("#Submitbtn").click(function () {
    var updateorinsert = document.getElementById("updateOrInsert").value.toString();
    if (updateorinsert == "update") {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/dept/update", //提交的地址
        async: false,
        data: {
          "dId": $("#DId").val(),
          "dName": $("#DName").val()
        },
        dataType: "json",
        error: function () {  //失败的话
          alert("修改失败!")
        },
        success: function (msg) {  //成功
          if (msg==-1)
            alert("修改失败!");
          else {
            alert("修改成功!");
            location.reload();
          }
        }
      });
    } else {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/dept/add", //提交的地址
        async: false,
        data: {
          "dName": $("#DName").val()
        },
        dataType: "json",
        error: function () {  //失败的话
          alert("添加失败!")
        },
        success: function (msg) {  //成功
          if (msg==-1)
            alert("添加失败!");
          else {
            alert("添加成功!");
            location.reload();
          }
        }
      });
    }
  });
</script>
</html>

