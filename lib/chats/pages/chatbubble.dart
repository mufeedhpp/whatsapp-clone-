// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/models/single_chatModels.dart';

class ChatBable extends StatelessWidget {
  ChatBable({super.key, required this.bableList});
  Singlechat bableList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          bableList.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
            color: bableList.isSend! ? Color(0XFFdcf8c6) : Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 7, right: 60, bottom: 10),
                  child: Text(bableList.message!),
                ),
                Positioned(
                  bottom: 1,
                  right: 2,
                  child: Row(
                    children: [
                      Text(bableList.sendAt!, style: TextStyle(fontSize: 10)),
                      Icon(
                        Icons.done_all,
                        color: bableList.isRead! ? Colors.blue : Colors.grey,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}