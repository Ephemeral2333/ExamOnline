package servlet.Exam;

import constant.ExamConstant;
import dao.CourseMapper;
import dao.ExamMapper;
import dao.ResultMapper;
import entity.Exam;
import entity.Result;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddExamServlet", value = "/exam/add")
public class AddExamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String examName = request.getParameter("ExamName");
        String startTime = request.getParameter("StartTime");
        String endTime = request.getParameter("EndTime");
        String CourseID = request.getParameter("CourseID");
        String PaperID = request.getParameter("PaperID");
        String Duration = request.getParameter("Duration");
        SqlSession sqlSession = MyBatisUtil.openSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        Exam exam = new Exam();
        exam.setEName(examName);
        exam.setStartTime(startTime);
        exam.setEndTime(endTime);
        exam.setCourseID(CourseID);
        exam.setPaperID(Integer.parseInt(PaperID));
        exam.setDuration(Integer.parseInt(Duration));
        examMapper.insertExam(exam);
        exam.setEID(examMapper.getMAXEID());

        //  获得所有该课程学生信息
        CourseMapper courseMapper = sqlSession.getMapper(CourseMapper.class);
        List<String> sNoList = courseMapper.selectStuByCourseID(CourseID);
        for (String sNo : sNoList) {
            Result result = new Result();
            result.setSNo(sNo);
            result.setEID(exam.getEID());
            result.setStage(ExamConstant.EXAM_STATE_READY);
            ResultMapper resultMapper = sqlSession.getMapper(ResultMapper.class);
            resultMapper.insertResult(result);
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
