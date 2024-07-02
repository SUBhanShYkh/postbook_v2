// ignore_for_file: deprecated_member_use

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
    required this.faker,
  });

  final Faker faker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/med/men/75.jpg'),
            radius: 30,
          ),
          Text(
            faker.person.name(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          SvgPicture.asset(
            'assets/icons/heart-alt.svg',
            width: 30,
            height: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          SvgPicture.asset(
            'assets/icons/day.svg',
            width: 30,
            height: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
