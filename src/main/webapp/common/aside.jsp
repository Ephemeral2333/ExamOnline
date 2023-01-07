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
                            ������Ϣ
                        </p>
                    </a>
                </li>

                <!--�ҵĿ���--ѧ��-->
                <shiro:hasRole name="ѧ��">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-copy"></i>
                            <p>
                                �ҵĿ���
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/exam/ReadyExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>��������</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/exam/OverExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ѿ�����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--��������--ѧ��-->
                <shiro:hasRole name="ѧ��">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-envelope"></i>
                            <p>
                                ��������
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/info/StuApply.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ɼ�����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--���Թ���--��ʦ-->
                <shiro:hasRole name="��ʦ">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                ���Թ���
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/Exam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>���Թ���</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--������--��ʦ-->
                <shiro:hasRole name="��ʦ">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tree"></i>
                            <p>
                                ������
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/bank.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ҵ����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/point.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>֪ʶ�����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/GroupPaper.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�Ծ����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--�ɼ�����--��ʦ-->
                <shiro:hasRole name="��ʦ">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                �ɼ�����
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/CheckExam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�Ծ�����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ɼ�����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeAnalysis.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ɼ�����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--��Ϣ����--��ʦ-->
                <shiro:hasRole name="��ʦ">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-envelope"></i>
                            <p>
                                ��Ϣ����
                                <i class="fas fa-angle-left right"></i>
                                <span class="badge badge-info right">2</span>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/info/ApplyList.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>������Ϣ����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--��Ա����--����Ա-->
                <shiro:hasRole name="����Ա">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                ��Ա����
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/people/studentManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>ѧ������</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/people/teacherManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>��ʦ����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--Ժϵ����--����Ա-->
                <shiro:hasRole name="����Ա">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-calendar-alt"></i>
                            <p>
                                Ժϵ����
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/deptMan.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>ѧԺ����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/major.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>רҵ����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/classes.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�༶����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/department/course.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�γ̹���</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <!--���Թ���--����Ա-->
                <shiro:hasRole name="����Ա">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                ���Թ���
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/Exam.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>���Թ���</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/bank.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>������</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/Grade/GradeManage.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�ɼ�����</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/GroupPaper.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>�Ծ����</p>
                                </a>
                            </li>
    <%--                        <li class="nav-item">--%>
    <%--                            <a href="pages/charts/flot.html" class="nav-link">--%>
    <%--                                <i class="far fa-circle nav-icon"></i>--%>
    <%--                                <p>���͹���</p>--%>
    <%--                            </a>--%>
    <%--                        </li>--%>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bank/point.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>֪ʶ�����</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/login.jsp" class="nav-link">
                        <i class="nav-icon far fa-circle text-danger"></i>
                        <p>
                            ע��
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>