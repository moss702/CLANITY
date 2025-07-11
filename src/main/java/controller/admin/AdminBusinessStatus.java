package controller.admin;

import domain.BusinessApply;
import domain.Member;
import domain.en.ApplyStatus;
import domain.en.MemberRole;
import lombok.extern.slf4j.Slf4j;
import service.BusinessApplyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Slf4j
@WebServlet("/admin/business/status")
public class AdminBusinessStatus extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String applyIdStr = req.getParameter("applyId");
        String statusStr = req.getParameter("status");
        String memberIdStr = req.getParameter("memberId");

        log.debug("파라미터 확인 - applyId: {}, status: {}, memberId: {}", applyIdStr, statusStr, memberIdStr);

        try {
            Long applyId = Long.parseLong(applyIdStr);
            Long memberId = Long.parseLong(memberIdStr);
            ApplyStatus status = ApplyStatus.valueOf(statusStr.toUpperCase());

            // 세션에서 관리자 ID 가져오기
            HttpSession session = req.getSession(false);
            Long adminId = (session != null && session.getAttribute("loginMemberId") != null)
                    ? (Long) session.getAttribute("loginMemberId")
                    : 999L; // 임시 관리자 ID

            // BusinessApply 객체 생성
            BusinessApply apply = BusinessApply.builder()
                    .applyId(applyId)
                    .memberId(memberId)
                    .status(status)
                    .adminId(adminId)
                    .build();

            // Member 권한 설정 (허가일 경우에만 BUSINESS)
//            Member member = Member.builder()
//                    .memberId(apply.getMemberId())
//                    .role(status == ApplyStatus.APPROVED ? MemberRole.MEMBER.BUSINESS : null)
//                    .build();


            BusinessApplyService service = new BusinessApplyService();

            Member member = null;
            if (status == ApplyStatus.APPROVED) {
                member = Member.builder()
                        .memberId(memberId)
                        .role(MemberRole.MEMBER.BUSINESS)
                        .build();
            }

            int result = service.updateStatus(apply, member);

            if (result > 0) {
                resp.setStatus(200);
                resp.getWriter().write("상태 변경 완료");
            } else {
                resp.setStatus(500);
                resp.getWriter().write("변경 실패");
            }
        } catch (Exception e){
            resp.setStatus(500);
            resp.getWriter().write(e.getMessage());
        }
    }
}
