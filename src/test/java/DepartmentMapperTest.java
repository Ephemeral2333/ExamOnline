import dao.DepartmentMapper;
import dao.UserMapper;
import entity.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import util.MyBatisUtil;


public class DepartmentMapperTest {
    private SqlSession session;
    private DepartmentMapper departmentMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        departmentMapper = session.getMapper(DepartmentMapper.class);
    }

    @Test
    public void getAll(){
        System.out.println(departmentMapper.getAllDepartments());
    }

    @After
    public void destory(){
        session.close();
    }
}
