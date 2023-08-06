// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whatsappresponsiveui/colors/colors.dart';
import 'package:whatsappresponsiveui/screens/details_screen.dart';
import 'package:whatsappresponsiveui/widgets/chat_list.dart';
import 'package:whatsappresponsiveui/widgets/info.dart';

class MobileChatScreen extends StatefulWidget {
  final int index;
  const MobileChatScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MobileChatScreen> createState() => _MobileChatScreenState();
}

class _MobileChatScreenState extends State<MobileChatScreen> {
  bool isShowSendButton = false;
  final _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  bool isShowAttachment = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();

  void hideAtachmentContainer() {
    setState(() {
      isShowAttachment = false;
    });
  }

  void showAttachmentContainer() {
    setState(() {
      isShowAttachment = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowAttachment) {
      showKeyboard();
      hideAtachmentContainer();
    } else {
      hideKeyboard();
      showAttachmentContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            name: info[widget.index]['name'].toString(),
                            profilePic:
                                info[widget.index]['profilePic'].toString()))),
                child: Text(
                  info[widget.index]['name'].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(Icons.arrow_back),
              CircleAvatar(
                backgroundImage:
                    NetworkImage(info[widget.index]['profilePic'].toString()),
                radius: 16,
              ),
            ],
          ),
        ),

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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5)
                      .copyWith(bottom: 5),
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: _messageController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isShowSendButton = true;
                        });
                      } else {
                        setState(() {
                          isShowSendButton = false;
                        });
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: mobileChatBoxColor,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            // width: 10,
                            child: Icon(
                          Icons.emoji_emotions_rounded,
                          color: Colors.grey,
                        )),
                      ),
                      suffixIcon: isShowSendButton
                          ? GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                              ),
                            )
                          : SizedBox(
                              width: 130,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: toggleEmojiKeyboardContainer,
                                    child: const Icon(
                                      Icons.attach_file,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.currency_rupee_outlined,
                                    color: Colors.grey,
                                  ),
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                      hintText: 'Message',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4, right: 2, left: 0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF128C7E),
                  radius: 23,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _messageController.clear();
                      });
                    },
                    child: Icon(
                      isShowSendButton ? Icons.send : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          isShowAttachment
              ? Container(
                  height: 310,
                  color: mobileChatBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange),
                                  child: const Icon(
                                    Icons.edit_document,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Document',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                  child: const Icon(
                                    Icons.photo,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.s,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: const Icon(
                                    Icons.headphones,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Music',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Location',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple),
                                  child: const Icon(
                                    Icons.currency_rupee,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Payment',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
