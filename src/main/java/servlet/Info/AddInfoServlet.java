package servlet.Info;

import dao.InfoMapper;
import entity.Info;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddInfoServlet", value = "/info/add")
public class AddInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String rid = request.getParameter("rID");
        String applyReason = request.getParameter("ApplyReason");
        String sno = request.getParameter("sNo");
        Info info = new Info();
        info.setRID(Integer.parseInt(rid));
        info.setContent(applyReason);
        info.setSNo(sno);
        info.setState("待审核");
        SqlSession sqlSession = MyBatisUtil.openSession();
        InfoMapper infoMapper = sqlSession.getMapper(InfoMapper.class);
        infoMapper.insert(info);
        sqlSession.close();

        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
