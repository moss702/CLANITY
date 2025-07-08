package controller.attach;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebServlet("/download")
public class Download extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		final String UPLOAD_PATH = "d:/upload/files";
		
		String fileName = req.getParameter("fileName");
		String originalName = req.getParameter("originalName");
		String path = req.getParameter("path");
		log.info("{},{},{}", fileName, originalName, path);
		
		// 물리적 위치에 있는 실제 파일을 originalName으로 치환 후 다운로드
		File file = new File(UploadFile.UPLOAD_PATH + "/" + path, fileName);
		if(!file.exists()) {
			resp.setContentType("text/html; charset=utf-8");
			resp.getWriter().println("<h3>파일이 존재하지 않습니다</h3>");
			return;
		}
		
		// ---------- 응답 헤더 설정
        resp.setContentType("application/octet-stream");
        //이미지라면 브라우저가 보여주려고 하지만, 모르는 파일이라고 생각하면 다운로드한다.
        resp.setHeader("Content-Disposition", 
            "attachment; filename=\"" + URLEncoder.encode(originalName, "UTF-8").replaceAll("\\+", "%20") + "\"");
        //fileName(uuid)는 이미지 중복이름 때문에 생성했지만, 다운로드 받는건 실제 originalName을 가진 원본이어야하니까, originalName에 공백있을수있으니까 그것도 처리

        try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
             BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream())) {
            bos.write(bis.readAllBytes());
        }
	}
}
