import 'dart:io';

WebSocket _webSocket;

String socketServerUrl = 'ws://echo.websocket.org/';
//String socketServerUrl = 'ws://echo.FAILS.org/';

void main() {

  Future<WebSocket> futureWebSocket = WebSocket.connect(socketServerUrl);
  futureWebSocket.then((WebSocket ws) {
    _webSocket = ws;
    print(_webSocket.readyState);

    _webSocket.listen(
        (d) { print(d); },
        onError: (e) { print("error"); print(e); }, 
        onDone: () => print("done")
    );

    // send message
    _webSocket.add('hello websocket world');

  });


}

/*
class SocketUtil {
  WebSocket _webSocket;

  String socketServerUrl;

  SocketUtil( this.socketServerUrl );

  void connect() {
    Future<WebSocket> futureWebSocket =
        WebSocket.connect(socketServerUrl);
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;
      _webSocket.readyState;


      void onData(dynamic content) {
        print(content);
      }

      _webSocket.listen(
          onData,
          onError: (e) { print("error"); print(e); }, 
          onDone: () => print("done")
      );

    });
  }

  void closeSocket() {
    _webSocket.close();
  }

  void _sendMessage(String message) {
    _webSocket.add(message);
  }

}

*/

