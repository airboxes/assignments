import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding : const EdgeInsets.symmetric(horizontal: 30 ),
      child: Column(
          children: [
            const Text (
    'Hello world, welcome hahahahah',
    )
    ],
    ),
      )
      )
    );
  }
}
