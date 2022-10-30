import 'package:flutter/material.dart';
import 'package:whatsapp_clone/camera/camera_screen.dart';
import 'package:whatsapp_clone/chats/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Whatsapp'),
          actions: [
           const Icon(Icons.search),
            PopupMenuButton(itemBuilder: (context ){
              return const[
               PopupMenuItem(
                child: Text('New Group')),
               PopupMenuItem(
                child: Text('New Broadcast')),
               PopupMenuItem(
                child: Text('Linked Devices')),
               PopupMenuItem(
                child: Text('Starred Messages')),
               PopupMenuItem(
                child: Text('Payments')),
               PopupMenuItem(
                child: Text('Settings')),
              ];
            }),
          ],
          bottom:const TabBar(tabs: [
            Icon(Icons.camera_alt),
            Text('CHATS'),
            Text('STATUS'),
            Text('CALLS'),
          ]),
        ),
        body: TabBarView(children:
        [
          CameraScreen(),
          ChatScreen(),
          Text('Status'),
          Text('Calls'),
        ] ,      
        ),
      ),
    );
  }
}