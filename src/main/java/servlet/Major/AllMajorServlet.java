package servlet.Major;

import com.alibaba.fastjson.JSON;
import dao.MajorMapper;
import entity.Major;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllMajorServlet", value = "/major/findAll")
public class AllMajorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<Major> major = null;
        SqlSession sqlSession = null;
        sqlSession = MyBatisUtil.openSession();
        MajorMapper mapper = sqlSession.getMapper(MajorMapper.class);
        major = mapper.selectAll();
        sqlSession.close();
        retData(response, major);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Major> major) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(major));
    }
}
