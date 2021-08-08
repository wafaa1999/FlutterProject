import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
class ForgotPassword extends StatefulWidget {
   

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Timer _timer;
  TextEditingController _email = TextEditingController();
   var state ;
   var passwordCode;
   var idinst;

   @override
   void initState() { 
    super.initState();
     _email.addListener(() {
       setState(() {
         
       });
      } 
      );
 
      EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    // EasyLoading.showSuccess('Use in initState');
    
  }
  
  Future checkandsendemail(email) async {
    if(_email.text.isEmpty)
    return -1;
    
    else{
    
    final String apiUrl = "https://core-graduation.herokuapp.com/checkAndSendEmail?email=$email";
     EasyLoading.show(status: '');
    final response =await http.get(Uri.parse(apiUrl));
   
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
      state = decoded['response'][0]['state']; 
      print(state);
      EasyLoading.dismiss();
    }

  }
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
               resizeToAvoidBottomInset: false,
        
        body: 
        
        Stack(
          children: [
            Positioned(
                          child: Container(
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/backlogin.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
                          child: Container(
                            // margin: EdgeInsets.all(width * 0.1),
                            // margin: EdgeInsets.fromLTRB(width * 0.1,  height * 0.04, width * 0.1,  height * 0.5),
                           margin: EdgeInsets.fromLTRB(width * 0.1,  height * 0.05, width * 0.1,  height * 0.5),

                height: height *0.5 ,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
        
            Container(
           
              child: Column(
                children: [
                  // SizedBox(height: height * 0.06),

                  SizedBox(
                    height: height * 0.5,
                  ),

                  Container(
                       margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      width: width * 0.8,
                   
                    child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,

                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني",
                          suffixIcon: _email.text.isNotEmpty?
                           IconButton(
                            icon: Icon(Icons.close),
                            onPressed: (){
                              _email.clear();
                            }
                            ):Container(width: 0,),
                          hintStyle: GoogleFonts.amiri(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8,
                              fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  
                  InkWell(onTap:() async {
                    
                      if(_email.text.isEmpty){
                         Dialog alert = showAlert(context,' البريد الالكتروني فارغ !',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                      }
                      
                      if (_email.text.isNotEmpty){
                        await checkandsendemail(_email.text);
                       if(state == "Failed"){
                         Dialog alert = showAlert(context,' البريد الالكتروني الخاص بك غير صحيح',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );}

                      else if (state == "Done"){
                         Dialog alert = showAlert(context,'تم ارسال كلمة المرور للبريد الخاص بك',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                          
                        
                         }
                      } 
                        
                  
                    },
                    child: Center(
                     child: Container(
                      width: width * 0.45,
                        height: height * 0.07,
                        
                        padding:
                            EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                            
                        decoration: BoxDecoration(
                           border: Border.all(color: Colors.white,width: 2),
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(33, 84, 84, 1),
                               Color.fromRGBO(33, 84, 84, 1)] ),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Color.fromRGBO(33, 84, 84, 1),
                                  offset: Offset(2, 2))
                            ],
                            ),
                          
                      child: Text(
                        "ارسال",
                        style: GoogleFonts.amiri(
                            fontSize: 20,
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.7),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ),
                   SizedBox(height: height * 0.02,),

                   InkWell(onTap:(){
                     Navigator.pushReplacementNamed(context, '/Login',);
                       
                  
                    },
                    child: Center(
                     child: Container(
                      width: width * 0.45,
                        height: height * 0.07,
                        
                        padding:
                            EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                            
                        decoration: BoxDecoration(
                           border: Border.all(color: Colors.white,width: 2),
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(33, 84, 84, 1),
                               Color.fromRGBO(33, 84, 84, 1)] ),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Color.fromRGBO(33, 84, 84, 1),
                                  offset: Offset(2, 2))
                            ],
                            ),
                          
                      child: Text(
                        "رجوع",
                        style: GoogleFonts.amiri(
                            fontSize: 20,
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.7),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      
    );
  }
}