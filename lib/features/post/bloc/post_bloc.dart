// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:postbook_v2/features/post/model/post_model.dart';
import 'package:postbook_v2/features/post/repo/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo repo;
  PostBloc({required this.repo}) : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    //Future.delayed(const Duration(seconds: 3));
    print("Message From \n emit => PostLoadingState");
    try {
      final objPosts = await repo.getPosts();
      emit(PostInitialFetchState(posts: objPosts));
      print("Message From \n emit => PostInitialFetchState");
    } catch (e) {
      emit(PostErrorState(error: e.toString()));
      print("Message From \n emit => PostErrorState");
    }
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostState> emit) {
    emit(PostAddState());
  }
}
