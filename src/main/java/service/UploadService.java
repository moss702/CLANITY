package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import controller.attach.UploadFile;
import domain.Attach;
import domain.AttachLink;

public class UploadService {

    private final AttachService attachService = new AttachService();
    private final AttachLinkService attachLinkService = new AttachLinkService();

    public void handleUpload(HttpServletRequest req, String targetType, Long targetId) throws Exception {
        for (Part part : req.getParts()) {
            if (part.getName().equals("files[]") && part.getSize() > 0) {
                UploadFile.UploadResult result = UploadFile.save(part);
                Attach attach = result.toAttach();
                attachService.save(attach); // insert into attach

                AttachLink link = AttachLink.builder()
                    .attachId(attach.getAttachId())
                    .targetType(targetType)
                    .targetId(targetId)
                    .build();
                attachLinkService.save(link); // insert into attach_link
            }
        }
    }
    
    public void deleteFile(String path, String fileName, String originalName, String image) {
    	// 파일 물리 경로 찾기
    	String realPath = UploadFile.UPLOAD_PATH + "/" + path + "/";   
     
        // 경로에 있는 파일 삭제
        File fileDir = new File(realPath);
        if (fileDir.exists()) fileDir.delete();
        
        // 이미지일 경우, 썸네일 파일도 삭제
        if (image == "Y") {
        	File thumb = new File(realPath, "t_" + fileName);
            if (thumb.exists()) thumb.delete();
        }
    }
}