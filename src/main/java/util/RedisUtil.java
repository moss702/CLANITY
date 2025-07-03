package util;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.slf4j.Slf4j;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Slf4j
public class RedisUtil {
	private static JedisPool pool;
	private static String redisHost;
	private static int redisPort;
	
	static {
        try (InputStream is = RedisUtil.class.getResourceAsStream("/secret/redis.properties")) {
            Properties props = new Properties();
            props.load(is);

            redisHost = props.getProperty("redis.host");
            redisPort = Integer.parseInt(props.getProperty("redis.port"));

            pool = new JedisPool(redisHost, redisPort);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	// jedis 리턴
    public static Jedis getConnection() {
        return pool.getResource();
    }
	
    public static void setWithExpire(String key, String value, int seconds) {
        try (Jedis jedis = getConnection()) {
            jedis.setex(key, seconds, value);
        }
    }
    
    public static String get(String key) {
        try (Jedis jedis = getConnection()) {
            return jedis.get(key);
        }
    }
    
    public static void delete(String key) {
        try (Jedis jedis = getConnection()) {
            jedis.del(key);
        }
    }
}
