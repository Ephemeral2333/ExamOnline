package entity;

import dao.InfoMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Info {
    private int iID;
    private int rID;
    private String sNo;
    private String content;
    private String time;
    private String state;
    private Result result;
    private Student student;
    private List<Info> infoList;

    public void selectByTeaNo(String teaNo) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        InfoMapper infoMapper = sqlSession.getMapper(InfoMapper.class);
        infoList = infoMapper.selectByTeaNo(teaNo);
        sqlSession.close();
    }

    public void selectByPK(int iID) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        InfoMapper infoMapper = sqlSession.getMapper(InfoMapper.class);
        Info info = infoMapper.selectByPK(iID);
        sqlSession.close();
        this.iID = info.getIID();
        this.rID = info.getRID();
        this.sNo = info.getSNo();
        this.content = info.getContent();
        this.time = info.getTime();
        this.state = info.getState();
        this.result = info.getResult();
        this.student = info.getStudent();
    }

    public void selectByStu(String no) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        InfoMapper infoMapper = sqlSession.getMapper(InfoMapper.class);
        infoList = infoMapper.selectByStu(no);
        sqlSession.close();
    }
}
