import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/contact_page.dart';
import 'pages/about_page.dart';
import 'pages/services_page.dart';
import 'pages/notifications_page.dart';
import 'pages/chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novatech Chatbot App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/contact': (_) => ContactPage(),
        '/about': (_) => AboutPage(),
        '/services': (_) => ServicesPage(),
        '/notifications': (_) => NotificationsPage(),
        '/chat': (_) => ChatPage(),
      },
    );
  }
}
