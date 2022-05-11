import 'package:flutter/material.dart';
import 'package:nikki_shop/data/repo/banner_repository.dart';
import 'package:nikki_shop/theme.dart';
import 'package:nikki_shop/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bannerRepository.getAll().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e);
    });

    const boldTextStyle = TextStyle(
        fontWeight: FontWeight.bold, color: LightThemeColor.primaryTextColor);
    const normalTextStyle = TextStyle(
        fontWeight: FontWeight.normal, color: LightThemeColor.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline6: boldTextStyle,
              bodyText2: normalTextStyle,
              caption: normalTextStyle.apply(
                  color: LightThemeColor.secondaryTextColor)),
          fontFamily: 'samim',
          colorScheme: ColorScheme.light(
              primary: LightThemeColor.primaryColor,
              secondary: LightThemeColor.secondaryColor,
              onSecondary: Colors.white)),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen()),
    );
  }
}

