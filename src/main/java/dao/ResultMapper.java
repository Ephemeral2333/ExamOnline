package dao;

import entity.Exam;
import entity.Result;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResultMapper {
    void insertResult(Result result);
    List<Result> findOverExam(String sNo);
    int getResultIDByExamAndStu(String sNo, int eID);
    void updateHandleExam(int rID);
    void updateState();
    List<Result> selectByTeaNo(String tno);
    List<Result> selectPaperDetail(int rID);
    void updateScore(int rID);
    List<Result> selectAlreadyCheck(String tno);
    Result selectByPK(int rID);

    List<Result> findAll();
}
