// ignore_for_file: prefer_const_constructors, deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postbook_v2/features/album/album_screen.dart';
import 'package:postbook_v2/features/photo/photo_screen.dart';
import 'package:postbook_v2/features/post/bloc/post_bloc.dart';
import 'package:postbook_v2/features/post/post_screen.dart';
import 'package:postbook_v2/features/post/widgets/top_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Faker faker = Faker();
  final NotchBottomBarController _notchBottomBarController =
      NotchBottomBarController(index: 1);

  int currentindex = 1;
  List<Widget> pages = [
    AlbumScreen(),
    PostScreen(),
    PhotoScreen(),
  ];
  void onNavTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: TopRow(faker: faker),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      // ... PAGES
      body: pages[currentindex],
      // ... PAGES
      // ... FLOATING ACTION BTN
      floatingActionButton: IconButton(
        //padding: EdgeInsets.zero,
        onPressed: onFabTap,
        icon: SvgPicture.asset(
          'assets/icons/add.svg',
          color: Theme.of(context).colorScheme.inversePrimary,
          width: 50,
        ),
      ),
      // ... FLOATING ACTION BTN
      // ... BOTTOM NAV BAR
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Theme.of(context).colorScheme.surface,
        notchBottomBarController: _notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              'assets/icons/album.svg',
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeItem: SvgPicture.asset(
              'assets/icons/album-alt.svg',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              'assets/icons/home.svg',
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeItem: SvgPicture.asset(
              'assets/icons/home-alt.svg',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              'assets/icons/picture.svg',
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeItem: SvgPicture.asset(
              'assets/icons/picture-alt.svg',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
        onTap: onNavTap,
        kIconSize: 25,
        kBottomRadius: 30,
      ),
      // ... BOTTOM NAV BAR
    );
  }

  void onFabTap() {
    if (currentindex == 1) {
      context.read<PostBloc>().add(PostAddEvent());
    }
  }
}
