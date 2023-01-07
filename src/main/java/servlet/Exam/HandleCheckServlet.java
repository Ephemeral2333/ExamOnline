package servlet.Exam;

import dao.AnswerMapper;
import dao.PaperMapper;
import dao.QuestionMapper;
import dao.ResultMapper;
import entity.Answer;
import entity.Paper;
import entity.Question;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HandleCheckServlet", value = "/handleCheck")
public class HandleCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String rID = request.getParameter("rID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        AnswerMapper answerMapper = sqlSession.getMapper(AnswerMapper.class);
        int paperID = answerMapper.getPaperIDByRID(Integer.parseInt(rID));
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        Paper paper = paperMapper.selectByPK(paperID);
        String content = paper.getPContent();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        List<Question> questions = questionMapper.selectByContent(content);

        for (Question question : questions) {
            Answer answer = new Answer();
            answer = answerMapper.selectByRIDAndQID(Integer.parseInt(rID),question.getQID());
            String qScore = request.getParameter(String.valueOf(question.getQID()));
            String note = request.getParameter("评语" + question.getQID());
            answer.setScore(Integer.parseInt(qScore));
            answer.setNote(note);
            answerMapper.update(answer);
        }
        ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
        resultMapper.updateScore(Integer.parseInt(rID));
        sqlSession.close();

        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
