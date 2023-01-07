package entity;

import dao.CourseMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private String cID;
    private String cName;
    private int majorID;
    private Major major;
    private List<Course> courseList;
    private List<Teacher> teacherList;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        CourseMapper courseMapper = sqlSession.getMapper(CourseMapper.class);
        courseList = courseMapper.findAll();
        sqlSession.close();
    }

    public void findByID(String cID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        CourseMapper courseMapper = sqlSession.getMapper(CourseMapper.class);
        Course course = courseMapper.selectByPK(cID);
        sqlSession.close();
        this.cID = course.getCID();
        this.cName = course.getCName();
        this.majorID = course.getMajorID();
        this.teacherList = course.getTeacherList();
        this.major = course.getMajor();
    }
}
