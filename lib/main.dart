import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mvvmf/screen/SelectDateScreen.dart';
import 'package:mvvmf/widget/CustomButton.dart';

//Flutter 主程式 : 程式進入點
void main() {
  runApp(// runApp() function is the root of widget tree
      MaterialApp(
    // try to add internationalization feature , especially for Taiwan
    ///source: https://flutter.cn/docs/accessibility-and-localization/internationalization
    localizationsDelegates: [
      // GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      TaiwanLocalizationsDelegate(),
    ],
    supportedLocales: [
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
    ],
    // locale: Locale.fromSubtags(
    //     languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
    debugShowCheckedModeBanner: false,
    // the first layer is MaterialApp widget
    // the second layer is Container widget for display 'Hello World' title and two buttons
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                MyText(),
                MyButton("Login"),
                MyButton("Register"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SelectDateScreen();
                    }));
                  },
                  child: MyButton("Select Date!"),
                ),
              ],
            ),
          ],
        ));
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

class TaiwanLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations>{
  @override
  bool isSupported(Locale locale) {
    print("locale = ${locale ==
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW')}");
    return locale ==
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW');
  }

  @override
  Future<MaterialLocalizationZhHantTw> load(Locale locale) {
    final String localeName =
    intl.Intl.canonicalizedLocale(locale.toString());
    assert(
    locale.toString() == localeName,
    'Flutter does not support the non-standard locale form $locale (which '
        'might be $localeName',
    );

    intl.DateFormat fullYearFormat;
    intl.DateFormat compactDateFormat;
    intl.DateFormat shortDateFormat;
    intl.DateFormat shortMonthDayFormat;
    intl.DateFormat mediumDateFormat;
    intl.DateFormat longDateFormat;
    intl.DateFormat yearMonthFormat;
    intl.NumberFormat decimalFormat;
    intl.NumberFormat twoDigitZeroPaddedFormat;

    // fullYearFormat = intl.DateFormat.y(localeName);
    fullYearFormat = intl.DateFormat.y(localeName);
    compactDateFormat = intl.DateFormat.yMd(localeName);
    shortDateFormat = intl.DateFormat.yMMMd(localeName);
    shortMonthDayFormat = intl.DateFormat.MMMd(localeName);
    mediumDateFormat = intl.DateFormat.MMMEd(localeName);
    longDateFormat = intl.DateFormat.yMMMMEEEEd(localeName);

    // yearMonthFormat = intl.DateFormat.yMMMM(localeName).addPattern("","");///2023年6月
    yearMonthFormat = yMMMMtoTW();///2023年6月

    decimalFormat = intl.NumberFormat.decimalPattern(localeName);//day in calender
    twoDigitZeroPaddedFormat = intl.NumberFormat('00', localeName);

    return SynchronousFuture(MaterialLocalizationZhHantTw(fullYearFormat: fullYearFormat, compactDateFormat: compactDateFormat, shortDateFormat: shortDateFormat, mediumDateFormat: mediumDateFormat, longDateFormat: longDateFormat, yearMonthFormat: yearMonthFormat, shortMonthDayFormat: shortMonthDayFormat, decimalFormat: decimalFormat, twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat));
  }

  intl.DateFormat yMMMMtoTW(){
    return intl.DateFormat("民國 y 年 M 月");
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MaterialLocalizations> old) {
   return true;
  }

}
