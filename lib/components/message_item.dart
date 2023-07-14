import 'package:flutter/material.dart';

import '../models/user.dart';
import '../theme/colors.dart';

class MessageItem extends StatefulWidget {
  final User user;
  const MessageItem({super.key, required this.user});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            offset: const Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            color: accentColor,
            image: DecorationImage(
              image: NetworkImage(widget.user.img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          widget.user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.user.message,
          style: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
