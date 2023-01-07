package entity;

import dao.QuestionMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question {
    private int qID;
    private String qName;
    private String qType;
    private int opt;
    private String qAnswer;
    private int qScore;
    private int pointID;
    private int bankID;
    private Bank bank;
    private Point point;
    private List<Question> questionList;
    private Option opti;

    public void selectByBankID(int bankID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        questionList = questionMapper.selectByBankID(bankID);
        sqlSession.close();
    }

    public void selectByCourseID(String courseID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        questionList = questionMapper.selectByCourseID(courseID);
        sqlSession.close();
    }
}
