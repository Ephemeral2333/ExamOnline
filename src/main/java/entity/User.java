package entity;

import dao.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String u_id;
    private String password;
    private String email;
    private String salt;


    public User(String u_id, String password, String email) {
        this.u_id = u_id;
        this.password = password;
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (getU_id() != null ? !getU_id().equals(user.getU_id()) : user.getU_id() != null)
            return false;
        if (getPassword() != null ? !getPassword().equals(user.getPassword()) : user.getPassword() != null)
            return false;
        return getSalt() != null ? getSalt().equals(user.getSalt()) : user.getSalt() == null;
    }

    @Override
    public int hashCode() {
        int result = getU_id() != null ? getU_id().hashCode() : 0;
        result = 31 * result + (getPassword() != null ? getPassword().hashCode() : 0);
        result = 31 * result + (getSalt() != null ? getSalt().hashCode() : 0);
        return result;
    }

    public void selectUser(String no) {
        SqlSession sqlSession = MyBatisUtil.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.selectUser(no);
        this.setU_id(user.getU_id());
        this.setPassword(user.getPassword());
        this.setEmail(user.getEmail());
        this.setSalt(user.getSalt());
        sqlSession.close();
    }
}
