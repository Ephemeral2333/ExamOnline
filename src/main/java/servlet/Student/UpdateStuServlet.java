package servlet.Student;

import dao.StudentMapper;
import entity.Student;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateStuServlet", value = "/stu/update")
public class UpdateStuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("SId");
        String name = request.getParameter("SName");
        String classID = request.getParameter("ClassID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        Student student = studentMapper.selectStudentByUid(no);
        student.setStu_name(name);
        student.setClass_id(Integer.parseInt(classID));
        studentMapper.update(student);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
