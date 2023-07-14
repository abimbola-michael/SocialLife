import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sociallife/data/post_json.dart';
import 'package:sociallife/data/user_json.dart';
import 'package:sociallife/pages/display_page.dart';

import '../components/feed_item.dart';
import '../models/post.dart';
import '../theme/colors.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      primary: true,
      shrinkWrap: true,
      children: [
        const Text(
          "Feed",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: index == 0
                    ? Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFFE0DF), Color(0xFFE1F6F4)],
                            ),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundColor: accentColor,
                        backgroundImage:
                            NetworkImage(usersList[index - 1]["img"]),
                      ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemCount: postsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = Post.fromMap(postsList[index]);
            return Hero(
              tag: post.postImg,
              child: FeedItem(
                post: post,
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
