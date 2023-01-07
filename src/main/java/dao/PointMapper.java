package dao;

import entity.Point;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PointMapper {
    List<Point> findAll();
    void insert(Point point);
    void update(Point point);
    void delete(int id);
    Point selectByPK(int id);
    List<Point> selectByTeaNo(String teaNo);
    List<Point> selectByBankID(int bankID);
}
