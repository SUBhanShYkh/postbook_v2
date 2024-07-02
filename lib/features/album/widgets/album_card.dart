import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: Theme.of(context).colorScheme.inversePrimary,
            image: const DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: AssetImage('assets/images/album.jpeg'),
            )),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Album By Subhan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
