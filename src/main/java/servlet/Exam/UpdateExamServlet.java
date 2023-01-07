package servlet.Exam;

import dao.ExamMapper;
import entity.Exam;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateExamServlet", value = "/exam/update")
public class UpdateExamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String eid = request.getParameter("EId");
        String examName = request.getParameter("ExamName");
        String startTime = request.getParameter("StartTime");
        String endTime = request.getParameter("EndTime");
        String Duration = request.getParameter("Duration");
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        Exam exam = examMapper.selectByPK(Integer.parseInt(eid));
        exam.setEName(examName);
        exam.setStartTime(startTime);
        exam.setEndTime(endTime);
        exam.setDuration(Integer.parseInt(Duration));
        examMapper.update(exam);
        examMapper.updateState();
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
