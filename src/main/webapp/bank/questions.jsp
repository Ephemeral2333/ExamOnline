<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/1
  Time: 21:28
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="question" class="entity.Question" scope="application"/>
<%
    String bID = request.getParameter("bID");
    question.selectByBankID(Integer.parseInt(bID));
%>
<html>
<head>
    <title>题目管理</title>
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
                        <h1>题目管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">题目管理</li>
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
                                        <th>题目</th>
                                        <th>题目类型</th>
                                        <th>分值</th>
                                        <th>知识点</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${question.questionList}" var="question" varStatus="status">
                                        <tr style="text-align: center">
                                            <td class="text-center">${status.index+1 }</td>
                                            <td class="text-center">${question.QName }</td>
                                            <td class="text-center">${question.QType }</td>
                                            <td class="text-center">${question.QScore }</td>
                                            <td class="text-center">${question.point.PName }</td>
                                            <td class="text-center">
<%--                                                <button type="button" class="btn bg-olive btn-xs"--%>
<%--                                                        onclick="location.href='${pageContext.request.contextPath}/bank/qDetail.jsp?bID=${question.QID}'">修改--%>
<%--                                                </button>--%>
                                                <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                        data-target="#myModal"
                                                        onclick="modify(${question.QID})">修改
                                                </button>
                                                <button type="button" class="btn bg-red btn-xs "
                                                        onclick="delt(${question.QID})">删除
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
                                <input type="hidden" name="QId" id="QId">
                                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                <input type="hidden" name="BankID" id="BankID" value="<%=bID%>">

                                <label for="QType" class="col-sm-3 control-label">所属题型</label>
                                <div class="col-sm-9">
                                    <select id="QType" style="width: 100%;" name="QType" class="form-control">
                                        <option value="">请选择...</option>
                                        <option value="选择题">选择题</option>
                                        <option value="判断题">判断题</option>
                                        <option value="填空题">填空题</option>
                                        <option value="简答题">简答题</option>
                                    </select>
                                </div>
                                <br>
                                <br>

                                <label for="QName" class="col-sm-3 control-label">题目</label>
                                <div class="col-sm-9">
                                    <textarea id="QName" type="text" class="form-control rounded"
                                           name="QName" required="required" placeholder="请输入题目"></textarea>
                                </div>
                                <br>
                                <br>

                                <label for="QScore" class="col-sm-3 control-label">分值</label>
                                <div class="col-sm-9">
                                    <input id="QScore" type="text" class="form-control rounded"
                                              name="QScore" required="required" placeholder="请输入分值">
                                </div>
                                <br>
                                <br>

                                <label for="PointID" class="col-sm-3 control-label">涉及知识点</label>
                                <div class="col-sm-9">
                                    <select id="PointID" style="width: 100%;" name="PointID" class="form-control">
                                        <option value="0">无</option>
                                    </select>
                                </div>
                                <br>
                                <br>

                                <label for="OptA" class="col-sm-3 control-label">选项A</label>
                                <div class="col-sm-9">
                                    <textarea id="OptA" type="text" class="form-control option"
                                              name="OptA" required="required" placeholder="请输入选项A" disabled="disabled"></textarea>
                                </div>
                                <br>
                                <br>

                                <label for="OptB" class="col-sm-3 control-label">选项B</label>
                                <div class="col-sm-9">
                                    <textarea id="OptB" type="text" class="form-control option"
                                              name="OptB" required="required" placeholder="请输入选项B" disabled="disabled"></textarea>
                                </div>
                                <br>
                                <br>

                                <label for="OptC" class="col-sm-3 control-label">选项C</label>
                                <div class="col-sm-9">
                                    <textarea id="OptC" type="text" class="form-control option"
                                              name="OptC" required="required" placeholder="请输入选项C" disabled="disabled"></textarea>
                                </div>
                                <br>
                                <br>

                                <label for="OptD" class="col-sm-3 control-label">选项D</label>
                                <div class="col-sm-9">
                                    <textarea id="OptD" type="text" class="form-control option"
                                              name="OptD" required="required" placeholder="请输入选项D" disabled="disabled"></textarea>
                                </div>
                                <br>
                                <br>

                                <label for="QAnswer" class="col-sm-3 control-label">题目答案</label>
                                <div class="col-sm-9">
                                    <textarea id="QAnswer" type="text" class="form-control rounded"
                                           name="QAnswer" placeholder="请输入答案"></textarea>
                                </div>

                                <label for="ChoiceAnswer" class="col-sm-3 control-label" style="display: none">题目答案</label>
                                <div class="col-sm-9">
                                    <select id="ChoiceAnswer" style="width: 100%; display: none" name="ChoiceAnswer" class="form-control">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>

                                <label for="JudgeAnswer" class="col-sm-3 control-label" style="display: none">题目答案</label>
                                <div class="col-sm-9">
                                    <select id="JudgeAnswer" style="width: 100%; display: none" name="JudgeAnswer" class="form-control">
                                        <option value="正确">正确</option>
                                        <option value="错误">错误</option>
                                    </select>
                                </div>
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
        document.getElementById("QId").value = did;

        var url = "${pageContext.request.contextPath}/point/selectByBankId?bankId=" + $("#BankID").val();
        $.get(url, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].pID + "\">" + data[i].pName + "</option>";
            }
            $("#PointID").html(html);
        });

        var url1 = "${pageContext.request.contextPath}/question/selectByPK?id=" + did;
        $.get(url1, function (data) {
            document.getElementById("QName").value = data.qName;
            document.getElementById("QType").value = data.qType;
            document.getElementById("QType").value = data.qType;
            document.getElementById("QScore").value = data.qScore;
            document.getElementById("PointID").value = data.pointID;
            document.getElementById("BankID").value = data.bankID;
            if (data.qType == "选择题") {
                $(".option").removeAttr("disabled");
                $("#ChoiceAnswer").show();
                $("#JudgeAnswer").hide();
                $("#QAnswer").hide();
                document.getElementById("OptA").value = data.opti.optA;
                document.getElementById("OptB").value = data.opti.optB;
                document.getElementById("OptC").value = data.opti.optC;
                document.getElementById("OptD").value = data.opti.optD;
                document.getElementById("ChoiceAnswer").value = data.qAnswer;
            } else if (data.qType == "判断题") {
                $(".option").attr("disabled", "disables");
                $("#ChoiceAnswer").hide();
                $("#JudgeAnswer").show();
                $("#QAnswer").hide();
                document.getElementById("JudgeAnswer").value = data.qAnswer;
            } else {
                $(".option").attr("disabled", "disables");
                $("#ChoiceAnswer").hide();
                $("#JudgeAnswer").hide();
                $("#QAnswer").show();
                document.getElementById("QAnswer").value = data.qAnswer;
            }
        });

        document.getElementById("QType").disabled = true;
    }

    function getAllDept() {
        var url = "${pageContext.request.contextPath}/point/selectByBankId?bankId=" + $("#BankID").val();
        $.get(url, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].pID + "\">" + data[i].pName + "</option>";
            }
            $("#PointID").html(html);
        });
    }

    function quited() {
        document.getElementById("updateOrInsert").value = "insert";
        $("#Submitbtn").text('保存');
        $("#title").text('新建');
        document.getElementById("QType").disabled = false;
    }

    function delt(id) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/question/deleteByPK?id=' + id;
            alert("删除成功!");
            location.reload();
        }
    }

    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        document.getElementById("QType").disabled = false;
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/question/update", //提交的地址
                async: false,
                data: {
                    "QId": $("#QId").val(),
                    "BankID": $("#BankID").val(),
                    "QName": $("#QName").val(),
                    "QType": $("#QType").val(),
                    "QAnswer": $("#QAnswer").val(),
                    "QScore": $("#QScore").val(),
                    "PointID": $("#PointID").val(),
                    "OptA": $("#OptA").val(),
                    "OptB": $("#OptB").val(),
                    "OptC": $("#OptC").val(),
                    "OptD": $("#OptD").val(),
                    "ChoiceAnswer": $("#ChoiceAnswer").val(),
                    "JudgeAnswer": $("#JudgeAnswer").val()
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
                url: "${pageContext.request.contextPath}/question/add", //提交的地址
                async: false,
                data: {
                    "BankID": $("#BankID").val(),
                    "QName": $("#QName").val(),
                    "QType": $("#QType").val(),
                    "QAnswer": $("#QAnswer").val(),
                    "QScore": $("#QScore").val(),
                    "PointID": $("#PointID").val(),
                    "OptA": $("#OptA").val(),
                    "OptB": $("#OptB").val(),
                    "OptC": $("#OptC").val(),
                    "OptD": $("#OptD").val(),
                    "ChoiceAnswer": $("#ChoiceAnswer").val(),
                    "JudgeAnswer": $("#JudgeAnswer").val()
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

    $("#QType").change(function () {
        var QType = $("#QType").val();
        if (QType == "选择题") {
            $(".option").removeAttr("disabled");
            $("#ChoiceAnswer").show();
            $("#JudgeAnswer").hide();
            $("#QAnswer").hide();
        }else if (QType == "判断题") {
            $(".option").attr("disabled", "disables");
            $("#ChoiceAnswer").hide();
            $("#JudgeAnswer").show();
            $("#QAnswer").hide();
        } else if (QType == "填空题") {
            $(".option").attr("disabled", "disables");
            $("#ChoiceAnswer").hide();
            $("#JudgeAnswer").hide();
            $("#QAnswer").show();
        } else if (QType == "简答题") {
            $(".option").attr("disabled", "disables");
            $("#ChoiceAnswer").hide();
            $("#JudgeAnswer").hide();
            $("#QAnswer").show();
        }
    });
</script>
</html>



