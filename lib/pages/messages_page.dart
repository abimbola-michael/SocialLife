import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../components/feed_item.dart';
import '../components/message_item.dart';
import '../components/user_item.dart';
import '../data/user_json.dart';
import '../models/user.dart';
import '../theme/colors.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      primary: true,
      shrinkWrap: true,
      children: [
        const Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(0, 1),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              icon: Icon(IonIcons.search),
              isDense: true,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: usersList.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final user = User.fromMap(usersList[index]);
            return MessageItem(
              user: user,
            );
          },
        ),
      ],
    );
  }
}
