import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Custom_Widget/verification_status.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
import 'package:hiremi_version_two/Fresher_Jobs/initialFresherJobs.dart';
import 'package:hiremi_version_two/Help_Support.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Register.dart';
import 'package:hiremi_version_two/Settings.dart';
import 'package:hiremi_version_two/verify.dart';
import 'package:hiremi_version_two/widgets_mustufa/BasicDetails.dart';
import 'API_Integration/Profile/Add Basic Details/apiServices.dart';
import 'SplashScreen.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textTheme = GoogleFonts.poppinsTextTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),

      home: SplashScreen()
      
    );
  }
}

