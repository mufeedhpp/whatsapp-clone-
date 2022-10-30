import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/models/chat_model.dart';
import 'package:whatsapp_clone/chats/pages/chat_deatails_screen.dart';

class ChatTile extends StatelessWidget {
   ChatTile({
    Key? key, required this.userData,
  }) : super(key: key);

  User userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
         MaterialPageRoute(
          builder: (context) => ChatDetail(details: userData),
          )),
      leading: CircleAvatar(
        backgroundImage: (userData.image=='')
           ?AssetImage(userData.isGroup!
            ?'assets/images/group.png'
          :'assets/images/avatar.jpg')as ImageProvider<Object>?      
         :NetworkImage(userData.image!)),
      title: Text(userData.name!),
      subtitle: Text(userData.messege!),
      trailing: Text(userData.updatedAt!),
    );
  }
}