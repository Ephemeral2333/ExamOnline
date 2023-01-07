package entity;

import dao.ClassesMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Classes {
    private int cID;
    private String cName;
    private int majorID;
    private Major major;
    private List<Classes> classesList;
    private int total;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper mapper = sqlSession.getMapper(ClassesMapper.class);
        classesList = mapper.findAll();
        sqlSession.close();
    }
}
