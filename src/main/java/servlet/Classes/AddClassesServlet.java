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

@WebServlet(name = "AddClassesServlet", value = "/class/add")
public class AddClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("CName");
        String major = request.getParameter("MajorID");
        Classes classes = new Classes();
        classes.setCName(name);
        classes.setMajorID(Integer.parseInt(major));

        SqlSession sqlSession = MyBatisUtil.openSession();
        ClassesMapper mapper = sqlSession.getMapper(ClassesMapper.class);
        mapper.insert(classes);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
