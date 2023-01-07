package servlet.Major;

import dao.MajorMapper;
import entity.Major;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateMajorServlet", value = "/major/update")
public class UpdateMajorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("MId");
        String name = request.getParameter("MName");
        String deptId = request.getParameter("Deptid");

        SqlSession sqlSession = MyBatisUtil.openSession();
        MajorMapper mapper = sqlSession.getMapper(MajorMapper.class);
        Major major = mapper.selectById(Integer.parseInt(id));
        major.setM_name(name);
        major.setDept_id(Integer.parseInt(deptId));
        mapper.update(major);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
