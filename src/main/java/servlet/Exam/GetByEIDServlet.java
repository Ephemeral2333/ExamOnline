package servlet.Exam;

import com.alibaba.fastjson.JSON;
import dao.ExamMapper;
import entity.Exam;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetByEIDServlet", value = "/exam/selectByPK")
public class GetByEIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String eid = request.getParameter("eid");
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        Exam exam = examMapper.selectByPK(Integer.parseInt(eid));
        sqlSession.close();
        retData(response, exam);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Exam exam) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(exam));
    }
}
