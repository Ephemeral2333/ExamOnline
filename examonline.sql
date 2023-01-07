drop database if exists `exam_online`;
create database `exam_online`;
use `exam_online`;

SET FOREIGN_KEY_CHECKS = 0;

-- User
drop table if exists `user`;
create table user (
    id varchar(100) not null comment '用户id',
    password varchar(100) not null comment '密码',
    salt varchar(100) not null comment '盐',
    email varchar(100) comment '邮箱',
    primary key (id)
);

-- Role
drop table if exists `role`;
create table role (
    role_id   int not null comment '角色id',
    role_name varchar(25) not null comment '角色名',
    primary key (role_id)
);

insert into role values (1, '管理员');
insert into role values (2, '学生');
insert into role values (3, '教师');

-- Role_User
drop table if exists `role_user`;
create table role_user (
    role_id int not null comment '角色id',
    user_id varchar(100) not null comment '用户id',
    primary key (role_id, user_id),
    foreign key (role_id) references role (role_id) on delete cascade on update cascade,
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

-- Admin
drop table if exists `admin`;
create table admin (
    id   varchar(100) not null comment '管理员id',
    name varchar(100) not null comment '管理员姓名',
    primary key (id),
    foreign key (id) references user (id) on delete cascade on update cascade
);

-- Student
drop table if exists `student`;
create table student (
    stu_id   int not null comment '学生id' auto_increment,
    stu_no   varchar(30) not null comment '学号',
    stu_name varchar(20) not null comment '学生姓名',
    class_id int not null comment '班级id',
    primary key (stu_id),
    foreign key (stu_no) references user (id) on delete cascade on update cascade
);

-- Teacher
drop table if exists `teacher`;
create table teacher (
    tea_id   int not null comment '教师id' auto_increment,
    tea_no   varchar(30) not null comment '教师工号',
    tea_name varchar(20) not null comment '教师姓名',
    major_id int not null comment '专业id',
    primary key (tea_id),
    foreign key (tea_no) references user (id) on delete cascade on update cascade
);

-- Department
drop table if exists `department`;
create table department (
    dept_id   int not null comment '院系id' auto_increment,
    dept_name varchar(100) not null comment '院系名',
    primary key (dept_id)
);

-- Major
drop table if exists `major`;
create table major (
    major_id   int not null comment '专业id' auto_increment,
    major_name varchar(100) not null comment '专业名',
    dept_id int not null comment '院系id',
    primary key (major_id),
    foreign key (dept_id) references department (dept_id) on delete cascade on update cascade
);

-- Class
drop table if exists `class`;
create table class (
    class_id int not null comment '班级id' auto_increment,
    class_name varchar(100) not null comment '班级名',
    major_id int not null comment '专业id',
    primary key (class_id),
    foreign key (major_id) references major (major_id) on delete cascade on update cascade
);

-- Course
drop table if exists `course`;
create table course (
    course_id varchar(30) not null comment '课程id',
    course_name varchar(100) not null comment '课程名',
    major_id int not null comment '专业id',
    primary key (course_id),
    foreign key (major_id) references major (major_id) on delete cascade on update cascade
);

-- Course_Teacher
drop table if exists `course_teacher`;
create table course_teacher (
    course_id varchar(30) not null comment '课程id',
    tea_id varchar(30) not null comment '教师id',
    primary key (course_id, tea_id),
    foreign key (course_id) references course (course_id) on delete cascade on update cascade,
    foreign key (tea_id) references teacher (tea_no) on delete cascade on update cascade
);

-- Paper
drop table if exists `paper`;
create table paper (
    paper_id int not null comment '试卷id' auto_increment,
    paper_name varchar(100) not null comment '试卷名',
    course_id  varchar(30) not null comment '课程id',
    content varchar(500) collate utf8_unicode_ci default NULL COMMENT '试卷所包含试题id,以“,”隔开',
    paper_score int not null comment '试卷总分',
    primary key (paper_id),
    foreign key (course_id) references course (course_id) on delete cascade on update cascade
);

-- Point
drop table if exists `point`;
create table point (
    point_id   int not null comment '知识点id' auto_increment,
    point_name varchar(100) not null comment '知识点名',
    course_id  varchar(30) not null comment '课程id',
    primary key (point_id),
    foreign key (course_id) references course (course_id) on delete cascade on update cascade
);

-- Bank
drop table if exists `bank`;
create table bank (
    bank_id   int         not null comment '题库id' auto_increment,
    bank_name varchar(100) not null comment '题库名',
    course_id varchar(30) not null comment '课程id',
    primary key (bank_id),
    foreign key (course_id) references course (course_id) on delete cascade on update cascade
);

-- Question
drop table if exists `question`;
create table question (
    question_id int not null comment '题目id' auto_increment,
    question_name varchar(100) not null comment '题目名',
    question_type int not null comment '题目类型',
    opt int comment '选项对应ID',
    question_answer varchar(500) not null comment '答案',
    question_score int not null comment '分数',
    point_id int not null comment '知识点id',
    bank_id int not null comment '题库id',
    primary key (question_id),
    foreign key (point_id) references point (point_id) on delete cascade on update cascade,
    foreign key (bank_id) references bank (bank_id) on delete cascade on update cascade,
    foreign key (opt) references `option` (opt_id) on delete cascade on update cascade
);

-- Option
drop table if exists `option`;
create table `option` (
        opt_id int not null comment '选项id' auto_increment,
        opt_a varchar(100) comment '选项A',
        opt_b varchar(100) comment '选项B',
        opt_c varchar(100) comment '选项C',
        opt_d varchar(100) comment '选项D',
        primary key (opt_id)
);

-- Exam
drop table if exists `exam`;
create table exam (
    exam_id   int not null comment '考试id' auto_increment,
    exam_name varchar(100) not null comment '考试名',
    paper_id  int not null comment '试卷id',
    course_id varchar(30) not null comment '课程id',
    start_time datetime not null comment '开始时间',
    end_time datetime not null comment '结束时间',
    duration int not null comment '考试时长,单位分钟',
    state varchar(15) comment '考试状态',
    primary key (exam_id),
    foreign key (paper_id) references paper (paper_id) on delete cascade on update cascade,
    foreign key (course_id) references course (course_id) on delete cascade on update cascade
);

-- Answer
drop table if exists `answer`;
CREATE TABLE answer
(
    answer_id int not null auto_increment comment '答案id',
    result_id int not null comment '结果id',
    stu_id varchar(30) not null comment '学生id',
    paper_id int not null comment '试卷id',
    question_id int not null comment '题目id',
    content varchar(500) not null comment '答案',
    score int not null comment '所得分数',
    note varchar(500) comment '评语',
    primary key (answer_id),
    foreign key (result_id) references result (result_id),
    foreign key (stu_id) references student (stu_no) on delete cascade on update cascade,
    foreign key (paper_id) references paper (paper_id) on delete cascade on update cascade,
    foreign key (question_id) references question (question_id) on delete cascade on update cascade
);

-- Result
drop table if exists `result`;
CREATE TABLE result
(
    result_id int not null auto_increment comment '结果id',
    exam_id int not null comment '考试id',
    stu_id varchar(30) not null comment '学生id',
    score int not null comment '分数',
    stage varchar(10) not null comment '该条答案所处阶段(待考试，已考试，已评分)',
    primary key (result_id),
    foreign key (exam_id) references exam (exam_id) on delete cascade on update cascade,
    foreign key (stu_id) references student (stu_no) on delete cascade on update cascade
);

-- Info
drop table if exists `info`;
create table info (
    info_id int not null comment '消息id' auto_increment,
    result_id int not null comment '考试id',
    stu_id varchar(30) not null comment '学生id',
    info_content varchar(500) not null comment '消息内容',
    info_time datetime not null comment '消息时间',
    info_state varchar(10) not null comment '消息状态',
    primary key (info_id),
    foreign key (result_id) references result (result_id) on delete cascade on update cascade,
    foreign key (stu_id) references student (stu_no) on delete cascade on update cascade
);


-- 视图
drop view if exists `bank_point`;
create view bank_point as
    select point_id, point_name, bank_id from point, bank where point.course_id = bank.course_id;

# 学生课程视图
drop view if exists `stu_course`;
create view stu_course as
    select student.stu_no, course.course_id from student, course where student.class_id in (select class_id from class where class.major_id = course.major_id);

# 试卷结果-答案视图
drop view if exists `paper_result_answer`;
create view paper_result_answer as
    select result.result_id, paper.paper_id, question.question_id, answer.content, question.question_answer from result,answer,paper,question where result.result_id = answer.result_id and answer.paper_id = paper.paper_id and answer.question_id = question.question_id and answer.result_id = result.result_id;

# 设计视图，从result表中总结所有考试分数大于0的最高分最低分平均分
drop view if exists `exam_score`;
create view exam_score as
    select exam.exam_id, exam.exam_name, max(score) as max_score, min(score) as min_score, avg(score) as avg_score from result,exam where score > 0 and result.exam_id = exam.exam_id group by exam_id;



-- 存储过程
# 设计存储过程，当添加学生时，自动添加用户和角色
drop procedure if exists `add_student`;
DELIMITER $$
create procedure add_student(no varchar(30), pwd varchar(200), name varchar(10), sa varchar(100), classid int)
begin
    insert into user(id, password, salt) VALUES (no, pwd, sa);
    insert into role_user(role_id, user_id) VALUES (2, no);
    insert into student(stu_no, stu_name, class_id) VALUES (no, name, classid);
end $$
DELIMITER ;

# 设计存储过程，当添加教师时，自动添加用户和角色
drop procedure if exists `add_teacher`;
DELIMITER $$
create procedure add_teacher(no varchar(30), pwd varchar(200), name varchar(10), sa varchar(100), majorid int)
begin
    insert into user(id, password, salt) VALUES (no, pwd, sa);
    insert into role_user(role_id, user_id) VALUES (3, no);
    insert into teacher(tea_no, tea_name, major_id) VALUES (no, name, majorid);
end $$

# 设计存储过程，添加选择题时，自动添加Opt
drop procedure if exists `add_single`;
DELIMITER $$
create procedure add_single(qName varchar(100), qType varchar(20), qAnswer varchar(500), qScore int, pID int, bID int, opta varchar(500), optb varchar(500), optc varchar(500), optd varchar(500))
begin
    insert into `option`(opt_a, opt_b, opt_c, opt_d) VALUES (opta, optb, optc, optd);
    set @optid = (select opt_id from `option` order by opt_id desc limit 1);
    insert into question(question_name, question_type, opt, question_answer, question_score, point_id, bank_id) VALUES (qName, qType, @optid, qAnswer, qScore, pID, bID);
end $$

# 设计存储过程，修改选择题时，自动修改Opt
drop procedure if exists `update_single`;
DELIMITER $$
create procedure update_single(qID int, qName varchar(100), qType varchar(20), opt int, qAnswer varchar(500), qScore int, pID int, bID int, opta varchar(500), optb varchar(500), optc varchar(500), optd varchar(500))
begin
    update `option` set opt_a = opta, opt_b = optb, opt_c = optc, opt_d = optd where opt_id = opt;
    update question set question_name = qName, question_type = qType, question_answer = qAnswer, question_score = qScore, point_id = pID, bank_id = bID where question_id = qID;
end $$

# 设计存储过程，根据当前时间更新exam表状态
drop procedure if exists `update_exam`;
DELIMITER $$
create procedure update_exam()
begin
    update exam set state = '进行中' where start_time <= now() and end_time >= now();
    update exam set state = '已结束' where end_time < now();
    update exam set state = '未开始' where start_time > now();
end $$

drop procedure if exists `update_result`;
DELIMITER $$
create procedure update_result()
begin
    update result set stage = '未参与' where exam_id in (select exam_id from exam where end_time < now()) and stage = '待考试';
    update result set stage = '待考试' where exam_id in (select exam_id from exam where start_time > now());
end $$

# 设计存储过程，计算answer总分，更新result表
drop procedure if exists `update_score`;
DELIMITER $$
create procedure update_score(rID int)
begin
    set @score = (select sum(answer.score) from answer where result_id = rID);
    update result set score = @score where result_id = rID;
    update result set stage = '已评分' where result_id = rID;
end $$


# 设计存储过程，实现自动组卷功能
drop procedure if exists `auto_paper`;
DELIMITER $$
create procedure auto_paper(
    courseID varchar(20),
    bankID int,
    pName varchar(100),
    singleNum int,
    fillNum int,
    judgeNum int,
    shortNum int
)
begin
    set autocommit = 0;
    insert into paper(paper_name, course_id, paper_score) VALUES (pName, courseID, -1);
    set @paperID = (select paper_id from paper order by paper_id desc limit 1);
    set @singleNum = singleNum;
    set @fillNum = fillNum;
    set @judgeNum = judgeNum;
    set @shortNum = shortNum;
    set @singleID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '选择题' and bank_id = bankID
                 order by rand()
                 limit singleNum
             ) t
    );
    set @fillID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '填空题' and bank_id = bankID
                 order by rand()
                 limit fillNum
             ) t
    );
    set @judgeID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '判断题' and bank_id = bankID
                 order by rand()
                 limit judgeNum
             ) t
    );
    set @shortID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '简答题' and bank_id = bankID
                 order by rand()
                 limit shortNum
             ) t
    );
    set @AllContent = concat(
            ifnull(@singleID, ''),
            if(@singleID = '', '', ','),
            ifnull(@fillID, ''),
            if(@fillID = '', '', ','),
            ifnull(@judgeID, ''),
            if(@judgeID = '', '', ','),
            ifnull(@shortID, ''),
            if(@shortID = '', '', ',')
        );
    set @AllScore = (select sum(question_score) from question where find_in_set(question_id, @AllContent)>0);
    update paper set content = @AllContent, paper_score = @AllScore where paper_id = @paperID;
    get diagnostics condition 1
        @error_code = RETURNED_SQLSTATE,
        @error_message = MESSAGE_TEXT;
    if @error_code is not null then
        rollback;
    else
        commit;
    end if;
end $$

-- 触发器
# 设计触发器，当删除学院时，删除该学院下的所有专业
drop trigger if exists `delete_dept`;
DELIMITER $$
create trigger delete_dept
    before delete on department
    for each row
begin
    delete from major where dept_id = old.dept_id;
end $$
DELIMITER ;

# 设计触发器，当删除专业时，删除该专业下的所有班级和课程
drop trigger if exists `delete_major`;
DELIMITER $$
create trigger delete_major
    before delete on major
    for each row
begin
    delete from class where major_id = old.major_id;
    delete from course where major_id = old.major_id;
end $$
DELIMITER ;

# 设计触发器，当删除班级时，删除该班级下的所有学生
drop trigger if exists `delete_class`;
DELIMITER $$
create trigger delete_class
    before delete on class
    for each row
begin
    delete from student where class_id = old.class_id;
end $$
DELIMITER ;

# 设计触发器，当删除课程后，删除course_teacher表中的相关记录和所有所属题库和试卷和考试和成绩和考试记录和info
drop trigger if exists `course_teacher_delete`;
create trigger course_teacher_delete
    before delete on course
    for each row
    begin
        delete from course_teacher where course_id = old.course_id;
        delete from bank where course_id = old.course_id;
        delete from point where course_id = old.course_id;
        delete from paper where course_id = old.course_id;
        delete from exam where course_id = old.course_id;
    end;

# 设计触发器，当删除考试后，删除result表和answer表中的相关记录
drop trigger if exists `exam_delete`;
create trigger exam_delete
    before delete on exam
    for each row
    begin
        delete from result where exam_id = old.exam_id;
    end;

# 设计触发器，当删除result后，删除answer表中的相关记录
drop trigger if exists `result_delete`;
create trigger result_delete
    before delete on result
    for each row
    begin
        delete from info where result_id = old.result_id;
        delete from answer where result_id = old.result_id;
    end;

# 设计触发器，当删除试卷后，删除exam表中的相关记录
drop trigger if exists `paper_delete`;
create trigger paper_delete
    before delete on paper
    for each row
    begin
        delete from exam where paper_id = old.paper_id;
    end;

# 设计触发器，当删除题库后，删除question表中的相关记录和所有所属题目
drop trigger if exists `bank_delete`;
create trigger bank_delete
    before delete on bank
    for each row
    begin
        delete from question where bank_id = old.bank_id;
    end;


# 设计触发器，当删除学生后，删除用户表和角色表中的相关记录
drop trigger if exists `student_delete`;
create trigger student_delete
    after delete on student
    for each row
    begin
        delete from role_user where user_id = old.stu_no;
        delete from user where id = old.stu_no;
    end;

# 设计触发器，当删除教师后，删除用户表和角色表中的相关记录
drop trigger if exists `teacher_delete`;
create trigger teacher_delete
    after delete on teacher
    for each row
    begin
        delete from role_user where user_id = old.tea_no;
        delete from user where id = old.tea_no;
    end;

# 设计触发器，当删除题目后，删除选项表中的相关记录
drop trigger if exists `question_delete`;
create trigger question_delete
    after delete on question
    for each row
    begin
        delete from `option` where opt_id = old.opt;
    end;

# 设计触发器，当插入考试后，更新考试状态
drop trigger if exists `exam_insert`;
create trigger exam_insert
    before insert on exam
    for each row
    begin
        if new.end_time < now() then
            set new.state = '已结束';
        elseif new.start_time > now() then
            set new.state = '未开始';
        else
            set new.state = '进行中';
        end if;
    end;

# 设计触发器，当删除教师后，删除course_teacher表中的相关记录
drop trigger if exists `course_teacher_delete`;
create trigger course_teacher_delete
    before delete on teacher
    for each row
    begin
        delete from course_teacher where tea_no = old.tea_no;
    end;

SET FOREIGN_KEY_CHECKS = 1;