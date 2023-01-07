package servlet.Bank;

import com.alibaba.fastjson.JSON;
import dao.BankMapper;
import entity.Bank;
import entity.Course;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetByCourseIDServlet", value = "/bank/findByCourseID")
public class GetByCourseIDServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String cid = request.getParameter("courseID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        BankMapper bankMapper = sqlSession.getMapper(BankMapper.class);
        List<Bank> bankList = bankMapper.findByCourseID(cid);
        sqlSession.close();
        retData(response, bankList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Bank> bankList) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(bankList));
    }
}
