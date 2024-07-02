import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postbook_v2/features/post/bloc/post_bloc.dart';
import 'package:postbook_v2/features/post/widgets/post_card.dart';
import 'package:postbook_v2/features/post/widgets/post_error_card.dart';
import 'package:postbook_v2/features/post/widgets/post_loading_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      buildWhen: (previous, current) => current is! PostActionState,
      listenWhen: (previous, current) => current is PostActionState,
      builder: ((context, state) {
        if (state is PostLoadingState) {
          return const PostLoadingCard();
        } else if (state is PostErrorState) {
          return PostErrorCard(error: state.error);
        } else if (state is PostInitialFetchState) {
          return ListView.builder(
            reverse: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final postList = state.posts[index];
              return PostCard(postModel: postList);
            },
          );
        }
        return const PostLoadingCard();
      }),
      listener: ((context, state) {
        if (state is PostAddState) {
          showBottomSheet(
              context: context,
              builder: (context) {
                return const TitleWidget();
              });
        }
      }),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(38),
      //height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Title?',
            ),
          ),

          // Row(
          //   children: [
          //     const TextField(
          //       decoration: InputDecoration(
          //         labelText: 'Title?',
          //       ),
          //     ),
          //     IconButton.filled(onPressed: () {}, icon: const Icon(Icons.add))
          //   ],
          // )
        ],
      ),
    );
  }
}
