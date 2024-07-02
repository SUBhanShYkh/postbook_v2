import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postbook_v2/features/home_screen.dart';
import 'package:postbook_v2/features/post/bloc/post_bloc.dart';
import 'package:postbook_v2/features/post/repo/post_repo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF37323E),
          surface: Color(0xFF6D6A75),
          secondary: Color(0xFFA8A5B1),
          primary: Color(0xFFDAD5E3),
          inversePrimary: Color(0xFFDEB841),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            PostBloc(repo: PostRepo())..add(PostInitialFetchEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
