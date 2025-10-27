import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset('assets/images/logo.png')),
            ListTile(title: Text('Chat'), onTap: () => Navigator.pushNamed(context, '/chat')),
            ListTile(title: Text('About'), onTap: () => Navigator.pushNamed(context, '/about')),
            ListTile(title: Text('Services'), onTap: () => Navigator.pushNamed(context, '/services')),
            ListTile(title: Text('Contact'), onTap: () => Navigator.pushNamed(context, '/contact')),
            ListTile(title: Text('Notifications'), onTap: () => Navigator.pushNamed(context, '/notifications')),
          ],
        ),
      ),
      body: Center(child: Text('Welcome to Novatech Chatbot App!')),
    );
  }
}
