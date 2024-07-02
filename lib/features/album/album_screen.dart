// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:postbook_v2/features/album/widgets/album_card.dart';
import 'package:postbook_v2/features/album/widgets/loading_album_card.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        LoadingAlbumCard(),
      ],
    );

    // return GridView.custom(
    //   gridDelegate: SliverQuiltedGridDelegate(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 10,
    //     crossAxisSpacing: 10,
    //     repeatPattern: QuiltedGridRepeatPattern.inverted,
    //     pattern: const [
    //       QuiltedGridTile(2, 2),
    //       QuiltedGridTile(1, 1),
    //       QuiltedGridTile(1, 1),
    //       QuiltedGridTile(1, 2),
    //     ],
    //   ),
    //   childrenDelegate:
    //       SliverChildBuilderDelegate((context, index) => Container(
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).colorScheme.secondary,
    //             ),
    //             child: const Center(
    //               child: Text("quidem molestiae enim"),
    //             ),
    //           )),
    // );
  }
}
