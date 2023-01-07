package servlet.Student;

import dao.StudentMapper;
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

@WebServlet(name = "AddStuServlet", value = "/stu/add")
public class AddStuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("SId");
        String name = request.getParameter("SName");
        String classID = request.getParameter("ClassID");
        String pwd = no;
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        pwd= new SimpleHash("md5",pwd,salt,2).toString();
        User user = new User(no, pwd, null, salt);
        Student student = new Student();
        student.setStu_no(no);
        student.setStu_name(name);
        student.setClass_id(Integer.parseInt(classID));
        student.setUser(user);
        SqlSession sqlSession = MyBatisUtil.openSession();
        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        studentMapper.insert(student);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
