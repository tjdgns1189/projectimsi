<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>채팅 문의</title>
<style type="text/css">
    .chat-box {
        height: 500px; /* 고정된 높이 설정 */
        overflow-y: auto; /* 세로 스크롤바 자동 생성 */
        background-color: #f8f9fa; /* 배경색, 선택사항 */
        border: 1px solid #dee2e6; /* 테두리, 선택사항 */
        padding: 15px; /* 내부 여백, 선택사항 */
    }
</style>

    <script type="text/javascript">
    $(()=>{
   		$('#send').click(() => {
        	sendMessage();
        	
        $('#message').val('');
    	});//end send.click
    })//end document

    var ws = new WebSocket("ws://localhost:8080/mall/echo");

    ws.onmessage = function(event) {
        onMessage(event);
    };

    ws.onclose = function(event) {
        onClose();
    };

    function sendMessage() {
        var message = $('#message').val();
        ws.send(message);
        console.log("Sent: " + message);
    }

    function onMessage(msg) {
        var data = msg.data;
        $('#log').append(data + "<br/>");
        console.log("Received: " + data);
    }

    function onClose() {
        console.log("웹소켓 연결 끊김");
    }
    </script>
</head>
<body>

    <div class="container chat-container">
    		<div class="card-header d-flex justify-content-between align-items-center">
    		<div></div> <!-- 좌측 여백을 위한 빈 div -->
    		<h5 class="mb-0">채팅 상담</h5> <!-- 중앙에 배치될 제목 -->
    	<button class="btn btn-danger" type="button" id="endChatButton">채팅 종료</button> <!-- 우측의 채팅 종료 버튼 -->
		</div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <!-- 채팅 내용 들어가는곳 -->
                    <div id="log" class="card-body chat-box">
                    
                    </div>
                    <div class="card-footer">
						<div class="input-group mb-3">
    					<input type="text" class="form-control chat-input" id="message" placeholder="메시지 입력...">
    					<button id="send" class="btn btn-outline-secondary" type="button" id="sendButton">보내기</button>
					</div>                    
					</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>