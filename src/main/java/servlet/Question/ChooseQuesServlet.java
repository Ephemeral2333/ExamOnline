package servlet.Question;

import dao.PaperMapper;
import dao.QuestionMapper;
import entity.Paper;
import entity.Question;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChooseQuesServlet", value = "/ques/ChooseQues")
public class ChooseQuesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String[] qId = request.getParameterValues("qId");
        String pName = request.getParameter("pName");
        String cID = request.getParameter("cID");
        StringBuilder PContent = new StringBuilder();
        for (String s : qId) {
            PContent.append(s).append(",");
        }
        PContent.deleteCharAt(PContent.length() - 1);
        String Content = PContent.toString();
        SqlSession sqlSession = MyBatisUtil.openSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        int qScore = questionMapper.calculateAllScore(Content);

        Paper paper = new Paper();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        paper.setPName(pName);
        paper.setCourseID(cID);
        paper.setPContent(Content);
        paper.setPScore(qScore);
        paperMapper.insertPaper(paper);
        sqlSession.close();

        // 重定向到试卷列表
        response.sendRedirect("/bank/GroupPaper.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
