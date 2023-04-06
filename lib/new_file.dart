import 'package:flutter/material.dart';

class WhatsAppWebUI extends StatefulWidget {
  const WhatsAppWebUI({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WhatsAppWebUIState createState() => _WhatsAppWebUIState();
}

class _WhatsAppWebUIState extends State<WhatsAppWebUI> {
  // list of chats
  final List<String> chatList = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Anna Lee',
  ];

  // selected chat index
  int selectedChatIndex = 0;

  // message input controller
  final messageInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('WhatsApp Web'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // chat list
          Container(
            width: 300,
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatList[index]),
                  onTap: () {
                    setState(() {
                      selectedChatIndex = index;
                    });
                  },
                  selected: selectedChatIndex == index,
                );
              },
            ),
          ),
          // chat screen
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatList[selectedChatIndex],
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      reverse: true,
                      children: [
                        _buildMessageBubble(
                          'Hello',
                          true,
                          '10:00 AM',
                        ),
                        _buildMessageBubble(
                          'How are you?',
                          false,
                          '10:02 AM',
                        ),
                        _buildMessageBubble(
                          'I\'m fine, thanks.',
                          true,
                          '10:03 AM',
                        ),
                        _buildMessageBubble(
                          'What about you?',
                          true,
                          '10:04 AM',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageInputController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // String message = messageInputController.text;
                          messageInputController.clear();
                          setState(() {
                            // add new message to chat screen
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isMe, String time) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isMe ? Colors.green[200] : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
