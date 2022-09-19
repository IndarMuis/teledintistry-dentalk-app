import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teledintistry/app/theme.dart';

class ChatViewHeader extends StatelessWidget {
  const ChatViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        "Chats",
        style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
      ),
    );
  }
}
