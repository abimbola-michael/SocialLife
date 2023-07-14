import 'package:flutter/material.dart';
import 'package:sociallife/data/post_json.dart';
import 'package:sociallife/models/post.dart';
import '../components/feed_item.dart';
import '../components/photo_item.dart';
import '../theme/colors.dart';
import 'display_page.dart';

class SavesPage extends StatefulWidget {
  const SavesPage({super.key});

  @override
  State<SavesPage> createState() => _SavesPageState();
}

class _SavesPageState extends State<SavesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      primary: true,
      shrinkWrap: true,
      children: [
        const Text(
          "Saves",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 8,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: postsList.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = Post.fromMap(postsList[index]);
            return Hero(
              tag: post.postImg,
              child: PhotoItem(
                url: post.postImg,
                isVideo: false,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DisplayPage(
                            isVideo: false,
                            url: post.postImg,
                            title: post.name,
                          )));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
