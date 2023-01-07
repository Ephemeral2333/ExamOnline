package entity;

import dao.ExamMapper;
import dao.ResultMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exam {
    private int eID;
    private String eName;
    private String courseID;
    private int paperID;
    private String startTime;
    private String endTime;
    private int duration;
    private String state;
    private List<Exam> examList;
    private Paper paper;
    private Course course;
    private int sScore;
    private int maxScore;
    private int minScore;
    private double avgScore;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.updateState();
        examList = examMapper.findAll();
        sqlSession.close();
    }

    public void selectByTeaNo(String teaNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.updateState();
        examList = examMapper.selectByTeaNo(teaNo);
        sqlSession.close();
    }

    public void findReadyExam(String sNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultMapper.updateState();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examList = examMapper.findReadyExam(sNo);
        sqlSession.close();
    }

    public void selectByPK(int eID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        Exam exam = examMapper.selectByPK(eID);
        this.eID = exam.getEID();
        this.eName = exam.getEName();
        this.courseID = exam.getCourseID();
        this.paperID = exam.getPaperID();
        this.startTime = exam.getStartTime();
        this.endTime = exam.getEndTime();
        this.duration = exam.getDuration();
        this.state = exam.getState();
        this.paper = exam.getPaper();
        this.course = exam.getCourse();
        sqlSession.close();
    }

    public void selectByTeacherNo(String teaNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examList = examMapper.selectByTeacherNo(teaNo);
        sqlSession.close();
    }
}
