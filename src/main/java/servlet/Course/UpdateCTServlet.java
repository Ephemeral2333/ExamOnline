package servlet.Course;

import dao.CourseMapper;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateCTServlet", value = "/ct/update")
public class UpdateCTServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String cid = request.getParameter("CId");
        String tid = request.getParameter("TId");
        String ctea = request.getParameter("CTea");
        SqlSession sqlSession = MyBatisUtil.openSession();
        CourseMapper courseMapper = sqlSession.getMapper(CourseMapper.class);
        courseMapper.updateTeacher(cid, tid, ctea);
        sqlSession.close();
        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
