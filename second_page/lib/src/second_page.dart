import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is the second page!'),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go back to first page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
