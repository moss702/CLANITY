package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import controller.attach.UploadFile;
import domain.Attach;
import domain.AttachLink;

public class UploadService {
	// 물리적으로 서버에 파일을 저장하고 삭제합니다. *(aws S3 사용시에 이 클래스가 어떻게 변경될지 모르겠어요)

    private final AttachService attachService = new AttachService();
    private final AttachLinkService attachLinkService = new AttachLinkService();

    // 파일 저장 : part, attachService의 save 메서드 이용해서 files[] 저장
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
    
    // 파일 삭제 : 파일 경로에서 해당 파일의 존재여부 판단하여 삭제.
    public void deleteFile(String path, String fileName, String originalName, String image) {
    	// 파일 물리 경로 찾기
    	String realPath = UploadFile.UPLOAD_PATH + "/" + path + "/";   
     
        // 경로에 있는 원본 파일 삭제
        File file = new File(realPath + fileName);
        if (file.exists()) file.delete();
        
        // 이미지일 경우, 썸네일 파일도 삭제
        if ("Y".equals(image)) {
        	File thumb = new File(realPath, "t_" + fileName);
            if (thumb.exists()) thumb.delete();
        }
    }
}