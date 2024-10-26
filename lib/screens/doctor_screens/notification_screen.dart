import 'package:flutter/material.dart';

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Notifications',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const NotificationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Notifications'),
      ),
      body: ListView(
        children: const [
          NotificationItem(
            title: 'Incoming Call',
            message: 'John Doe',
            icon: Icons.call,
          ),
          NotificationItem(
            title: 'Incoming Video Call',
            message: 'Jane Smith',
            icon: Icons.video_call,
          ),
          NotificationItem(
            title: 'Incoming Call',
            message: 'John Doe',
            icon: Icons.call,
          ),
          NotificationItem(
            title: 'Incoming Call',
            message: 'Jane smith',
            icon: Icons.call,
          ),
          NotificationItem(
            title: 'Incoming Video Call',
            message: 'John Doe',
            icon: Icons.video_call,
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(message),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // Handle notification dismissal
          },
        ),
      ),
    );
  }
}
