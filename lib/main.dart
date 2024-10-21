import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/login_screen.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';

import 'provider/login_setting.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginSetting()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
