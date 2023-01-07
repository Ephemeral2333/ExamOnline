### 数据库课程设计--在线考试系统

#### 一、使用技术

- 总体框架：MVC模式
- 前端: JSP + JavaScript+ jQuery + Ajax + CSS + Bootstrap + AdminLTE
- 后端: Java + Servlet
- 安全框架：Shiro
- 项目管理：Maven
- 数据库连接：MyBatis
- DBMS：MySQL

#### 二、具体需求与实现的功能如下：

- 学生端：参加考试、查看分数、成绩申诉；
![image](https://user-images.githubusercontent.com/88269111/211145506-06310432-5f7a-4187-9ce7-13fd7a8acd0b.png)

- 教师端：题库管理、知识点管理、题目管理、自动组卷（由存储过程完成）、成绩分析（简单版）；
![image](https://user-images.githubusercontent.com/88269111/211145532-b5293fe3-e557-4eaf-bc8d-b26619890b24.png)

- 管理员端：学院管理、专业管理、班级管理、学生管理、教师管理；
![image](https://user-images.githubusercontent.com/88269111/211145555-3e7830b9-e6f2-4fc7-b877-0e16b5caa6bd.png)

#### 三、运行环境

 	MySQL 8.0 + Tomcat 9.0.68

#### 四、运行方式

- 登录账号：root；登录密码：123456 创建一个名称为“exam_online”的数据库，导入SQL文件夹里面的examonline.sql文件
- IntelliJ IDEA配置： 安装Lombok插件，更新maven，配置Tomcat 9.0.68服务器

#### 五、数据库设计

​	主要用到了存储过程和触发器，详情见sql文件，E-R图和数据流图较为简单不再展示
