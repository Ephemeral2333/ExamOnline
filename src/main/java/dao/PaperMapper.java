package dao;

import entity.Paper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaperMapper {
    List<Paper> findAll();
    Paper selectByPK(int pID);
    void insertPaper(Paper paper);
    void delete(int pID);
    List<Paper> selectByCourseID(String courseID);
    List<Paper> selectByTeaNo(String teaNo);

    int getPaperNum();

    void AutoGroup(Paper paper);
}
