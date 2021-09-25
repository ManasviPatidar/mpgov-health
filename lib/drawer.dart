import 'package:flutter/material.dart';
import 'package:get/get.dart';

Drawer buildDrawer(context) {
  return Drawer(
    child: Column(
      children: [
        AppBar(
          title: const Text('Menu'),
          automaticallyImplyLeading: false,
        ),
        const SizedBox(height: 40),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Get.offNamed('/home');
          },
          child: const Text(
            'New Patient',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Get.offNamed('/history');
          },
          child: const Text(
            'All Patients',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
