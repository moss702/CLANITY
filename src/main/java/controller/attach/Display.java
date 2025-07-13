package controller.attach;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.util.IOUtils;

import lombok.extern.slf4j.Slf4j;
import util.S3Util;

@Slf4j
@WebServlet("/display")
public class Display extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		final String UPLOAD_PATH = "d:/upload/files";
		String uuid = req.getParameter("uuid");
		String path = req.getParameter("path");
		String thumbnail = req.getParameter("thumbnail");
		
		log.info("{},{},{}", uuid, path, thumbnail);
     
		
		if (uuid == null || path == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        // 썸네일 파일명 처리
        String fileName = (thumbnail != null && thumbnail.equals("Y")) ? "t_" + uuid : uuid;

        // S3에서 파일 불러오기
        String key = "upload/" + path + "/" + fileName;

        try (InputStream is = S3Util.download(key)) {
            if (is == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // MIME 타입 추정
            String mimeType = URLConnection.guessContentTypeFromName(uuid);
            resp.setContentType(mimeType != null ? mimeType : "application/octet-stream");

            // 브라우저로 스트림 전달
            IOUtils.copy(is, resp.getOutputStream());
        } catch (Exception e) {
            log.error("Display error", e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
		
//		File file = new File(UploadFile.UPLOAD_PATH + "/" + path, uuid);
//		if(!file.exists()) {
//			resp.setContentType("text/html; charset=utf-8");
//			resp.getWriter().println("<h3>파일이 존재하지 않습니다</h3>");
//			return;
//		}
		
		// ---------- 응답 헤더 설정
//		resp.setContentType(Files.probeContentType(file.toPath()));	
//		resp.setHeader("Content-Length", String.valueOf(file.length()));
//		파일이 너무 작을때
//		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
//		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
//		
////		byte[] bs = bis.readAllBytes();
////		log.info("{}", bs.length);
////		bos.write(bs); //*bs = 파일크기
//		
//		bos.write(bis.readAllBytes());
//		
//		bis.close();
//		bos.close();	
//	}

