// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sociallife/extensions.dart';
import 'package:sociallife/theme/colors.dart';

import '../models/post.dart';

class FeedItem extends StatelessWidget {
  final Post post;
  final VoidCallback onPressed;
  const FeedItem({
    Key? key,
    required this.post,
    required this.onPressed,
  }) : super(key: key);

  Widget _buildActionButton(
      IconData icon, String count, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: context.screenHeightPercent(33),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, 1),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(post.postImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(post.img),
              ),
              title: Text(
                post.name,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                post.time,
                style: const TextStyle(color: Colors.white54),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    Icons.favorite_border_rounded,
                    post.like,
                    () {},
                  ),
                  _buildActionButton(
                    Icons.chat_bubble_outline_rounded,
                    post.comment,
                    () {},
                  ),
                  _buildActionButton(
                    Icons.share,
                    post.share,
                    () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
