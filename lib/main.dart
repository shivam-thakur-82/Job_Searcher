import 'package:flutter/material.dart';
import 'package:job_searcher/pages/home_page.dart';
import 'package:job_searcher/pages/onboarding_page.dart';
import 'package:job_searcher/pages/sign_in_page.dart';
import 'package:job_searcher/pages/sign_up_page.dart';
import 'package:job_searcher/pages/splash_page.dart';
import 'package:job_searcher/providers/auth_provider.dart';
import 'package:job_searcher/providers/category_provider.dart';
import 'package:job_searcher/providers/job_provider.dart';
import 'package:job_searcher/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}


