import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sociallife/data/me_post_json.dart';
import 'package:sociallife/data/user_json.dart';

import '../components/feed_item.dart';
import '../components/photo_item.dart';
import '../theme/colors.dart';
import 'display_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentTab = 0;
  Widget _buildColumn(String title, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          count,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: accentColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                //padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: NetworkImage(usersList[0]["img"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Jon Doe",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "@johndoe",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColumn("Posts", "67"),
            _buildColumn("Followers", "5008"),
            _buildColumn("Following", "190"),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 0;
                });
              },
              icon: Icon(
                IonIcons.image,
                color: currentTab == 0 ? primaryColor : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 1;
                });
              },
              icon: Icon(
                IonIcons.videocam,
                color: currentTab == 1 ? primaryColor : Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: currentTab == 0 ? mePostList.length : meVideoList.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final imgUrl =
                currentTab == 0 ? mePostList[index] : meVideoList[index]["img"];
            final url =
                currentTab == 1 ? meVideoList[index]["videoUrl"] : imgUrl;
            return Hero(
              tag: url,
              child: PhotoItem(
                url: imgUrl,
                isVideo: currentTab == 1,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayPage(
                      isVideo: currentTab == 1,
                      url: url,
                      title: "Me",
                    ),
                  ));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
