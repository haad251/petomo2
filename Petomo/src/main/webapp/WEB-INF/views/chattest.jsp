<!-- �ؾ��Ұ�
�ڱ���̵� ����������, â ������ ���̱� , css����, �����ʻ��� ������ �ֱ�?
ä�� �޾ƿö� �����̼��̶� �����ϱ�>���� hashmap ����,�ൿ�� ������ �ֱ� ��
-->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>
  <script>
  $(function () {
	  var socket = new SockJS('/websocket');  
		stompClient = Stomp.over(socket);  
		stompClient.connect({}, function() { //����
			
			  stompClient.subscribe('/topic/chatin', function(msg) { //�޾ƿ���
				  var data = JSON.parse(msg.body);
			  	var str = '<div class="conversation"><div class="head"><div class="chat_avatar">';
			  	str += '<img src="img/notification_head5.png" alt="Notification avatar">';
			  	str += '</div><div class="name_time"><div>';
			  	str += '<h5>'+data.chat_sender+'</h5><p>'+data.chat_date+'<p></div></div></div><div class="body">';
		        str += data.chat_content + '</div></div>'; 
		        $("#chatForm").append(str);
			  });			
			
			
			  $("#sendMessageBtn").click(function() {   //Ŭ���� ����
		    	  var sender="${sessionScope.loginId}";
		    	  var content=$("#sendMessageText").val();
		    	  var receiver='mb1';  //���߿�����
		    	  var res='res1';      //���߿�����
		    		  stompClient.send('/app/chatin', {}, JSON.stringify({'res_id':res,'chat_sender':sender,'chat_receiver':receiver, 'chat_content':content}));
		      });
			
		});
  });
  </script>
  
  
</head>

<body class="preload">
	<jsp:include page="menuBar.jsp" /> 


    <section class="message_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12">
                    <div class="chat_area cardify">
                        <div class="chat_area--title">
                            <h3>Message with <span class="name">Codepoet</span></h3>
                            <div class="message_toolbar">
                                <a href="#">
                                    <span class="icon-flag"></span>
                                </a>
                                <a href="#">
                                    <span class="icon-trash"></span>
                                </a>
                                <a href="#" id="drop1" class="dropdown-toggle dropdown-trigger" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="img/menu_icon.png" class="dropdown-trigger" alt="Menu icon">
                                </a>
                                <ul class="dropdown dropdown-menu" aria-labelledby="drop1">
                                    <li>
                                        <a href="#">Mark as unread</a>
                                    </li>
                                    <li>
                                        <a href="#">Dropdown link</a>
                                    </li>
                                    <li>
                                        <a href="#">All Attachments</a>
                                    </li>
                                </ul><!-- ends: .dropdown -->
                            </div><!-- ends: .message_toolbar -->
                        </div><!-- ends: .chat_area--title -->
                        
                        
                        <div class="chat_area--conversation" id="chatForm">
                        
                        <c:forEach items="${cList}" var="chat">
                            <div class="conversation">
                                <div class="head">
                                    <div class="chat_avatar">
                                        <img src="img/notification_head5.png" alt="Notification avatar">
                                    </div>
                                    <div class="name_time" >
                                        <div>
                                            <h5>${chat.chat_sender}</h5>
                                            <p>${chat.chat_date}<p>
                                        </div>
                                    </div> 
                                </div> 
                                <div class="body" style="margin-top: 0px;">
                                      ${chat.chat_content}
                                </div> 
                            </div> 
                            
                        </c:forEach>
                        </div><!-- ends: .chat_area--conversation -->
                        
                        
                        <div class="message_composer">
                            <div class="composer_field" id="trumbowyg-demo"></div><!-- ends: .trumbowyg-demo -->
                            <div class="attached"></div>
                            <div class="btns">
                            <input type="text" id="sendMessageText" style="width: 70%; border:1px solid #515ef4;">
                                <button class="btn send btn--sm btn-primary" id="sendMessageBtn">Reply</button>
<!--                                 <label for="att"> -->
<!--                                     <input type="file" class="attachment_field" id="att" multiple> -->
<!--                                     <span class="icon-paper-clip"></span> Attachment -->
<!--                                 </label> -->
                            </div><!-- ends: .message_composer -->
                        </div><!-- ends: .message_composer -->
                    </div><!-- ends: .chat_area -->
                </div><!-- ends: .col-md-7 -->
            </div><!-- ends: .row -->
        </div><!-- ends: .container -->
    </section><!-- ends: .message_area -->
</body>
</html>