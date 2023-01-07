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

@WebServlet(name = "HandleExamServlet", value = "/handleExam")
public class HandleExamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String stuNo = request.getParameter("stuNo");
        String paperID = request.getParameter("paperID");
        String rID = request.getParameter("rID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        PaperMapper paperMapper = sqlSession.getMapper(PaperMapper.class);
        Paper paper = paperMapper.selectByPK(Integer.parseInt(paperID));
        String content = paper.getPContent();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        List<Question> questions = questionMapper.selectByContent(content);

        for (Question question : questions) {
            Answer answer = new Answer();
            String SContent = request.getParameter(String.valueOf(question.getQID()));
            answer.setContent(SContent);
            answer.setStuID(stuNo);
            answer.setPaperID(Integer.parseInt(paperID));
            answer.setQID(question.getQID());
            answer.setRID(Integer.parseInt(rID));
            AnswerMapper answerMapper = sqlSession.getMapper(AnswerMapper.class);
            answerMapper.insert(answer);
            ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
            resultMapper.updateHandleExam(Integer.parseInt(rID));
        }
        sqlSession.close();

        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
