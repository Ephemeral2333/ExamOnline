package entity;

import dao.TeacherMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {
    private String tea_id;
    private String tea_no;
    private String tea_name;
    private int major_id;
    private Major major;
    private List<Course> courses;
    private User user;
    private List<Teacher> teacherList;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        teacherList = teacherMapper.findAll();
        sqlSession.close();
    }
}
