// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:sociallife/extensions.dart';
import 'package:sociallife/theme/colors.dart';

class PhotoItem extends StatelessWidget {
  final String url;
  final bool isVideo;
  final VoidCallback onPressed;
  const PhotoItem({
    Key? key,
    required this.url,
    required this.isVideo,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: !isVideo
              ? null
              : const Icon(
                  IonIcons.videocam,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
