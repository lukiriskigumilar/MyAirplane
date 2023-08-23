import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/ui/pages/bonus_page.dart';
import 'package:myairplane/ui/pages/get_started_page.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import 'package:myairplane/ui/pages/signup.dart';
import 'package:myairplane/ui/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get_started': (context) => const GetStartedPage(),
          '/sign-up': (context) => const signUpPage(),
          '/login': (context) => const LoginPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
