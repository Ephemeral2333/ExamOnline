package servlet.Point;

import com.alibaba.fastjson.JSON;
import dao.PointMapper;
import entity.Classes;
import entity.Point;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SelectByBankServlet", value = "/point/selectByBankId")
public class SelectByBankServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String bankId = request.getParameter("bankId");
        SqlSession sqlSession = MyBatisUtil.openSession();
        PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
        List<Point> points = pointMapper.selectByBankID(Integer.parseInt(bankId));
        sqlSession.close();
        retData(response, points);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, List<Point> points) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(points));
    }
}
