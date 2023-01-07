package servlet.Teacher;

import com.alibaba.fastjson.JSON;
import dao.TeacherMapper;
import entity.Teacher;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllTeaServlet", value = "/tea/findAll")
public class AllTeaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Teacher> teacherList = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        teacherList = teacherMapper.findAll();
        sqlSession.close();
        retData(response, teacherList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Teacher> teacherList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(teacherList));
    }
}
