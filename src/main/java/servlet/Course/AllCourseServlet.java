package servlet.Course;

import com.alibaba.fastjson.JSON;
import dao.CourseMapper;
import dao.PointMapper;
import entity.Course;
import entity.Point;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;
import org.apache.shiro.subject.Subject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllCourseServlet", value = "/course/findAll")
public class AllCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Subject subject = (Subject) session.getAttribute("subject");
        String no = subject.getPrincipal().toString();

        List<Course> courseList = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        CourseMapper courseMapper = sqlSession.getMapper(CourseMapper.class);
//        courseList = courseMapper.findAll();
        if(no.equals("admin")){
            courseList = courseMapper.findAll();
        } else {
            courseList = courseMapper.selectByTeaNo(no);
        }
        sqlSession.close();
        retData(response, courseList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Course> courseList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(courseList));
    }
}
