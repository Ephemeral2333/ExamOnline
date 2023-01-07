<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String name = session.getAttribute("name").toString();
%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/main.jsp" class="brand-link">
        <img src="${pageContext.request.contextPath}/assets/images/img_1.png" alt="AdminLTE Logo" width="128" height="128" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">HAUT-EXAM</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="${pageContext.request.contextPath}/assets/images/img.png" width="160" height="160" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><%=name%></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/profile.jsp" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            个人信息
                        </p>
                    </a>
                </li>

                <!--我的考试--学生-->
                <shiro:hasRole name="学生">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-copy"></i>
                            <p>
                                我的考试
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/exam/ReadyExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>待考考试</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/exam/OverExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>已考考试</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--报名申请--学生-->
                <shiro:hasRole name="学生">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-envelope"></i>
                            <p>
                                报名申请
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/info/StuApply.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>成绩申诉</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--考试管理--教师-->
                <shiro:hasRole name="教师">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                考试管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/Exam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>考试管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--题库管理--教师-->
                <shiro:hasRole name="教师">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tree"></i>
                            <p>
                                题库管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/bank.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>我的题库</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/point.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>知识点管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/GroupPaper.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>试卷管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--成绩管理--教师-->
                <shiro:hasRole name="教师">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                成绩管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/CheckExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>试卷批改</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>成绩管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeAnalysis.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>成绩分析</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--信息管理--教师-->
                <shiro:hasRole name="教师">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-envelope"></i>
                            <p>
                                信息管理
                                <i class="fas fa-angle-left right"></i>
                                <span class="badge badge-info right">2</span>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/info/ApplyList.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>申诉信息处理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--人员管理--管理员-->
                <shiro:hasRole name="管理员">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                人员管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/people/studentManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>学生管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/people/teacherManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>教师管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--院系管理--管理员-->
                <shiro:hasRole name="管理员">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-calendar-alt"></i>
                            <p>
                                院系管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/deptMan.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>学院管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/major.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>专业管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/classes.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>班级管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/course.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>课程管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--考试管理--管理员-->
                <shiro:hasRole name="管理员">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                考试管理
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/Exam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>考试管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/bank.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>题库管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>成绩管理</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/GroupPaper.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>试卷管理</p>
                                </a>
                            </li>
    <%--                        <li class="nav-item">--%>
    <%--                            <a href="pages/charts/flot.html" class="nav-link">--%>
    <%--                                <i class="far fa-circle nav-icon"></i>--%>
    <%--                                <p>题型管理</p>--%>
    <%--                            </a>--%>
    <%--                        </li>--%>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/point.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>知识点管理</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/login.jsp" class="nav-link">
                        <i class="nav-icon far fa-circle text-danger"></i>
                        <p>
                            注销
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>