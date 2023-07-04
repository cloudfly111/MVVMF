
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///screen for selecting date

class SelectDateScreen extends StatefulWidget{
  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///source: https://api.flutter.dev/flutter/material/TextButton-class.html
    return Container(
        height: size.height,
        color: Colors.white,
        child: _wSelectDateButton()
    )
    ;
  }
  Widget _wSelectDateButton(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.orangeAccent,
                    Colors.amberAccent,
                    Colors.yellow,
                    Colors.yellowAccent,
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            onPressed: () async {
              print("Pressed");
              DateTime? picker = await showDatePicker(
                  context: context,
                  locale: Locale.fromSubtags(
                      languageCode: 'zh',
                      scriptCode: 'Hant',
                      countryCode: 'TW'),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2024));
              print("Select Date: ${picker!.year}-${picker!.month.toString().padLeft(2,"0")}-${picker!.day.toString().padLeft(2,"0")}");

            },
            child: Text(
              "Start to select date!",
            ),
          ),
        ],
      ),
    );
  }
  
}