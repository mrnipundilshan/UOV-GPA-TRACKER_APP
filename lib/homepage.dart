import 'background/bg.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(child: Scaffold(body: Background(child: Column())));
  }
}
