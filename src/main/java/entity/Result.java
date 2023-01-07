package entity;

import dao.PaperMapper;
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
public class Result {
    private int rID;
    private int eID;
    private String sNo;
    private int sScore;
    private String stage;
    private Exam exam;
    private Student student;
    private List<Result> resultList;

    private int qID;
    private int paperID;
    private String sContent;
    private String qAnswer;
    private Question question;
    private Paper paper;


    public void findOverExam(String sNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultList = resultMapper.findOverExam(sNo);
        sqlSession.close();
    }

    public void selectByTeaNo(String tno) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultList = resultMapper.selectByTeaNo(tno);
        sqlSession.close();
    }

    public void selectPaperDetail(int rID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultList = resultMapper.selectPaperDetail(rID);
        sqlSession.close();
    }

    public void selectAlreadyCheck(String tno) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultList = resultMapper.selectAlreadyCheck(tno);
        sqlSession.close();
    }

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultList = resultMapper.findAll();
        sqlSession.close();
    }
}
