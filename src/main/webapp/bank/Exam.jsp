<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/3
  Time: 17:45
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
    if(no.equals("admin")) {
        exam.findAll();
    } else {
        exam.selectByTeaNo(no);
    }
%>
<html>
<head>
    <title>考试信息管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bs-stepper/css/bs-stepper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/dropzone/min/dropzone.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
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
                        <h1>考试管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">考试管理</li>
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
                                        <th>考试名称</th>
                                        <th>所属科目</th>
                                        <th>试卷名称</th>
                                        <th>考试开始时间</th>
                                        <th>考试结束时间</th>
                                        <th>考试时长</th>
                                        <th>考试状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${exam.examList}" var="exam" varStatus="status">
                                        <tr style="text-align: center">
                                            <td class="text-center">${status.index+1 }</td>
                                            <td class="text-center">${exam.EName }</td>
                                            <td class="text-center">${exam.course.CName }</td>
                                            <td class="text-center">${exam.paper.PName }</td>
                                            <td class="text-center">${exam.startTime }</td>
                                            <td class="text-center">${exam.endTime }</td>
                                            <td class="text-center">${exam.duration }</td>
                                            <td class="text-center">${exam.state }</td>
                                            <td class="text-center">
                                                <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                        data-target="#myModal"
                                                        onclick="modify(${exam.EID})">修改
                                                </button>
                                                <button type="button" class="btn bg-red btn-xs "
                                                        onclick="delt(${exam.EID})">删除
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
                                <input type="hidden" name="EId" id="EId">

                                <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                <label for="ExamName" class="col-sm-3 control-label">考试名称</label>
                                <div class="col-sm-9">
                                    <input id="ExamName" type="text" class="form-control rounded"
                                           name="ExamName" required="required" placeholder="考试名称"/>
                                </div>
                                <br>
                                <br>

                                <label for="Duration" class="col-sm-10 control-label">考试时长（单位：分钟）</label>
                                <div class="col-sm-9">
                                    <input id="Duration" type="text" class="form-control rounded"
                                           name="Duration" required="required" placeholder="请输入考试时长"/>
                                </div>
                                <br>
                                <br>

                                <label for="StartTime" class="col-sm-3 control-label">开始时间</label>
                                <div class="input-group date col-sm-9" id="BeginTime" data-target-input="nearest">
                                    <div class="input-group-append" data-target="#BeginTime" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                    <input id="StartTime" type="text" class="form-control datetimepicker-input" data-target="#BeginTime"/>
                                </div>
                                <br>
                                <br>

                                <label for="EndTime" class="col-sm-3 control-label">结束时间</label>
                                <div class="input-group date col-sm-9" id="OverTime" data-target-input="nearest">
                                    <div class="input-group-append" data-target="#OverTime" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                    <input id="EndTime" type="text" class="form-control datetimepicker-input" data-target="#OverTime"/>
                                </div>
                                <br>
                                <br>

                                <label for="CourseID" class="col-sm-3 control-label">所属课程</label>
                                <div class="col-sm-9">
                                    <select id="CourseID" style="width: 100%;" name="CourseID" class="form-control">
                                        <option value="">请选择...</option>
                                    </select>
                                </div>
                                <br>
                                <br>

                                <label for="PaperID" class="col-sm-3 control-label">选择试卷</label>
                                <div class="col-sm-9">
                                    <select id="PaperID" style="width: 100%;" name="PaperID" class="form-control">
                                    </select>
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
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/select2/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/inputmask/jquery.inputmask.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/dropzone/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script>
    $('#myModal').on('hidden.bs.modal', function () {
        document.getElementById("myForm").reset();
        $("#btn").text('保存');
        $("#title").text('新增');
    });

    $('#BeginTime').datetimepicker({
        format: "YYYY-MM-DD hh:mm:ss",
        autoclose: true,
        todayBtn: true,
        language: "zh-CN",
        icons: { time: 'far fa-clock' }
    });

    $('#OverTime').datetimepicker({
        format: "YYYY-MM-DD hh:mm:ss",
        autoclose: true,
        todayBtn: true,
        language: "zh-CN",
        icons: { time: 'far fa-clock' }
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
        document.getElementById("EId").value = did;

        var url = "${pageContext.request.contextPath}/course/findAll";
        $.get(url, function (data) {
            var html = "";
            html += "<option value='0'>请选择</option>";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].cID + "\">" + data[i].cName + "</option>";
            }
            $("#CourseID").html(html);
        });

        var url1 = "${pageContext.request.contextPath}/exam/selectByPK?eid=" + did;
        $.get(url1, function (data) {
            document.getElementById("ExamName").value = data.eName;
            document.getElementById("CourseID").value = data.course.cName;
            document.getElementById("StartTime").value = data.startTime;
            document.getElementById("EndTime").value = data.endTime;
            document.getElementById("Duration").value = data.duration;
            document.getElementById("PaperID").value = data.paper.pName;
        });

        $("#CourseID").attr("disabled", true);
        $("#PaperID").attr("disabled", true);
    }

    function getAllDept() {
        var url = "${pageContext.request.contextPath}/course/findAll";
        $.get(url, function (data) {
            var html = "";
            html += "<option value='0'>请选择</option>";
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
        $("#CourseID").removeAttr("disabled");
        $("#PaperID").removeAttr("disabled");
    }

    $("#CourseID").change(function () {
        var url = "${pageContext.request.contextPath}/paper/findByCourseId";
        var cID = $("#CourseID").val();
        $.get(url, {cID: cID}, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].pID + "\">" + data[i].pName + "</option>";
            }
            $("#PaperID").html(html);
        });
    });

    function delt(id) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/exam/deleteByPK?id=' + id;
            alert("删除成功!");
            location.reload();
        }
    }

    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/exam/update", //提交的地址
                async: false,
                data: {
                    "EId": $("#EId").val(),
                    "ExamName": $("#ExamName").val(),
                    "StartTime": $("#StartTime").val(),
                    "EndTime": $("#EndTime").val(),
                    "Duration": $("#Duration").val()
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
                url: "${pageContext.request.contextPath}/exam/add", //提交的地址
                async: false,
                data: {
                    "ExamName": $("#ExamName").val(),
                    "CourseID": $("#CourseID").val(),
                    "StartTime": $("#StartTime").val(),
                    "EndTime": $("#EndTime").val(),
                    "Duration": $("#Duration").val(),
                    "PaperID": $("#PaperID").val()
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



