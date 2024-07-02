part of 'post_bloc.dart';

@immutable
sealed class PostState {}

sealed class PostActionState extends PostState {}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostErrorState extends PostState {
  final String error;

  PostErrorState({required this.error});
}

final class PostInitialFetchState extends PostState {
  final List<PostModel> posts;

  PostInitialFetchState({required this.posts});
}

final class PostAddState extends PostActionState {}
