import 'package:flutter/material.dart';

//Flutter 主程式 : 程式進入點
void main() {
  runApp(// runApp() function is the root of widget tree
      MaterialApp(
    // the first layer is MaterialApp widget
    // the second layer is Container widget for display 'Hello World' title and two buttons
    home: Container(
      //set the top padding to 200
      padding: EdgeInsets.only(top: 200),
      //set the main background color as white
      color: Colors.white,
        // set the position of widget to horizontal center
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // set widget order by vertical
            Column(
              children: [MyText(),Padding(padding: EdgeInsets.all(50)),MyButton("Login"), MyButton("Register")],
            ),
          ],
        )),
  ));
}

//create button with padding in both outside and inside
// green background-color , white font-color , rounded border and shadow
class MyButton extends StatelessWidget{
  //the title of button
  String title ='';
  MyButton(String title) : this.title = title;

  @override
  Widget build(BuildContext context) {
    // set outside padding as 10
    return Padding(
      padding: EdgeInsets.all(10),
      //set the width and height of button as 50 and 120 respectively
      child: SizedBox(
          height: 50,
          width: 120,
          child: Container(
            //set inside padding as 8
            padding: EdgeInsets.all(8.0),
            //set the background color as green, border rounded , shadow under the button
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset.fromDirection(20,5))
              ],
            ),
            //set the style of text of button
            child: Text(
              title,
              //set the text placed on horizontal center
              textAlign: TextAlign.center,
              //set the flow of text is from left to right
              textDirection: TextDirection.ltr,
              style: TextStyle(
                // set font color as white
                  color: Colors.white,
                  // set the size of font as 20
                  fontSize: 20,
                  // set text without underline
                  decoration: TextDecoration.none,
              ),
            ),
          )),
    );
  }

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
