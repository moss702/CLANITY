package controller.endpoint;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@Slf4j
@ServerEndpoint("/notify")
public class NotificationSocket {
	// 모든 연결된 세션을 저장할 Set
	private static final Set<Session> SESSIONS = new CopyOnWriteArraySet<Session>();
	
	// 최소 3개의 메서드 정의
	// 연결
	@OnOpen
	public void onOpen(Session session) {
		SESSIONS.add(session);
		log.info("{}", SESSIONS.size());
	}
	// 메세지발송
	public static void broadcast(String msg) throws IOException{
		log.info("{}", SESSIONS.size());
		System.out.println("broadcast running start");
		for(Session s : SESSIONS) {
			if(s.isOpen()) {
				s.getAsyncRemote().sendText(msg, result -> {
					if(result.isOK()) {
						// 성공
						log.info("{}", msg);
					}
				});
			}
		}
	}
	// 종료
	@OnClose
	public void onClose(Session session) {
		SESSIONS.remove(session);
	}
}
