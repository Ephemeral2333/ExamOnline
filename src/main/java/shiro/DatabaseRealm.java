package shiro;

import dao.RoleMapper;
import dao.UserMapper;
import entity.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.Set;

public class DatabaseRealm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SqlSession session = null;
        session = MyBatisUtil.openSession();
        RoleMapper roleMapper = session.getMapper(RoleMapper.class);
        //能进入到这里，表示账号已经通过验证了
        String userName =(String) principalCollection.getPrimaryPrincipal();
        //通过DAO获取角色和权限
        Set<String> roles = roleMapper.listRoles(userName);

        //授权对象
        SimpleAuthorizationInfo s = new SimpleAuthorizationInfo();
        s.setRoles(roles);
        session.close();
        return s;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取账号密码

        UsernamePasswordToken t = (UsernamePasswordToken) token;
        String userName= token.getPrincipal().toString();
        String password= new String(t.getPassword());
        SqlSession session = MyBatisUtil.openSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.findByUsername(userName);
        //获取数据库中的密码
        String passwordInDB = user.getPassword();
        String salt = user.getSalt();
        String passwordEncoded = new SimpleHash("md5",password,salt,2).toString();

        //如果为空就是账号不存在，如果不相同就是密码错误，但是都抛出AuthenticationException，而不是抛出具体错误原因，免得给破解者提供帮助信息
        if(null==passwordInDB || !passwordInDB.equals(passwordEncoded))
            throw new AuthenticationException();

        //认证信息里存放账号密码, getName() 是当前Realm的继承方法,通常返回当前类名 :databaseRealm
        SimpleAuthenticationInfo a = new SimpleAuthenticationInfo(userName,password,getName());
        session.close();
        return a;
    }
}