package domain;


import java.io.File;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import controller.attach.UploadFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("attach")
public class Attach {
    private Long attachId; 		  // PK - 첨부파일 ID
    private String fileName;      // UUID 서버 저장 유니크 파일명
    private String originalName;  // 원본 파일명
    private String mimeType;	  // 파일 타입
    private String image;         // 이미지 여부 * char 타입 Y | N
    private Long size;			  // 파일 크기
    private Date uploadAt;		  // 업로드 시각
    private String path;         // 파일 저장경로
    
    
	public Attach(Long attachId, String fileName, String originalName, String mimeType, String image, Long size) {
		super();
		this.attachId = attachId;
		this.fileName = fileName;
		this.originalName = originalName;
		this.mimeType = mimeType;
		this.image = image;
		this.size = size;
	}

	// 실제 저장된 파일의 경로를 file 객체로 반환
	public File toFile() {
		return new File(UploadFile.UPLOAD_PATH + "/" + path, fileName);
	}
	
	// attach 객체로 썸네일 생성
	public Attach toThumb() {
		return Attach.builder().fileName("t_" + fileName).path(path).originalName(originalName).image(image).size(size).build();
	}
}
