import 'package:figma_challenge/screens/credit-card_screen.dart';
import 'package:figma_challenge/screens/favorites_screen.dart';
import 'package:figma_challenge/screens/profile_screen.dart';
import 'package:figma_challenge/screens/signin_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninScreen(),
      routes:{
        'signin': (context) => const SigninScreen(),
        'credit-card': (context) => const CreditCardScreen(),
        'favorites': (context) => const FavoritesScreen(),
        'profile': (context) => const ProfileScreen(),
      }
    );
  }
}
