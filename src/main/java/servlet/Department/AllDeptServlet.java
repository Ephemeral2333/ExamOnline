package servlet.Department;

import com.alibaba.fastjson.JSON;
import dao.DepartmentMapper;
import entity.Department;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllDeptServlet", value = "/dept/findAllDept")
public class AllDeptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Department> depts = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        DepartmentMapper mapper = sqlSession.getMapper(DepartmentMapper.class);
        depts = mapper.getAllDepartments();
        sqlSession.close();
        retData(response, depts);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Department> departmentList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(departmentList));
    }
}
