import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/Add1.dart';
import 'package:graduationproject/screens/Add2.dart';
import 'package:graduationproject/screens/Add3.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/screens/AddNewRoom.dart';
import 'package:graduationproject/screens/AddNewTable.dart';
import 'package:graduationproject/screens/ForgetPassword.dart';
import 'package:graduationproject/screens/HeadOfDepMain.dart';
import 'package:graduationproject/screens/Login.dart';
import 'package:graduationproject/screens/MatOfDep.dart';
import 'package:graduationproject/screens/ThreeMainCat.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/screens/showtables.dart';
import 'package:graduationproject/widgets/table.dart';
import 'package:graduationproject/widgets/test.dart';





void main() {
  configLoading();
  runApp(MyApp());
  

}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50.0
    ..radius = 100
    ..progressWidth= 20
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.grey
    ..textColor = Colors.yellow
    ..maskColor = Colors.white
    ..userInteractions = true
    ..dismissOnTap = false;
    // ..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
    localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('ar', 'AE'), // English, no country code
   
  ],
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
       
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // iconTheme: IconThemeData(color: Colors.white),
      ),

      // home:AllTableshow(),
      // home:Showcat(),
      home:Login(),
      builder: EasyLoading.init(),
      routes: {
        '/Login':(context)=> Login(),
        '/ForgetPassword':(context)=>ForgotPassword(),
        '/HeadOfDepMain' :(context)=>HeadOfDepMain(),

      },
     
    );
  }
}
