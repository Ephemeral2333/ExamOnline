package servlet.Teacher;

import dao.TeacherMapper;
import entity.Teacher;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateTeaServlet", value = "/tea/update")
public class UpdateTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String tno = request.getParameter("TId");
        String tname = request.getParameter("TName");
        int major = Integer.parseInt(request.getParameter("MajorID"));
        SqlSession sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        Teacher teacher = teacherMapper.selectByPK(tno);
        teacher.setTea_name(tname);
        teacher.setMajor_id(major);
        teacherMapper.update(teacher);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
