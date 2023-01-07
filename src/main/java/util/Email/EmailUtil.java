package util.Email;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class EmailUtil {
    private static String fromEmail = "liyh@stu.haut.edu.cn";
    private static String fromEmailPw = "CF698QhzpD7qy99w";
    private static String myEmailSMTPHost = "smtp.exmail.qq.com";
    private static Properties props;
    private static Session session;
    private String vCode;
    public static EmailUtil instance = new EmailUtil();

    /*
     * 获取验证码
     * @return 验证码字符串
     */
    public String getVCode() {
        return vCode;
    }

    /*
     * 构造函数，配置属性
     */
    private EmailUtil() {
        props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");
        session = Session.getInstance(props);
    }

    /*
     * 构建邮件内容
     * @param 收件人
     * @return 发送邮件内容
     */
    public MimeMessage createMailContent(String toEmail) throws Exception, MessagingException {
        MimeMessage message = new MimeMessage(session);
        // 发件人
        message.setFrom(new InternetAddress(fromEmail, "河南工业大学考试系统注册验证码", "UTF-8"));
        // 收件人
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toEmail));
        // 邮件主题
        message.setSubject("验证码", "UTF-8");
        // 邮件正文
        vCode = VCodeUtil.verifyCode(6);
        message.setContent("您好，您的验证码是："+vCode+"。请妥善保管您的验证码，验证码5分钟内有效哦！", "text/html;charset=UTF-8");
        // 设置发件时间
        message.setSentDate(new Date());
        // 保存设置
        message.saveChanges();
        return message;
    }
    /*
     * 发送邮件
     * @param 收件人
     */
    public void sendEmail(String toEmail) throws Exception {
        Transport transport = session.getTransport();
        transport.connect(fromEmail, fromEmailPw);
        MimeMessage message = createMailContent(toEmail);
        transport.sendMessage(message, message.getAllRecipients());
        System.out.println("验证码发送成功！");
        transport.close();
    }
}
