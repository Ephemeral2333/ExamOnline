package servlet.Paper;

import dao.PaperMapper;
import entity.Paper;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AutoGroupServlet", value = "/paper/autogroup")
public class AutoGroupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String CourseID = request.getParameter("CourseID");
        int BankID = Integer.parseInt(request.getParameter("BankID"));
        String PName = request.getParameter("PName");
        int singleNum = Integer.parseInt(request.getParameter("SingleNum"));
        int FillNum = Integer.parseInt(request.getParameter("FillNum"));
        int JudgeNum = Integer.parseInt(request.getParameter("JudgeNum"));
        int ShortNum = Integer.parseInt(request.getParameter("ShortNum"));

        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        Paper paper = new Paper();
        paper.setCourseID(CourseID);
        paper.setBankID(BankID);
        paper.setPName(PName);
        paper.setSingleNum(singleNum);
        paper.setFillNum(FillNum);
        paper.setJudgeNum(JudgeNum);
        paper.setShortNum(ShortNum);
        paperMapper.AutoGroup(paper);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
