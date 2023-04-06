import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/colors/colors.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  const MyMessageCard({super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: messageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 20, left: 10, right: 30),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      date,
                      style:
                          const TextStyle(fontSize: 11, color: Colors.white60),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.done_all,
                      size: 20,
                      color: Colors.white60,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
