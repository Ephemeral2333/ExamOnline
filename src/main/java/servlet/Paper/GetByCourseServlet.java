package servlet.Paper;

import com.alibaba.fastjson.JSON;
import dao.PaperMapper;
import entity.Course;
import entity.Paper;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetByCourseServlet", value = "/paper/findByCourseId")
public class GetByCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String cid = request.getParameter("cID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        List<Paper> paperList = paperMapper.selectByCourseID(cid);
        sqlSession.close();
        retData(response, paperList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Paper> paperList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(paperList));
    }
}
