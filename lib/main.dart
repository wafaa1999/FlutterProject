import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduationproject/screens/ForgetPassword.dart';
import 'package:graduationproject/screens/HeadOfDepMain.dart';
import 'package:graduationproject/screens/Login.dart';
import 'package:graduationproject/screens/times.dart';
import 'package:graduationproject/widgets/teses2SecondPage.dart';






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
      // home:TextDialogWidget22(title: "kk"),
      home:Login(),
      // InstDialogWidget(inst: ["fgc",'fdgd'],title: "jgfx",),
      // LocalNotificationWidget(),
      // AddTablefinal(),
      
      
      
      builder: EasyLoading.init(),
      routes: {
        '/Login':(context)=> Login(),
        '/ForgetPassword':(context)=>ForgotPassword(),
        '/HeadOfDepMain' :(context)=>HeadOfDepMain(),

      },
     
    );
  }
}
