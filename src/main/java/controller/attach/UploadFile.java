package controller.attach;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/upload")
@MultipartConfig(location = "d:/upload/tmp",   // * 임시) 물리 파일 저장경로
	maxRequestSize = 50 * 1024 * 1024, 	 	   // 한번의 요청당 최대 파일 크기 
	maxFileSize = 10 * 1024 * 1024,     	   // 파일 하나당 최대 크기
	fileSizeThreshold = 1 * 1024 * 1024)  	   // 이 크기를 넘어가면 location위치에 buffer를 기록함
@Slf4j
public class UploadFile {
	public final static String UPLOAD_PATH = "d:/upload/files";
	
	public static UploadResult save(Part part) throws Exception {

            // 파일 정보 추출
            String originalName = part.getSubmittedFileName();  // 원본 파일명
            String mimeType = part.getContentType();     	    // MIME 타입
            Long size = part.getSize();					  	    // 파일 크기

            // 확장자 추출
            String ext = "";
            int idx = originalName.lastIndexOf(".");
            if (idx >= 0) ext = originalName.substring(idx);

            // 저장용 uuid (fileName) 파일명 생성
            String fileName = UUID.randomUUID().toString() + ext;

            // 이미지 여부 확인
            Boolean image = mimeType != null && mimeType.startsWith("image");

            // 날짜 기반 폴더 구조 생성
        	String path = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
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
	        return new UploadResult( fileName, originalName, mimeType, image, size, path );
        }
        
    public record UploadResult(
    		String fileName,
    	    String originalName,
    	    String mimeType,
    	    Boolean image,
    	    long size,
    	    String path
    	    ) {
    	public Attach toAttach() {
			return Attach.builder()
		            .fileName(fileName)
		            .originalName(originalName)
		            .mimeType(mimeType)
		            .image(image ? "Y" : "N")
		            .size(size)
		            .path(path)
	            .build();
        }
	}
}
