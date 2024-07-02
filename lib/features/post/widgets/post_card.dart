// ignore_for_file: deprecated_member_use

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postbook_v2/features/post/model/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  const PostCard({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();

    return Card(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/${faker.randomGenerator.integer(99)}.jpg'),
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  faker.person.name(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/heart-alt.svg',
                  color: Theme.of(context).colorScheme.primary,
                  width: 30,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              postModel.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              postModel.body,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
              maxLines: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/comment-alt.svg',
                    color: Theme.of(context).colorScheme.primary,
                    width: 30,
                  ),
                  label: Text(
                    postModel.comments.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
