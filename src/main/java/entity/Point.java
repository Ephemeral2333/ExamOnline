package entity;

import dao.PointMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Point {
    private int pID;
    private String pName;
    private String courseID;
    private List<Point> pointList;
    private Course course;
    private Bank bank;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
        pointList = pointMapper.findAll();
        sqlSession.close();
    }

    public void selectByTeaNo(String teaNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
        pointList = pointMapper.selectByTeaNo(teaNo);
        sqlSession.close();
    }
}
