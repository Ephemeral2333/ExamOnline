package entity;

import dao.PaperMapper;
import dao.QuestionMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Paper {
    private int pID;
    private String pName;
    private String courseID;
    private String pContent;
    private int pScore;
    private List<Paper> paperList;
    private Course course;
    private List<Question> single;
    private List<Question> judge;
    private List<Question> fill;
    private List<Question> shortAnswer;

    private int bankID;
    private int singleNum;
    private int fillNum;
    private int judgeNum;
    private int shortNum;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        paperList = paperMapper.findAll();
        sqlSession.close();
    }

    public void selectByPK(int pid) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        Paper paper = paperMapper.selectByPK(pid);
        this.pID = paper.getPID();
        this.pName = paper.getPName();
        this.courseID = paper.getCourseID();
        this.pContent = paper.getPContent();
        this.pScore = paper.getPScore();
        this.course = paper.getCourse();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        List<Question> questionList = questionMapper.selectByContent(paper.getPContent());
        List<Question> sin = new ArrayList<>();
        List<Question> jud = new ArrayList<>();
        List<Question> fil = new ArrayList<>();
        List<Question> sho = new ArrayList<>();
        for (Question question : questionList) {
            if (question.getQType().equals("选择题")) {
                sin.add(question);
            } else if (question.getQType().equals("判断题")) {
                jud.add(question);
            } else if (question.getQType().equals("填空题")) {
                fil.add(question);
            } else if (question.getQType().equals("简答题")) {
                sho.add(question);
            }
        }
        this.single = sin;
        this.judge = jud;
        this.fill = fil;
        this.shortAnswer = sho;
        sqlSession.close();
    }

    public void selectByTeaNo(String teaNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        paperList = paperMapper.selectByTeaNo(teaNo);
        sqlSession.close();
    }
}
