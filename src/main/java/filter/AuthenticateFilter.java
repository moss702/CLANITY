package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import domain.en.MemberRole;
import util.AlertUtil;

@WebFilter({"/*"})
public class AuthenticateFilter implements Filter{
    public static final List<String> REQUIRE_AUTHENTICATED = List.of( // 로그인이 필요한 접속 위치
            "/admin","/mypage","/business"
    );
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException { //HttpServletRequest가 아닌것에 주의
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        
        String uri = req.getRequestURI();
        String cp = req.getContextPath();
        String findUri = uri.substring(uri.indexOf(cp) + cp.length());  //uri확인용 자르기
        
        boolean requiresAuth = REQUIRE_AUTHENTICATED.stream().anyMatch(findUri::startsWith);
        HttpSession session = req.getSession(false); // 세션을 가져옴
        Object memberObj = (session != null) ? session.getAttribute("member") : null;
        
        if(requiresAuth) { // 로그인이 필요한경우
//            HttpSession session = req.getSession(false); // 세션을 가져옴
            if(memberObj == null) {
//                resp.sendRedirect(cp + "/member/login");
                AlertUtil.redirectAlert("로그인후 사용 가능합니다","/member/login", "red", req, resp);
                return;
            }
            
            Member member = (Member) memberObj;
            if (findUri.startsWith("/admin") && member.getRole() != MemberRole.ADMIN) {
                AlertUtil.redirectAlert("권한이 없습니다.", "/", "red", req, resp);
                return;
            }

            if (findUri.startsWith("/business") && member.getRole() != MemberRole.BUSINESS) {
                AlertUtil.redirectAlert("비즈니스 회원만 접근 가능한 페이지입니다.", "/", "red", req, resp);
                return;
            }
            
        }
        
        
        chain.doFilter(request, response);
    }
}