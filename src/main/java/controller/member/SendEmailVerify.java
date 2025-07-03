package controller.member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import service.EmailService;
import util.RedisUtil;


@Slf4j
@WebServlet("/member/send-email-verify")
public class SendEmailVerify extends HttpServlet{
	 private EmailService emailService = new EmailService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
        System.out.println("전송 요청된 이메일: " + email);

        
        
        // 임시 고정 UUID (추후 UUID.randomUUID().toString()으로 교체)
        String uuid = UUID.randomUUID().toString();
        
        RedisUtil.setWithExpire(email, uuid, 600);
        
        
        boolean success = emailService.sendVerificationEmail(email, uuid);

        if (success) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}
}
