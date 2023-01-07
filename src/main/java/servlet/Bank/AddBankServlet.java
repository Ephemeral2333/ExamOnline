package servlet.Bank;

import dao.BankMapper;
import entity.Bank;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBankServlet", value = "/bank/add")
public class AddBankServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("BName");
        String course = request.getParameter("CourseID");
        Bank bank = new Bank();
        bank.setBName(name);
        bank.setCourseID(course);
        SqlSession sqlSession = MyBatisUtil.openSession();
        BankMapper bankMapper = sqlSession.getMapper(BankMapper.class);
        bankMapper.insert(bank);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
