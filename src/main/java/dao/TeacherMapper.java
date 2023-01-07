package dao;

import entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    String selectNameByTid(String tid);
    Teacher selectTeaByCourseID(int cID);
    List<Teacher> findAll();
    void insert(Teacher teacher);
    void update(Teacher teacher);
    void delete(String tid);
    Teacher selectByPK(String tid);
}
