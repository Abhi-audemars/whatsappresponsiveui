import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/widgets/info.dart';
import 'package:whatsappresponsiveui/widgets/my_message_card.dart';
import 'package:whatsappresponsiveui/widgets/sender_message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          //my message
          return MyMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        }
        //sender message
        return SenderMessageCard(
          message: messages[index]['text'].toString(),
          date: messages[index]['time'].toString(),
        );
      },
    );
  }
}
