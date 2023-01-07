package entity;

import dao.DepartmentMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    private int d_id;
    private String d_name;

    private List<Department> departmentList;

    public void findAll() {
        SqlSession sqlSession = MyBatisUtil.openSession();
        DepartmentMapper mapper = sqlSession.getMapper(DepartmentMapper.class);
        departmentList = mapper.getAllDepartments();
        sqlSession.close();
    }
}
