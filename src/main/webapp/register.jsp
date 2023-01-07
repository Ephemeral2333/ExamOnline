<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/12/24
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HAUT在线考试系统注册</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body style="background-image: url('assets/images/bg.png')">
    <div id="app">
        <div class="bjimg">
            <div style="width: 40%;margin-left: 30%;margin-top: 6%">
                <p style="text-align: center"><img src="assets/images/logo.png" height="70"/></p>
                <el-card class="box-card" shadow="always">
                    <div slot="header" class="clearfix">
                        <strong><span style="color:#a768db;">学生</span>注册</strong>
                        <a href="login.jsp">
                            <el-button style="float: right; padding: 3px 0" type="text">去登录<i class="el-icon-caret-right"></i></el-button>
                        </a>
                    </div>
                    <div class="text item">
                        <el-form ref="form" :model="form" :rules="rules" label-width="80px" class="demo-ruleForm">
                            <el-form-item label="学号" prop="userName">
                                <el-input v-model="form.userName" id="userName"></el-input>
                            </el-form-item>
                            <el-form-item label="姓名" prop="name">
                                <el-input v-model="form.name" id="name"></el-input>
                            </el-form-item>
                            <el-form-item label="邮箱" prop="email">
                                <el-input v-model="form.email" id="email"></el-input>
                            </el-form-item>
                            <el-form-item label="密码" prop="password">
                                <el-input v-model="form.password" type="password" id="password"></el-input>
                            </el-form-item>
                            <el-form-item label="确认密码" prop="password2">
                                <el-input v-model="form.password2" type="password" id="password2"></el-input>
                            </el-form-item>
                            <el-form-item label="验证码" prop="verifyCode">
                                <el-input v-model="form.verifyCode" style="width: 60%" id="verifyCode"></el-input>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <el-button style="width: 30%" type="primary" id="getCode">获取验证码</el-button>
                            </el-form-item>
                            <div style="text-align: center">
                                <el-button type="primary" id="submit" size="medium">注册</el-button>
                            </div>
                        </el-form>
                    </div>
                </el-card>
            </div>
        </div>
    </div>
</body>
<script src="assets/plugins/jQuery/jquery-3.6.1.min.js" type="text/javascript"></script>
<script>
    var Main = {
        data() {
            return {
                form: {
                    userName: "",
                    password: "",
                    password2: "",
                    name: "",
                    email: "",
                    verifyCode: ""
                },
                rules: {
                    userName: [
                        {required: true, message: "请输入用户名", trigger: "blur"},
                        {min: 3, max: 10, message: "长度在 3 到 10 个字符", trigger: "blur"}
                    ],
                    password: [
                        {required: true, message: "请输入密码", trigger: "blur"},
                        {min: 6, max: 10, message: "长度在 6 到 10 个字符", trigger: "blur"}
                    ],
                    password2: [
                        {required: true, message: "请再次输入密码", trigger: "blur"},
                        {min: 6, max: 10, message: "长度在 6 到 10 个字符", trigger: "blur"}
                    ],
                    name: [
                        {required: true, message: "请输入姓名", trigger: "blur"},
                        {min: 2, max: 10, message: "长度在 2 到 10 个字符", trigger: "blur"}
                    ],
                    email: [
                        {required: true, message: "请输入邮箱", trigger: "blur"},
                        {type: "email", message: "请输入正确的邮箱地址", trigger: ["blur", "change"]}
                    ],
                    verifyCode: [
                        {required: true, message: "请输入验证码", trigger: "blur"},
                        {min: 6, max: 6, message: "长度为 6 个字符", trigger: "blur"}
                    ]
                }
            };
        }
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
<script>
    $(document).ready(function () {
        $("#submit").click(function () {
            var userName = $("#userName").val();
            var password = $("#password").val();
            var password2 = $("#password2").val();
            var name = $("#name").val();
            var email = $("#email").val();
            var verifyCode = $("#verifyCode").val();
            if (userName == "" || password == "" || password2 == "" || name == "" || email == "" || verifyCode == "") {
                alert("请填写完整信息");
            } else if (password != password2) {
                alert("两次密码不一致");
            } else {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/register",
                    data: {
                        "userName": userName,
                        "password": password,
                        "name": name,
                        "email": email,
                        "verifyCode": verifyCode
                    },
                    dataType: "json",
                    success: function (msg) {
                        if (msg==-1) {
                            alert("验证码错误");
                        } else {
                            alert("注册成功");
                            window.location.href = "login.jsp";
                        }
                    }
                });
            }
        });
        // 获取验证码
        $("#getCode").click(function () {
            var email = $("#email").val();
            if (email == "") {
                alert("请填写邮箱");
            } else {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/email",
                    data: {
                        "email": email
                    },
                    dataType: "json",
                    success: function (data) {
                        alert("验证码已发送");
                    }
                });
            }
        });
    });
</script>
</html>
