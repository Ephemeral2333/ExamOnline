package servlet.Classes;

import dao.ClassesMapper;
import entity.Classes;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateClassesServlet", value = "/class/update")
public class UpdateClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("CId");
        String name = request.getParameter("CName");
        String major = request.getParameter("MajorID");

        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper classesMapper = sqlSession.getMapper(ClassesMapper.class);
        Classes classes = classesMapper.selectByPK(Integer.parseInt(id));
        classes.setCName(name);
        classes.setMajorID(Integer.parseInt(major));
        classesMapper.update(classes);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
