import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/screens/mobil_chat_screen.dart';
import 'package:whatsappresponsiveui/widgets/info.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobileChatScreen(index: index),
                  ),
                );
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const MobileChatScreen()));
              },
                  title: Text(
                    info[index]['name'].toString(),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      info[index]['message'].toString(),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(info[index]['profilePic'].toString()),
                  ),
                  trailing: Text(
                    info[index]['time'].toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const Divider(
                indent: 85,
              ),
            ],
          );
        },
      ),
    );
  }
}
