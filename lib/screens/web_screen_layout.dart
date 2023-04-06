import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/colors/colors.dart';
import 'package:whatsappresponsiveui/screens/mobil_chat_screen.dart';
import 'package:whatsappresponsiveui/widgets/chat_list.dart';
import 'package:whatsappresponsiveui/widgets/contacts_list.dart';
import 'package:whatsappresponsiveui/widgets/info.dart';
import 'package:whatsappresponsiveui/widgets/my_message_card.dart';
import 'package:whatsappresponsiveui/widgets/sender_message_card.dart';
import 'package:whatsappresponsiveui/widgets/web_chat_appbar.dart';
import 'package:whatsappresponsiveui/widgets/web_profile_bar.dart';
import 'package:whatsappresponsiveui/widgets/web_search_bar.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int selectedChatIndex = 0;
  final controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //profile bar
                  const WebProfileBar(),
                  //searcg bar,
                  const WebSearchBar(),
                  // ContactsList(),
                  Padding(
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
                                  setState(() {
                                    selectedChatIndex = index;
                                  });
                                },
                                selected: selectedChatIndex == index,
                                title: Text(
                                  info[index]['name'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    info[index]['message'].toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      info[index]['profilePic'].toString()),
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
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: dividerColor)),
              image: DecorationImage(
                image: AssetImage(
                  'assets/wabg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                //chat app bar
                Container(
                  height: MediaQuery.of(context).size.height * 0.077,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(10),
                  color: webAppBarColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  info[selectedChatIndex]['profilePic']
                                      .toString())),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            info[selectedChatIndex]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //messages
                Expanded(
                    child: ListView.builder(
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
                )),
                //message typing box
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.only(bottom: 8, top: 4),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: dividerColor),
                    ),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: TextField(
                            controller: controller,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: searchBarColor,
                              filled: true,
                              hintText: 'Type a message',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, bottom: 5, left: 0),
                        child: IconButton(
                          onPressed: () {
                            controller.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
