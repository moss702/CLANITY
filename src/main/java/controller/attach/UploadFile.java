package controller.attach;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import domain.Attach;
import domain.AttachLink;
import service.AttachLinkService;
import service.AttachService;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/upload")
@MultipartConfig(location = "D:\\백업데이터\\semi_test_image",   // * 임시) 파일 저장경로
	maxRequestSize = 50 * 1024 * 1024,    // 한번의 요청당 최대 파일 크기 
	maxFileSize = 10 * 1024 * 1024,       // 파일 하나당 최대 크기
	fileSizeThreshold = 1 * 1024 * 1024)  // 이 크기를 넘어가면 location위치에 buffer를 기록함
@Slf4j
public class UploadFile extends HttpServlet {
	public final static String UPLOAD_PATH = "D:\\백업데이터\\semi_test_image";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String targetType = req.getParameter("targetType"); 			// 첨부파일 사용할 게시판의 타입 - ex)board, qna
	    Long targetId = Long.parseLong(req.getParameter("targetId"));	// 해당 게시판의 pk - ex) boardId, qnaId
		
	    // 업로드 된 파일 처리
        Collection<Part> parts = req.getParts();
        List<Attach> attachs = new ArrayList<>();
        
		AttachService attachService = new AttachService();
		AttachLinkService attachLinkService = new AttachLinkService();

        for (Part part : parts) {
        	if (part.getSize() == 0 || part.getName().equals("targetType") || part.getName().equals("targetId")) continue;

            // 파일 정보 추출
            Long fileSize = part.getSize();				  // 파일 크기
            String origin = part.getSubmittedFileName();  // 원본 파일명
            String contentType = part.getContentType();   // MIME 타입

            // 확장자 추출
            String ext = "";
            int idx = origin.lastIndexOf(".");
            if (idx >= 0) ext = origin.substring(idx);

            // 저장용 uuid (fileName) 파일명 생성
            String fileName = UUID.randomUUID().toString() + ext;

            // 이미지 여부 확인
            boolean image = contentType != null && contentType.startsWith("image");

            // 날짜 기반 폴더 구조 생성
            String path = genPath();
            String realPath = UPLOAD_PATH + "/" + path + "/";
            File fileDir = new File(realPath);
            if (!fileDir.exists()) fileDir.mkdirs();

            // 폴더에 파일 저장
			part.write(realPath + fileName);
			
			//첨부파일이 이미지인 경우, 썸네일 생성
			if(image) {
				try {
					Thumbnails.of(new File(realPath + fileName)).size(150, 150).toFile(realPath + "t_" + fileName);					
				}
				catch (Exception e) {
					//이미지썸네일레이터를 이용해서 썸네일 만들려고 했는데 안되면?
					// 그냥 너는 이제 이미지가 아닌것이다.
					image = false;
				}
			}

			Attach attach = Attach.builder()
						.fileName(fileName)
						.originalName(origin)
						.mimeType(contentType)
						.image(image ? "Y" : "N")
						.size(fileSize)
						.path(path)
					.build();
			attachService.save(attach); // attach_id 얻기

			AttachLink link = AttachLink.builder()
					.attachId(attach.getAttachId())
					.targetType(targetType)
					.targetId(targetId)
				.build();
			attachLinkService.save(link);

			attachs.add(attach);
        
        }
		//비동기로 할거니까 응답을 JSON으로 만들어준다
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(new Gson().toJson(attachs));
	}
	// 오늘 날짜 기준 폴더 경로 만들기
	private String genPath() {
        return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
    }
}
