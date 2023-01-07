package servlet.Classes;

import com.alibaba.fastjson.JSON;
import dao.ClassesMapper;
import dao.DepartmentMapper;
import entity.Classes;
import entity.Department;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllClassesServlet", value = "/class/findAll")
public class AllClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Classes> classes = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        ClassesMapper mapper = sqlSession.getMapper(ClassesMapper.class);
        classes = mapper.findAll();
        sqlSession.close();
        retData(response, classes);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Classes> classesList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(classesList));
    }
}
