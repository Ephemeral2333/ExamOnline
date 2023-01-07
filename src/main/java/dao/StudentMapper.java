package dao;

import entity.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper {
    String selectNameByUid(String uid);
    Student selectStudentByUid(String uid);
    void insertStudent(String no, String name);
    List<Student> findAll();
    void insert(Student student);
    void update(Student student);
    void deleteByPK(String id);

    int getStudentNum();
}
