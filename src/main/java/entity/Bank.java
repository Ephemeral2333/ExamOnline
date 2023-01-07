package entity;

import dao.BankMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bank {
    private int bID;
    private String bName;
    private String courseID;
    private List<Bank> bankList;
    private Course course;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BankMapper bankMapper = sqlSession.getMapper(BankMapper.class);
        bankList = bankMapper.findAll();
        sqlSession.close();
    }

    public void selectByTeaNo(String tno) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        BankMapper bankMapper = sqlSession.getMapper(BankMapper.class);
        bankList = bankMapper.selectByTeaNo(tno);
        sqlSession.close();
    }
}
