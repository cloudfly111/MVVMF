import 'package:flutter/material.dart';

//Flutter 主程式 : 程式進入點
void main() {
  runApp(// runApp() function is the root of widget tree
    const Center( // the first layer is Center widget for placing child widget to center
      // the second layer is Text widget for displaying 'Hello world' sentence
      child: Text('Hello, world',
        textDirection: TextDirection.ltr,
      ),
    )
  );
}
