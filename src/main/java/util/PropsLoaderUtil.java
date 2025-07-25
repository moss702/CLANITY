package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import net.sf.log4jdbc.sql.jdbcapi.DriverSpy;


public class PropsLoaderUtil {
	public static Properties getProperties(String file) {

		// Properties <String, String>
		// 설정 정보 관리, 파일
		Properties props = new Properties();
		
		// 현재 실행중인 스레드의 컨텍스트 클래스로더의 위치에서 resource를 stream 형태로 가져오기
		try (InputStream is = Thread.currentThread()
				.getContextClassLoader()
				.getResourceAsStream(file)) {
			if (is == null) {
				throw new FileNotFoundException("Cannot find db.properties in classpath");
			}
			props.load(is);
		} catch (IOException e){
			e.printStackTrace();
		}
		return props;
		
	}
}