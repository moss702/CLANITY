package service;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;


public class EmailService {
	
	private static final String PROPERTIES_PATH = "/secret/mail.properties";
	private static String senderEmail;
	private static String senderPassword;
	
    static {
        try (InputStream input = EmailService.class.getResourceAsStream(PROPERTIES_PATH)) {
            if (input == null) {
                throw new FileNotFoundException("mail.properties 파일을 찾을 수 없습니다: " + PROPERTIES_PATH);
            }

            Properties prop = new Properties();
            prop.load(input);

            senderEmail = prop.getProperty("mail.sender.email");
            senderPassword = prop.getProperty("mail.sender.password");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public boolean sendVerificationEmail(String email, String uuid) {
		
		Properties props = new Properties();
		
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "587");
		
		// 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
        
        try {
        	Message message = new MimeMessage(session);
        	message.setFrom(new InternetAddress(senderEmail));
        	message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        	message.setSubject("CLANITY 이메일 인증 요청");
        	
        	String verifyUrl = "http://localhost:8080/CLANITY/member/verify?token=" + uuid;
        	String content = "아래 링크를 클릭하여 이메일 인증을 완료해주세요:\n" + verifyUrl;
        	
        	message.setText(content);
        	
        	//전송
        	
        	Transport.send(message);
        	
        	System.out.println("이메일 전송 완료");
        	return true;
        }
        catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
