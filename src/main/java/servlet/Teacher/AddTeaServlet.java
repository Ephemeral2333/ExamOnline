package servlet.Teacher;

import dao.TeacherMapper;
import entity.Teacher;
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

@WebServlet(name = "AddTeaServlet", value = "/tea/add")
public class AddTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tno = request.getParameter("TId");
        String tname = request.getParameter("TName");
        int major = Integer.parseInt(request.getParameter("MajorID"));
        String pwd = tno;
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        pwd= new SimpleHash("md5",pwd,salt,2).toString();
        User user = new User(tno, pwd, null, salt);
        Teacher teacher = new Teacher();
        teacher.setTea_no(tno);
        teacher.setTea_name(tname);
        teacher.setMajor_id(major);
        teacher.setUser(user);
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper mapper = sqlSession.getMapper(TeacherMapper.class);
        mapper.insert(teacher);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
