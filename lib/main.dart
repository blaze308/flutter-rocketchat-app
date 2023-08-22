import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() async {
  // final uri = Uri.parse("ws://localhost:3000/websocket");
  // const backoff = ConstantBackoff(Duration(seconds: 1));
  // final socket = WebSocket(uri, backoff: backoff);

  // socket.connection.listen((state) => print("state: $state"));

  // socket.messages.listen((event) {
  //   print("message: $event");

  //   socket.send("ping");
  // });

  // await Future<void>.delayed(const Duration(seconds: 3));

  // socket.close();

  final channel = IOWebSocketChannel.connect("ws://10.0.2.2:3000/websocket");

  channel.stream.listen((event) {
    print("event: $event");
    // channel.sink.add("received");
    // channel.sink.close(status.goingAway);
  });

  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RocketChat"),
      ),
    );
  }
}
