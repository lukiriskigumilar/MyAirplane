import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/destination_cubit.dart';
import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/cubit/seat_cubit.dart';
import 'package:myairplane/cubit/transaction_cubit.dart';
import 'package:myairplane/ui/pages/bonus_page.dart';
import 'package:myairplane/ui/pages/get_started_page.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import 'package:myairplane/ui/pages/signup.dart';
import 'package:myairplane/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'ui/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBR-urql7J8Dy9h4YjJdkyiLR85iJ9Rj90",
      appId: "1:602067378499:web:d58422317ad4e1f9be8ff6",
      messagingSenderId: "602067378499",
      projectId: "myairplane-43ba0",
    ));
  }
  await Firebase.initializeApp();

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
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get_started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/login': (context) => LoginPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
