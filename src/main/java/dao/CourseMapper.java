package dao;

import entity.Course;
import entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper {
    List<Course> findAll();
    Course selectByPK(String cID);
    List<Course> selectByMajorID(int majorID);
    void insert(Course course);
    void update(Course course);
    void delete(String cID);
    void updateTeacher(String cID, String tID, String CTea);
    void insertTeacher(String cID, String tID);
    void deleteTeacher(String cID, String tID);
    List<String> selectStuByCourseID(String cID);
    List<Course> selectByTeaNo(String tID);
}
