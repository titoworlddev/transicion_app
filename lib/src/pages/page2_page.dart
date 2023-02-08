import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      backgroundColor: Colors.green,
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
