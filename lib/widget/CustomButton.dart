import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          width: 200,
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