// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whatsappresponsiveui/colors/colors.dart';
import 'package:whatsappresponsiveui/widgets/chat_list.dart';
import 'package:whatsappresponsiveui/widgets/info.dart';

class MobileChatScreen extends StatelessWidget {
  final int index;
  const MobileChatScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(info[index]['profilePic'].toString()),
              radius: 17,
            ),
            const SizedBox(width: 5),
            Text(
              info[index]['name'].toString(),
            ),
          ],
        ),
        //  T
        centerTitle: false,

        //
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.emoji_emotions,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.currency_rupee_sharp,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              hintText: 'Message',
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          )
        ],
      ),
    );
  }
}
