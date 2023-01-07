package dao;

import entity.Exam;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExamMapper {
    List<Exam> findAll();
    void updateState();
    void insertExam(Exam exam);
    Exam selectByPK(int eid);
    void update(Exam exam);
    List<Exam> selectByTeaNo(String teaNo);
    List<Exam> findReadyExam(String sNo);
    void delete(int eid);
    int getMAXEID();

    int getExamNum();

    List<Exam> selectByTeacherNo(String teaNo);
}
