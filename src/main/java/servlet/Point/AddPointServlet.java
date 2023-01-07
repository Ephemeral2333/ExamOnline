package servlet.Point;

import dao.PointMapper;
import entity.Point;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddPointServlet", value = "/point/add")
public class AddPointServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("PName");
        String course = request.getParameter("CourseID");
        Point point = new Point();
        point.setPName(name);
        point.setCourseID(course);
        SqlSession sqlSession = MyBatisUtil.openSession();
        PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
        pointMapper.insert(point);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
