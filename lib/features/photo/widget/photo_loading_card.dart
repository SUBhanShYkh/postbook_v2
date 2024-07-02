// ignore_for_file: deprecated_member_use

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhotoLoadingCard extends StatelessWidget {
  const PhotoLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                highlightColor: Colors.grey[300]!,
                baseColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 2,
                      ),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/${faker.randomGenerator.integer(99)}.jpg'),
                    radius: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.grey[300]!,
                      baseColor: Colors.grey[100]!,
                      child: Container(
                        //width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.grey[300]!,
                      baseColor: Colors.grey[100]!,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[300]!,
              baseColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
