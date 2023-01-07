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
<jsp:useBean id="paper" class="entity.Paper" scope="application"/>
<%
  String pID = request.getParameter("pID");
  paper.selectByPK(Integer.parseInt(pID));
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
            <div class="col-sm-20">
              <b>&nbsp;&nbsp;&nbsp;&nbsp;考试名称：<%=paper.getPName()%>；&nbsp;&nbsp;考试总分：<%=paper.getPScore()%>分；&nbsp;&nbsp;试卷科目：<%=paper.getCourse().getCName()%></b>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12" id="accordion">
          <div class="card card-primary card-outline">
            <a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
              <div class="card-header">
                <h4 class="card-title w-100">
                  一、单选题
                </h4>
              </div>
            </a>
            <div id="collapseOne" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <c:forEach items="${paper.single}" var="single" varStatus="status">
                  <div class="card-header">
                    <h5 class="card-title w-100">
                      ${status.index+1}、${single.QName}&nbsp;&nbsp;&nbsp;（分值：${single.QScore}分）
                    </h5>
                  </div>
                  <div class="card-body">
                    <input type="radio" value="A"/>&nbsp;&nbsp;<span class="quesContent">A、${single.opti.optA}</span><br>
                    <input type="radio" value="B"/>&nbsp;&nbsp;<span class="quesContent">B、${single.opti.optB}</span><br>
                    <input type="radio" value="C"/>&nbsp;&nbsp;<span class="quesContent">C、${single.opti.optC}</span><br>
                    <input type="radio" value="D"/>&nbsp;&nbsp;<span class="quesContent">D、${single.opti.optD}</span><br>
                    答案：${single.QAnswer}
                  </div>
                  <hr>
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="card card-warning card-outline">
            <a class="d-block w-100" data-toggle="collapse" href="#collapseFour">
              <div class="card-header">
                <h4 class="card-title w-100">
                  二、判断题
                </h4>
              </div>
            </a>
            <div id="collapseFour" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <c:forEach items="${paper.judge}" var="judge" varStatus="status">
                  <div class="card-header">
                    <h5 class="card-title w-100">
                        ${status.index+1}、${judge.QName}&nbsp;&nbsp;&nbsp;（分值：${judge.QScore}分）
                    </h5>
                  </div>
                  <div class="card-body">
                    <input type="radio" value="A"/>&nbsp;&nbsp;<span class="quesContent">A、正确</span><br>
                    <input type="radio" value="B"/>&nbsp;&nbsp;<span class="quesContent">B、错误</span><br>
                    答案：${judge.QAnswer}
                  </div>
                  <hr>
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="card card-danger card-outline">
            <a class="d-block w-100" data-toggle="collapse" href="#collapseSeven">
              <div class="card-header">
                <h4 class="card-title w-100">
                  三、填空题
                </h4>
              </div>
            </a>
            <div id="collapseSeven" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <c:forEach items="${paper.fill}" var="fill" varStatus="status">
                  <div class="card-header">
                    <h5 class="card-title w-100">
                        ${status.index+1}、${fill.QName}&nbsp;&nbsp;&nbsp;（分值：${fill.QScore}分）
                    </h5>
                  </div>
                  <div class="card-body">
                    答案：${fill.QAnswer}
                  </div>
                  <hr>
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="card card-danger card-outline">
            <a class="d-block w-100" data-toggle="collapse" href="#collapseNine">
              <div class="card-header">
                <h4 class="card-title w-100">
                    四、简答题
                </h4>
              </div>
            </a>
            <div id="collapseNine" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <c:forEach items="${paper.shortAnswer}" var="shortAnswer" varStatus="status">
                  <div class="card-header">
                    <h5 class="card-title w-100">
                        ${status.index+1}、${shortAnswer.QName}&nbsp;&nbsp;&nbsp;（分值：${shortAnswer.QScore}分）
                    </h5>
                  </div>
                  <div class="card-body">
                    答案：${shortAnswer.QAnswer}
                  </div>
                  <hr>
                </c:forEach>
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

</script>
</html>




