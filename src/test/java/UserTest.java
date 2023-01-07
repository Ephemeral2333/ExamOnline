import dao.UserMapper;
import entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import util.MyBatisUtil;

public class UserTest {
    private SqlSession session;
    private UserMapper userMapper;

    @Before
    public void init(){
        session = MyBatisUtil.openSession();
        userMapper = session.getMapper(UserMapper.class);
    }

    @Test
    public void getUserPassword(){
        System.out.println(userMapper.getUserPassword("1"));
    }

    @Test
    public void addUser() {
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        String password = "admin";
        password= new SimpleHash("md5",password,salt,2).toString();
        User user = new User("admin", password, "admin@qq.com", salt);
        userMapper.addUser(user);
    }

    @Test
    public void verifyPassword() {
        User user = userMapper.findByUsername("admin");
        String password = user.getPassword();
        String salt = user.getSalt();
        String inputPassword = "admin";
        inputPassword = new SimpleHash("md5", inputPassword, salt, 2).toString();
        System.out.println(inputPassword.equals(password));
    }

    @After
    public void destory(){
        session.close();
    }
}
