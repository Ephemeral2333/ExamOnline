package servlet.Question;

import dao.QuestionMapper;
import entity.Option;
import entity.Question;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateQuesServlet", value = "/question/update")
public class UpdateQuesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        SqlSession sqlSession = MyBatisUtil.openSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);

        String QID = request.getParameter("QId");
        Question question = questionMapper.selectByPK(Integer.parseInt(QID));
        String BankID = request.getParameter("BankID");
        String QName = request.getParameter("QName");
        String QType = request.getParameter("QType");
        String QScore = request.getParameter("QScore");
        String PointID = request.getParameter("PointID");
        question.setBankID(Integer.parseInt(BankID));
        question.setQName(QName);
        question.setQType(QType);
        question.setQScore(Integer.parseInt(QScore));
        question.setPointID(Integer.parseInt(PointID));

        if (QType.equals("选择题")) {
            String A = request.getParameter("OptA");
            String B = request.getParameter("OptB");
            String C = request.getParameter("OptC");
            String D = request.getParameter("OptD");
            String ChoiceAnswer = request.getParameter("ChoiceAnswer");

            Option option = new Option();
            option.setOptA(A);
            option.setOptB(B);
            option.setOptC(C);
            option.setOptD(D);
            question.setOpti(option);
            question.setQAnswer(ChoiceAnswer);
            questionMapper.updateSingle(question);
        } else if (QType.equals("判断题")) {
            String JudgeAnswer = request.getParameter("JudgeAnswer");
            question.setQAnswer(JudgeAnswer);
            questionMapper.update(question);
        } else {
            String QAnswer = request.getParameter("QAnswer");
            question.setQAnswer(QAnswer);
            questionMapper.update(question);
        }

        sqlSession.close();
        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
