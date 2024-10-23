import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022130039/home_screen.dart';
import 'package:uts_2022130039/login_screen.dart';
import 'package:uts_2022130039/provider/cart_provider.dart';
import 'package:uts_2022130039/provider/theme_provider.dart';

import 'provider/login_setting.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginSetting()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
