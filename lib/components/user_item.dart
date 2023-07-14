import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  const UserItem({super.key});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
      ),
      title: const Text(
        "Tayo",
        style: TextStyle(),
      ),
      subtitle: const Text(
        "2 hrs ago",
        style: TextStyle(color: Colors.black54),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
