import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sociallife/components/feed_item.dart';

import '../theme/colors.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  List<IconData> icons = [
    IonIcons.home,
    IonIcons.chatbubble,
    IonIcons.add_circle,
    IonIcons.heart,
    IonIcons.person_circle
  ];
  List<String> labels = ["Home", "Chat", "Add", "Like", "Profile"];
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              size: 25,
              color: currentTab == 0 ? primaryColor : Colors.black,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTab != 0
          ? null
          : AppBar(
              title: const Text(
                "Social Life",
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined),
                ),
              ],
              elevation: 0,
            ),
      body: IndexedStack(
        index: currentTab,
        children: const [
          FeedsPage(),
          MessagesPage(),
          UploadPage(),
          SavesPage(),
          ProfilePage()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentTab = 2;
          });
        },
        child: Transform.rotate(
          angle: pi / 4,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Transform.rotate(
              angle: pi / 4,
              child: Icon(
                icons[2],
                color: currentTab == 2 ? primaryColor : Colors.white,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            label: labels[index],
            icon: index == 2 ? const SizedBox() : Icon(icons[index]),
          ),
        ),
      ),
    );
  }
}
