import 'package:flutter/material.dart';
class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('Welcome to RWPC',style: TextStyle(color: Colors.white),)
        ),
      ),
    );
  }
}
