package util;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HikariCPUtil {
	private static HikariDataSource dataSource;
	static {
		HikariConfig config = new HikariConfig();
		
		Properties props = new Properties();
		
		try (InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("secret/db.properties")){
			if(is == null) {
				throw new FileNotFoundException("DB 연결 정보 파일이 없습니다");
			}
			props.load(is);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		config.setJdbcUrl(props.getProperty("jdbc.url"));
		config.setUsername(props.getProperty("jdbc.username"));
		config.setPassword(props.getProperty("jdbc.password"));
		config.setDriverClassName(props.getProperty("jdbc.driver.classname"));
		
		dataSource = new HikariDataSource(config);
	}
	
	public static DataSource getDataSource() {
		return dataSource;
	}
	public static void main(String[] args) {
		log.info("{}", dataSource);
		
	}
}
