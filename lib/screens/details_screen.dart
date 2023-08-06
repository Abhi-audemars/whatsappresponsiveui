// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:whatsappresponsiveui/colors/colors.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details-screen';
  final String name;
  final String profilePic;
  const DetailsScreen({
    Key? key,
    required this.name,
    required this.profilePic,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: appBarColor,
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Image.network(
            widget.profilePic,
            fit: BoxFit.fitHeight,
          ),
        ));
  }
}
