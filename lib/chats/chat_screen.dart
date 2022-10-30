import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/models/chat_model.dart';
import 'package:whatsapp_clone/chats/pages/chat_tile.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

  List<User> users = [
    User(
    name: 'mufeedh',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHD4qvD2Uk3WFvkapI-Zw1cw5h3ZDqhxiN7wrvAvY&s',
    isGroup: false,
    messege: 'hyyyy',
    updatedAt:'8AM' ),

    User(
    name: 'flutter',  
    image: '',
    isGroup: true,
    messege: 'hlooooo',
    updatedAt:'9AM' ),

    User(
    name: 'uvais',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLpZHfOHnmx9xkqmka4XmiXpmZyN_xRGB_yX88wpEv&s',  
    isGroup: false,
    messege: 'hy',
    updatedAt:'10AM' ),

    User(
    name: 'shanib',
    image: 'https://wallpapercave.com/wp/wp3998726.jpg',
    isGroup: false,
    messege: 'koooi',
    updatedAt:'11AM' ),
 
    User(
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstjyKcnn1Yh8tcr_RMl7qZTpeO-jQ-6muqjddvbs&s',
    name: 'muhsin',
    isGroup: false,
    messege: 'hyyyy',
    updatedAt:'12PM' ),
    
    User(
    image: '',
    name: 'noufin',
    isGroup: false,
    messege: 'hlo',
    updatedAt:'1PM' ),
    
    User(
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSprxN5y91sBT_sHPYCZwhqUFEek5LjnTZdj2yL-KY&s',
    name: 'muhsin.',
    isGroup: false,
    messege: 'daaa',
    updatedAt:'2PM' ),
    
    User(
    image: 'https://play-lh.googleusercontent.com/hX51FaSqSye9-Jw3ifL_A5vbNTIwiQBfkk6le5dNOuZzP6O7BewwQ6jSDfnlswKYZ0A=w526-h296-rw',
    name: 'afreed',
    isGroup: false,
    messege: 'evide',
    updatedAt:'3PM' ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context,int index) {
        return  ChatTile(
         userData:users[index],
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.message),
      onPressed: () {},
       ),
    );
  }
}

