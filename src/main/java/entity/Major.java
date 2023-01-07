package entity;

import dao.MajorMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Major {
    private int m_id;
    private String m_name;
    private int dept_id;
    private List<Major> majorList;
    private Department department;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        MajorMapper mapper = sqlSession.getMapper(MajorMapper.class);
        majorList = mapper.selectAll();
        sqlSession.close();
    }
}
