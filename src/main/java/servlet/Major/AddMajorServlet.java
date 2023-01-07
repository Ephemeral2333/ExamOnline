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

@WebServlet(name = "AddMajorServlet", value = "/major/add")
public class AddMajorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mName = request.getParameter("MName");
        String Deptid = request.getParameter("Deptid");
        Major major = new Major();
        major.setM_name(mName);
        major.setDept_id(Integer.parseInt(Deptid));

        SqlSession sqlSession = MyBatisUtil.openSession();
        MajorMapper mapper = sqlSession.getMapper(MajorMapper.class);
        mapper.insert(major);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
