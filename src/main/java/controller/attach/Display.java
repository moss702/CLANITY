package controller.attach;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Attach;
import lombok.extern.slf4j.Slf4j;
import service.AttachService;

@Slf4j
@WebServlet("/display")
public class Display extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uuid = req.getParameter("uuid");
		String fileName = req.getParameter("fileName");
		log.info("{},{}", uuid, fileName);
		
		File file = new File(UploadFile.UPLOAD_PATH + "/" + fileName, uuid);
		if(!file.exists()) {
			resp.setContentType("text/html; charset=utf-8");
			resp.getWriter().println("<h3>파일이 존재하지 않습니다</h3>");
			return;
		}
		
		// ---------- 응답 헤더 설정
		resp.setContentType(Files.probeContentType(file.toPath()));	

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());

		bos.write(bis.readAllBytes());
		
		bis.close();
		bos.close();	
	}
}
