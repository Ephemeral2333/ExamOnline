package servlet.Exam;

import dao.ExamMapper;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteExamServlet", value = "/exam/deleteByPK")
public class DeleteExamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String eid = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.delete(Integer.parseInt(eid));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
