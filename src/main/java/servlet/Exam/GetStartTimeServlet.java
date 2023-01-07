package servlet.Exam;

import com.alibaba.fastjson.JSON;
import entity.Major;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "GetStartTimeServlet", value = "/getStartTime")
public class GetStartTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("no");
        String eID = request.getParameter("eID");
        String name = request.getParameter("name");
        String startTime = no + name + eID;
        HttpSession session = request.getSession();

        if(session.getAttribute(startTime) == null) {
            Date time = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            session.setAttribute(startTime, sdf.format(time));
        }

        retData(response, session.getAttribute(startTime).toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void retData(HttpServletResponse response, String msg) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(msg));
    }
}
