<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2023/1/4
  Time: 15:38
  Best Wishes!
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="util.MyBatisUtil" %>
<%@ page import="entity.Result" %>
<%@ page import="dao.ResultMapper" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="paper" class="entity.Paper" scope="application"/>
<jsp:useBean id="exam" class="entity.Exam" scope="application"/>
<%
  String pID = request.getParameter("pID");
  paper.selectByPK(Integer.parseInt(pID));
  String name = session.getAttribute("name").toString();
  Subject subject = (Subject) session.getAttribute("subject");
  String no = subject.getPrincipal().toString();
  String eID = request.getParameter("eID");
  exam.selectByPK(Integer.parseInt(eID));
  SqlSession sqlSession = MyBatisUtil.openSession();
  ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
  int resultID = resultMapper.getResultIDByExamAndStu(no, Integer.parseInt(eID));
  sqlSession.close();

  String startTime = no + name + eID;
  if (session.getAttribute(startTime) != null) {
    startTime = session.getAttribute(startTime).toString();
  } else {
    startTime = "";
  }
%>
<html>
<head>
  <title>考试ing</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/adminLTE/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
  <style>
    .timer {
      height: 50px;
      padding: 0 24px;
      line-height: 50px;
      font-size: 24px;
      background: #efefff;
      border: 1px solid #F2F2F2;
      border-radius: 4px;
      color: #F28C24;
      font-family: din;
    }
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed">
<div class="wrapper">
  <jsp:include page="${pageContext.request.contextPath}/common/header.jsp"/>

  <aside class="main-sidebar sidebar-light-lime elevation-4">
    <div class="sidebar" align="center">
        <b style="text-align: center; font-family: 黑体,'Times New Roman',serif; font-size: 18px;">
          <%=exam.getEName()%>
        </b>
        <br>
        <br><br>
        <!-- 一个深白色的方框-->
      <div class="timer">
        <li class="fa-thin fa fa-clock-o" style="font-size: 20px; color: #0c5460; margin-top: 17px;"></li>
        <span id="lastTime" style="font-size: 20px; color: #0c5460; margin-top: 17px;">
        </span>
      </div>
      <br><br>
      <div class="profile" align="left">
        <p style="font-family: 楷体; font-size: 16px;">学号：<%=no%></p>
        <p style="font-family: 楷体; font-size: 16px;">姓名：<%=name%></p>
        <br>
        <p style="font-family: 楷体; font-size: 16px;">考试科目：<%=paper.getCourse().getCName()%></p>
        <p style="font-family: 楷体; font-size: 16px;">考试时长：<%=exam.getDuration()%>分钟</p>
        <p style="font-family: 楷体; font-size: 16px;">考试时间：<%=exam.getStartTime()%> 至 <%=exam.getEndTime()%></p>
      </div>
    </div>
  </aside>



  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h2>欢迎您,<%=name%></h2>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首页</a></li>
              <li class="breadcrumb-item active">考试ing</li>
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
    <form id="handleExam" action="/handleExam" method="post">
      <input type="hidden" id="rID" name="rID" value="<%=resultID%>">
      <input type="hidden" id="paperID" name="paperID" value="<%=paper.getPID()%>">
      <input type="hidden" id="startTime" name="startTime" value="<%=startTime%>" />
      <input type="hidden" id="endTime" name="endTime" value="${exam.endTime}" />
      <input type="hidden" id="eID" name="eID" value="<%=exam.getEID()%>" />
      <input type="hidden" id="stuNo" name="stuNo" value="<%=no%>" />
      <input type="hidden" id="stuName" name="stuName" value="<%=name%>" />
      <input type="hidden" id="examTime" name="examTime" value="<%=exam.getDuration()%>" />
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
                      <input type="radio" name="${single.QID}" value="A"/>&nbsp;&nbsp;<span class="quesContent">A、${single.opti.optA}</span><br>
                      <input type="radio" name="${single.QID}" value="B"/>&nbsp;&nbsp;<span class="quesContent">B、${single.opti.optB}</span><br>
                      <input type="radio" name="${single.QID}" value="C"/>&nbsp;&nbsp;<span class="quesContent">C、${single.opti.optC}</span><br>
                      <input type="radio" name="${single.QID}" value="D"/>&nbsp;&nbsp;<span class="quesContent">D、${single.opti.optD}</span><br>
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
                      <input type="radio" name="${judge.QID}" value="正确"/>&nbsp;&nbsp;<span class="quesContent">A、正确</span><br>
                      <input type="radio" name="${judge.QID}" value="错误"/>&nbsp;&nbsp;<span class="quesContent">B、错误</span><br>
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
                      <textarea type="text" name="${fill.QID}" class="form-control" placeholder="请输入答案"></textarea>
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
                        <textarea type="text" name="${shortAnswer.QID}" class="form-control" placeholder="请输入答案"></textarea>
                    </div>
                    <hr>
                  </c:forEach>
                </div>
              </div>
            </div>
            <br><br>
            <div class="submit" align="center">
              <button type="button" class="btn btn-block btn-primary btn-lg" onclick="handleExam()">提交考试</button>
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
  $(document).ready(function () {
    if($("#startTime").val() == ""){
      getStartTime();
      alert("考试已开始，请在规定时间内完成考试，考试结束后将自动提交试卷");
    }
    setInterval(showLastTime, 1000);
    if($("#startTime").val() != ""){
      alert("请不要中途离开考试!");
    }
  });

  function getStartTime(){
    var url = "${pageContext.request.contextPath}/getStartTime?no=" + $("#stuNo").val() + "&name=" + $("#stuName").val() + "&eID=" + $("#eID").val();
    $.get(url, function (data) {
      $("#startTime").val(data);
    });
  }

  function showLastTime(){
    var startTime = new Date($("#startTime").val());
    var endTime = new Date($("#endTime").val());
    var now = new Date();
    var examTime = parseInt($("#examTime").val());
    // 剩余秒数
    var last;
    if (startTime.getTime()+examTime*60*1000 > endTime.getTime()){
      last = parseInt((endTime.getTime() - now.getTime())/1000) + 2;
    } else {
      last = parseInt(examTime * 60 - (now.getTime() - startTime.getTime()) / 1000) + 2;
    }

    if(last == 300){
      alert("剩余时间少于5分钟，请尽快答题并提交试卷！");
    }

    if(last == 0){
      alert("考试时间结束，系统将自动提交试卷");
      $("#handleExam").submit();
    }
    var h = twoDigits(parseInt(last / 60 / 60));
    var m = twoDigits(parseInt((last % 3600) / 60));
    var s = twoDigits(parseInt(last % 3600 % 60));
    $("#lastTime").text(h + ":" + m + ":" + s);
  }

  function twoDigits(val){
    if(val < 10)
      return "0" + val;
    return val;
  }

  function handleExam(){
    if(confirm("确定要提交试卷吗？")){
      $("#handleExam").submit();
    }
  }
</script>
</html>





