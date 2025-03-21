import 'background/bg.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(child: Scaffold(body: Background(child: Column())));
  }
}
