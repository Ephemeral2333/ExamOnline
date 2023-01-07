package dao;

import entity.Option;
import entity.Question;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QuestionMapper {
    List<Question> selectByBankID(int bankID);
    void insert(Question question);
    void insertSingle(Question question);
    Question selectByPK(int QID);
    void update(Question question);
    void updateSingle(Question question);
    void delete(int QID);
    List<Question> selectSingle();
    List<Question> selectJudge();
    List<Question> selectFill();
    List<Question> selectShortAnswer();
    List<Question> selectByContent(String id);
    List<Question> selectByCourseID(String courseID);
    int calculateAllScore(String id);
}
