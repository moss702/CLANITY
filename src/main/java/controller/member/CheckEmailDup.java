package controller.member;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import service.MemberWithdrawService;
import util.JsonRespUtil;
import util.RedisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Slf4j
@WebServlet("/member/check-email")
public class CheckEmailDup extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("여기까지는 도착하니?");

		// 1. JSON 파싱
		EmailCheckRequest reqDto = JsonRespUtil.readJson(req, EmailCheckRequest.class);
		String email = reqDto.getEmail();

		log.debug("[CHECK EMAIL] 수신된 이메일: {}", email);

		boolean isDuplicated = false;

		// 2. 가입 유저 검색
		MemberService memberService = new MemberService();
		Member foundMember = memberService.findByEmail(email);
		if (foundMember != null) {
			log.debug("[CHECK EMAIL] 가입 중인 회원 존재: {}", foundMember.getEmail());
			isDuplicated = true;
		}

		// 3. 탈퇴 유저 검색
		if (!isDuplicated) {
			MemberWithdrawService withdrawService = new MemberWithdrawService();
			isDuplicated = withdrawService.existsWithdrawByEmail(email);
			log.debug("[CHECK EMAIL] 탈퇴 회원 이메일 중복 여부: {}", isDuplicated);
		}

		// 4. 응답 반환
		boolean available = !isDuplicated;
		log.debug("[CHECK EMAIL] 사용 가능 여부: {}", available);
		JsonRespUtil.writeJson(resp, Map.of("available", available));
	}

	// 내부 static DTO class
	public static class EmailCheckRequest {
		private String email;
		public String getEmail() { return email; }
		public void setEmail(String email) { this.email = email; }
	}
}
