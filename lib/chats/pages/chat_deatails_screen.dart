import 'dart:async';
// import 'package:emoji_picker/emoji_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/models/chat_model.dart';
import 'package:whatsapp_clone/chats/models/single_chatModels.dart';
import 'package:whatsapp_clone/chats/pages/chatbubble.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key? key, required this.details});

  User details;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final _messageController = TextEditingController();
  FocusNode focusNode = FocusNode();

  bool showSend = false;

  bool showEmoji = false;

  List<Singlechat> bubble = [
    Singlechat(isRead: true, isSend: true, message: 'hy', sendAt: '1:00pm'),
    Singlechat(isRead: false, isSend: true, message: 'hlo', sendAt: '2:00pm'),
    Singlechat(isRead: true, isSend: false, message: 'evide', sendAt: '3:00pm'),
    Singlechat(
        isRead: false, isSend: true, message: 'sugam ano', sendAt: '4:00pm'),
    Singlechat(isRead: true, isSend: false, message: 'haaa', sendAt: '5:00pm'),
  ];

  void setbubble() {
    var datetime = DateTime.now();
    setState(() {
      var Time = '${datetime.hour}:{datetime.minute}am';

      bubble.add(Singlechat(
          isRead: false,
          isSend: true,
          message: _messageController.text,
          sendAt: Time));
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back)),
            CircleAvatar(
                backgroundImage: (widget.details.image == '')
                    ? AssetImage(widget.details.isGroup!
                        ? 'assets/images/group.png'
                        : 'assets/images/avatar.jpg') as ImageProvider<Object>?
                    : NetworkImage(widget.details.image!)),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(widget.details.updatedAt.toString()),
          ],
        ),
        actions: [
          Icon(Icons.call),
          SizedBox(width: 20),
          Icon(Icons.video_call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text(widget.details.isGroup != false
                        ? 'Group info'
                        : 'View contact')),
                PopupMenuItem(
                    child: Text(widget.details.isGroup != false
                        ? 'Group media'
                        : 'media,links,anddocs')),
                PopupMenuItem(child: Text('Search')),
                PopupMenuItem(child: Text('Mute notification')),
                PopupMenuItem(child: Text('Disppearing mussage')),
                PopupMenuItem(child: Text('Wallpaper')),
                PopupMenuItem(child: Text('more')),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bacground.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: bubble.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBable(bableList: bubble[index]);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            focusNode: focusNode,
                            onTap: () {
                              setState(() {
                                showEmoji = false;
                              });
                            },
                            controller: _messageController,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  showSend = true;
                                });
                              } else {
                                setState(() {
                                  showSend = false;
                                });
                              }
                              print(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Message',
                              prefixIcon: IconButton(
                                icon: Icon(showEmoji
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined),
                                onPressed: () {
                                  showEmoji
                                  ?focusNode.unfocus
                                  :focusNode.requestFocus();
                                  setState(() {
                                    showEmoji = !showEmoji;
                                    showEmoji
                                    ?FocusManager.instance.primaryFocus
                                        ?.unfocus()
                                        :focusNode.requestFocus();
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => menu(),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file)),
                                  Icon(Icons.currency_rupee),
                                  Icon(Icons.camera_alt),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setbubble();
                        },
                        child: Icon(showSend ? Icons.send : Icons.mic),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !showEmoji,
                    child: const SizedBox(
                      height: 250,
                      child: EmojiPicker(),
                    ),
                  )
                  // showEmoji?selectEmoji():Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      height: 350,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: Icon(Icons.insert_drive_file),
                    color: Colors.blue,
                    text: 'Document'),
                iconWidget(
                    icon: Icon(Icons.camera_alt),
                    color: Colors.pink,
                    text: 'Camera'),
                iconWidget(
                    icon: Icon(Icons.insert_photo),
                    color: Colors.purple,
                    text: 'Gallery'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: Icon(Icons.headset),
                    color: Colors.orange,
                    text: 'Audio'),
                iconWidget(
                    icon: Icon(Icons.location_pin),
                    color: Colors.green,
                    text: 'Location'),
                iconWidget(
                    icon: Icon(Icons.currency_rupee),
                    color: Colors.teal,
                    text: 'Payment'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: iconWidget(
                  icon: Icon(Icons.contact_phone_outlined),
                  color: Colors.blue,
                  text: 'Contact'),
            ),
          ],
        ),
      ),
    );
  }

  Column iconWidget({
    String? text,
    Icon? icon,
    Color? color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: icon,
          radius: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}

// Widget selectEmoji(){
//   return EmojiPicker(onEmojiSelected: (emoji, category) {},);
// }
