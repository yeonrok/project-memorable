import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_memorable/src/model/noti.dart';
import 'package:uuid/uuid.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알림함'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('시스템'),
              subtitle: Column(
                children: [
                  Text('환영합니다.'),
                  Text('9월 3일'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
