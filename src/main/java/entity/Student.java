package entity;

import dao.StudentMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private String stu_id;
    private String stu_no;
    private String stu_name;
    private int class_id;
    private List<Student> studentList;
    private Classes classes;
    private User user;

    public Student(String stu_no, String stu_name) {
        this.stu_no = stu_no;
        this.stu_name = stu_name;
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        studentList = studentMapper.findAll();
        sqlSession.close();
    }
}
