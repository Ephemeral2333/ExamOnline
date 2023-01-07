package servlet.Question;

import com.alibaba.fastjson.JSON;
import dao.QuestionMapper;
import entity.Question;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FindQuesServlet", value = "/question/selectByPK")
public class FindQuesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        SqlSession sqlSession = MyBatisUtil.openSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        Question question = questionMapper.selectByPK(Integer.parseInt(id));
        sqlSession.close();
        retData(response, question);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, Question question) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(question));
    }
}
