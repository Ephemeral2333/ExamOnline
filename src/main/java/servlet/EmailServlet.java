package servlet;

import util.Email.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

@WebServlet(name = "EmailServlet", value = "/email")
public class EmailServlet extends HttpServlet {
    private String email;
    private String vCode;
    //    private String vCodeReceive;
    private String method;
    private PrintWriter out;
    private EmailUtil emailUtil = EmailUtil.instance;
    HttpSession session;

    public EmailServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        session = req.getSession();
        out = resp.getWriter();

        email = req.getParameter("email");
        mGetVCode();
        out.flush();
        out.close();
    }

    private void mGetVCode() {
        if (!isEmail(email)) {  // 邮箱不正确
            out.print(-1);
            return;
        }
        try {
            emailUtil.sendEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
        }
        vCode = emailUtil.getVCode();
        session.setAttribute("vCode", vCode);
        out.print(1);
    }

    private boolean isEmail(String email) {
        if (email.length() == 0 || email == null) {
            return false;
        }
        // 正则表达式验证邮箱
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
        return pattern.matcher(email).matches();
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
