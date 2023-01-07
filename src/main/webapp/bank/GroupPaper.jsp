<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/1
  Time: 16:41
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<jsp:useBean id="paper" class="entity.Paper" scope="application"/>
<%
    Subject subject = (Subject) session.getAttribute("subject");
    String no = subject.getPrincipal().toString();
    if(no.equals("admin")) {
        paper.findAll();
    } else {
        paper.selectByTeaNo(no);
    }
%>
<html>
<head>
    <title>试卷信息管理</title>
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
                        <h1>试卷管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">试卷管理</li>
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
                                                    data-toggle="modal" data-target="#myModal" onclick="getAllDept()">
                                                <i class="fa fa-file-o"></i> 新建
                                            </button>
                                            <button id="refresh1" type="button" class="btn btn-default" title="刷新"
                                                    data-toggle="modal" data-target="#myModal" onclick="GroupPaper()" >
                                                <i class="fa fa-refresh"></i> 自动组卷
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <hr>

                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr style="text-align: center">
                                        <th>序号</th>
                                        <th>试卷名称</th>
                                        <th>所属课程</th>
                                        <th>试卷总分</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${paper.paperList}" var="paper" varStatus="status">
                                        <tr style="text-align: center">
                                            <td class="text-center">${status.index+1 }</td>
                                            <td class="text-center">${paper.PName }</td>
                                            <td class="text-center">${paper.course.CName }</td>
                                            <td class="text-center">${paper.PScore }</td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs"
                                                        onclick="location.href='${pageContext.request.contextPath}/bank/PaperDetail.jsp?pID=${paper.PID}'">详情
                                                </button>
                                                <button type="button" class="btn bg-red btn-xs "
                                                        onclick="delt(${paper.PID})">删除
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
                                <input type="hidden" name="PId" id="PId">

                                <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                <label for="CourseID" class="col-sm-3 control-label">所属课程</label>
                                <div class="col-sm-9">
                                    <select id="CourseID" style="width: 100%;" name="CourseID" class="form-control">
                                    </select>
                                </div>
                                <br>
                                <br>
                                <label for="PName" class="col-sm-3 control-label">试卷名称</label>
                                <div class="col-sm-9">
                                    <input id="PName" type="text" class="form-control rounded"
                                           name="PName" required="required" placeholder="试卷名称"/>
                                </div>
                                <br>
                                <br>

                                <label for="BankID" class="col-sm-3 control-label">选择题库</label>
                                <div class="col-sm-9">
                                    <select id="BankID" style="width: 100%;" name="BankID" class="form-control" disabled="disabled">
                                    </select>
                                </div>
                                <br>
                                <br>

                                <label for="SingleNum" class="col-sm-3 control-label">单选题个数</label>
                                <div class="col-sm-9">
                                    <input id="SingleNum" type="text" class="form-control rounded"
                                           name="SingleNum" required="required" placeholder="单选题个数" disabled="disabled"/>
                                </div>
                                <br>
                                <br>

                                <label for="FillNum" class="col-sm-3 control-label">填空题个数</label>
                                <div class="col-sm-9">
                                    <input id="FillNum" type="text" class="form-control rounded"
                                           name="FillNum" required="required" placeholder="填空题个数" disabled="disabled"/>
                                </div>
                                <br>
                                <br>

                                <label for="JudgeNum" class="col-sm-3 control-label">判断题个数</label>
                                <div class="col-sm-9">
                                    <input id="JudgeNum" type="text" class="form-control rounded"
                                           name="JudgeNum" required="required" placeholder="判断题个数" disabled="disabled"/>
                                </div>
                                <br>
                                <br>

                                <label for="ShortNum" class="col-sm-3 control-label">简答题个数</label>
                                <div class="col-sm-9">
                                    <input id="ShortNum" type="text" class="form-control rounded"
                                           name="ShortNum" required="required" placeholder="简答题个数" disabled="disabled"/>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button id="Submitbtn" type="button" class="btn bg-maroon">选择题目</button>
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

    function GroupPaper() {
        var url = "${pageContext.request.contextPath}/course/findAll";
        $.get(url, function (data) {
            var html = "";
            html += "<option value=''>请选择</option>";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].cID + "\">" + data[i].cName + "</option>";
            }
            $("#CourseID").html(html);
        });

        document.getElementById("updateOrInsert").value = "update";
        $("#Submitbtn").text('自动组卷');
        $("#title").text('自动组卷');
        $("#BankID").removeAttr("disabled");
        $("#SingleNum").removeAttr("disabled");
        $("#FillNum").removeAttr("disabled");
        $("#JudgeNum").removeAttr("disabled");
        $("#ShortNum").removeAttr("disabled");
    }

    $("#CourseID").change(function () {
        var url = "${pageContext.request.contextPath}/bank/findByCourseID?courseID=" + $("#CourseID").val();
        $.get(url, function (data) {
            var html = "";
            html += "<option value=''>请选择</option>";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].bID + "\">" + data[i].bName + "</option>";
            }
            $("#BankID").html(html);
        });
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

    function getAllDept() {
        var url = "${pageContext.request.contextPath}/course/findAll";
        $.get(url, function (data) {
            var html = "";
            html += "<option value=''>请选择</option>";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].cID + "\">" + data[i].cName + "</option>";
            }
            $("#CourseID").html(html);
        });
    }

    function quited() {
        document.getElementById("updateOrInsert").value = "insert";
        $("#Submitbtn").text('保存');
        $("#title").text('新建');
        $("#BankID").attr("disabled", "disabled");
        $("#SingleNum").attr("disabled", "disabled");
        $("#FillNum").attr("disabled", "disabled");
        $("#JudgeNum").attr("disabled", "disabled");
        $("#ShortNum").attr("disabled", "disabled");
    }

    function delt(id) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/paper/deleteByPK?id=' + id;
            alert("删除成功!");
            location.reload();
        }
    }

    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "insert"){
            location.href = '${pageContext.request.contextPath}/bank/ChooseQuestion.jsp?pID=' + $("#PId").val() + '&cID=' + $("#CourseID").val() + '&pName=' + $("#PName").val();
        } else {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/paper/autogroup", //提交的地址
                async: false,
                data: {
                    "CourseID": $("#CourseID").val(),
                    "BankID": $("#BankID").val(),
                    "PName": $("#PName").val(),
                    "SingleNum": $("#SingleNum").val(),
                    "FillNum": $("#FillNum").val(),
                    "JudgeNum": $("#JudgeNum").val(),
                    "ShortNum": $("#ShortNum").val()
                },
                dataType: "json",
                error: function () {  //失败的话
                    alert("组卷失败!")
                },
                success: function (msg) {  //成功
                    if (msg==-1)
                        alert("组卷失败!");
                    else {
                        alert("组卷成功!");
                        location.reload();
                    }
                }
            });
        }
    });
</script>
</html>



