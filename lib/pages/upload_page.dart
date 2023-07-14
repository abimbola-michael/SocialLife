import 'package:flutter/material.dart';

import '../components/feed_item.dart';
import '../theme/colors.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      primary: true,
      shrinkWrap: true,
      children: [
        const Text(
          "Add Photo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
