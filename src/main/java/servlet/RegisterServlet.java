package servlet;

import dao.RoleUserMapper;
import dao.StudentMapper;
import dao.UserMapper;
import entity.RoleUser;
import entity.Student;
import entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String no = request.getParameter("userName");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String verifyCode = request.getParameter("verifyCode");
        HttpSession session = request.getSession();
        String vCode = (String) session.getAttribute("vCode");
        if (!vCode.equals(verifyCode)) {
            out.print(-1);
            out.flush();
            out.close();
        } else {
            String salt = new SecureRandomNumberGenerator().nextBytes().toString();
            password= new SimpleHash("md5",password,salt,2).toString();
            User user = new User(no, password, email, salt);
            SqlSession sqlSession = MyBatisUtil.openSession();
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.addUser(user);
            RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
            roleUserMapper.insert(2, no);
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            studentMapper.insertStudent(no, name);
            sqlSession.commit();
            out.print(1);
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
