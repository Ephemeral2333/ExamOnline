package servlet.Info;

import dao.InfoMapper;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RejectServlet", value = "/rejectCheck")
public class RejectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String rID = request.getParameter("rID");
        SqlSession sqlSession = MyBatisUtil.openSession();
        InfoMapper infoMapper = sqlSession.getMapper(InfoMapper.class);
        infoMapper.rejectCheck(Integer.parseInt(rID));
        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
