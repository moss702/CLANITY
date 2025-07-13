package domain;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.type.Alias;
import controller.attach.UploadFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@Alias("attach")
public class Attach {
	private String uuid;
	private String origin;
	private String mimeType;
	private Integer image; 
	private Long size;			  // 파일 크기
	private String path;          // 파일 저장경로
	private int odr;

	public Attach(String uuid, String origin, String mimeType, Integer image, Long size, String path, int odr) {
		super();
		this.uuid = uuid;
		this.origin = origin;
		this.mimeType = mimeType;
		this.image = image;
		this.size = size;
		this.path = path;
		this.odr = odr;
	}

	// 실제 저장된 파일의 경로를 file 객체로 반환
	public File toFile() {
		return new File(UploadFile.UPLOAD_PATH + "/" + path, uuid);
	}
	
	// attach 객체로 썸네일 생성
	public Attach toThumb() {
		return Attach.builder().uuid("t_" + uuid).path(path).origin(origin).image(image).size(size).path(path).odr(odr).build();
	}

}
