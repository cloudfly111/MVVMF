import 'package:flutter/material.dart';

//Flutter 主程式 : 程式進入點
void main() {
  runApp(// runApp() function is the root of widget tree
      MaterialApp(
    // the first layer is MaterialApp widget
    // the second layer is Text widget for displaying 'Hello world' sentence with special decoration.
    home: MyText(),
  ));
}

/// create a class MyText to set the postion of text and text style.
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //the top layer is Container widget for setting the position of text
    return Container(
      //margin : set the empty space to surround the decoration and text.
      margin: EdgeInsets.all(15),
      //padding : set the empty space to the inner of container
      padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
      //color: define the background color of container
      color: Colors.amberAccent,
      //the second layer is Text widget for display'Hello World!' text and set the style of text.
      child: const Text(
        // the content of text
        'Hello World!',
        //the flow of text
        textAlign: TextAlign.center,
        //the style of text : white text , green background color
        // , bold font-style , white dotted underline
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.limeAccent,
          fontSize: 50,
          decorationStyle: TextDecorationStyle.dotted,
          decorationColor: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        //set the height of text
        strutStyle: StrutStyle(
          height: 10,
        ),
        //set the maxline of text
        maxLines: 1,
      ),
    );
  }
}
