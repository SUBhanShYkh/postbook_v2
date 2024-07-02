import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:postbook_v2/features/photo/widget/photo_loading_card.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        PhotoLoadingCard(),
        //PhotoCard(),
      ],
    );
  }
}
