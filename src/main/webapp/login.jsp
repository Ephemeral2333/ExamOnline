<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/12/24
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HAUT在线考试系统登录</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body  style="background-image: url('assets/images/bg.png')">
    <div id="app">
        <div class="bjimg">
            <div  style="width: 40%;margin-left: 30%;margin-top: 6%">
                <p style="text-align: center"><img src="assets/images/logo.png" height="100" alt=""/></p>
                <el-card class="box-card" shadow="always">
                    <div slot="header" class="clearfix">
                        <strong><strong style="color: #a768db">{{ form.type }}</strong>登录</strong>
                        <a href="register.jsp">
                            <el-button style="float: right; padding: 3px 0" type="text">去注册<i class="el-icon-caret-right"></i></el-button>
                        </a>
                    </div>
                    <div class="text item">
                        <el-form ref="form" :model="form" :rules="rules" label-width="80px" class="demo-ruleForm">
                            <el-form-item label="账号" prop="userName">
                                <el-input v-model="form.userName" id="userName"></el-input>
                            </el-form-item>
                            <el-form-item label="密码" prop="password">
                                <el-input v-model="form.password" type="password" id="password"></el-input>
                            </el-form-item>
                            <div style="text-align: center">
                                <el-button type="primary" size="medium" id="submit">登录</el-button>
                            </div>
                        </el-form>
                    </div>
                </el-card>
            </div>
        </div>
    </div>
</body>

<script>
    var Main = {
        data() {
            return {
                form: {
                    userName: "",
                    password: "",
                    type: "用户"
                },
                rules: {
                    userName: [
                        { required: true, message: "请输入用户名", trigger: "blur" },
                        { min: 3, max: 20, message: "长度在 3 到 20 个字符", trigger: "blur" }
                    ],
                    password: [
                        { required: true, message: "请输入密码", trigger: "blur" },
                        { min: 3, max: 12, message: "长度在 3 到 12 个字符", trigger: "blur" }
                    ]
                }
            };
        }
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
<script src="assets/plugins/jQuery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
        $("#submit").click(function() {
            var userName = $("#userName").val();
            var password = $("#password").val();
            $.ajax({
                url: "login",
                type: "post",
                data: {
                    userName: userName,
                    password: password
                },
                success: function(data) {
                    window.location.href = "main.jsp";
                },
                error: function() {
                    alert("密码错误");
                }
            });
        });
    });
</script>
</html>
