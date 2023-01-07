import dao.*;
import entity.Paper;
import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import util.MyBatisUtil;


public class CourseMapperTest {
    private SqlSession session;
    private CourseMapper courseMapper;
    private PaperMapper paperMapper;
    private QuestionMapper questionMapper;
    private StudentMapper studentMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
//        courseMapper = session.getMapper(CourseMapper.class);
//        questionMapper = session.getMapper(QuestionMapper.class);
        studentMapper = session.getMapper(StudentMapper.class);
    }

    @Test
    public void getAll(){
        System.out.println(courseMapper.findAll());
    }

    @Test
    public void getPaper() {
        Paper paper = new Paper();
        paper.selectByPK(1);
        System.out.println(paper);
        System.out.println(questionMapper.selectByContent("1,2,3"));
    }

    @Test
    public void getAllS() {
        Student student = new Student();
        student.findAll();
        System.out.println(student.getStudentList());
    }

    @Test
    public void insert(){
        courseMapper.insertTeacher("C002", "T002");
        session.commit();
    }

    @After
    public void destory(){
        session.close();
    }
}
