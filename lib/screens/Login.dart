import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/HeadOfDepMain.dart';
import 'package:graduationproject/teacher/DoctorMain.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
class Login extends StatefulWidget {

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  var idDep ;
  var type;
  var depName;
  var instName;
  Timer _timer;
  bool isvisible = true;
  @override
  void initState() { 
    super.initState();
    // done();
    // wafaa();
  

     _username.addListener(() {
       setState(() {
         
       });
      } );
      EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    
  }

  Future checkUser(userid, password) async {

    if(_username.text.isEmpty && _password.text.isEmpty) {
      return -2;
    }
    else if(_username.text.isEmpty && _password.text.isNotEmpty) return -3;
    else if(_password.text.isEmpty && _username.text.isNotEmpty ) return -4;
    else{
    
    final String apiUrl = "https://core-graduation.herokuapp.com/loginAuthorization?idUser=$userid&password=$password";
     EasyLoading.show(status: '');
     
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded);
      // var user = decoded['response'];
      idDep = decoded['response'][0]['idDep'];
      type = decoded['response'][0]['type'];
      instName=decoded['response'][0]['name'];
      depName = decoded['response'][0]['depName'];
      EasyLoading.dismiss();
      

       if(type == 'head of department') {
         return 2;
       }
       else if(type == 'head') {
         return 1;
       }
       else if(type == 'normal') {
         return 3;
       }
      if(type == 'None') {
         return 0;
       }
      }
    }
     EasyLoading.dismiss();
  }
// Future done() async {

   
//     final String apiUrl = "http://192.168.1.7:3000/runCore?idDep=60ddc9735b4d43f8eaaabf83&tableName=?????????? ??????????&date=2020/2021&semester=1&softFlag=true";
//    print('fgf');
//     final response =
//          http.get(Uri.parse(apiUrl));
//     print("d");
//   }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     return Container(

      child: Scaffold(
         resizeToAvoidBottomInset: false,
        body: Stack(
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
              margin: EdgeInsets.only(top: height * 0.42),
              height: height * 0.5,
   
              child: SingleChildScrollView(
                              child: Column(
                  children: [
         
                 
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      width: width * 0.8,
                      child: TextField(
                        
                        controller: _username,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "?????? ????????????????",
                           
                            hintStyle: GoogleFonts.amiri(
                                fontWeight: FontWeight.bold, letterSpacing: 1.8,
                                fontSize: 
                                17),
                                
                            suffixIcon: _username.text.isNotEmpty?
                             IconButton(
                              icon: Icon(Icons.close),
                              onPressed: (){
                                _username.clear();
                              },
                              
                              ):Container(width: 0,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  // color: Colors.blue
                                  ),
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
                      height: height * 0.02,
                    ),
                    Container(
                      width: width * 0.8,
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: TextField(
                        controller: _password,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                           
                          decoration: InputDecoration(
                            hintText: "???????? ????????????",
                            hintStyle: GoogleFonts.amiri(
                                fontWeight: FontWeight.bold, letterSpacing: 1.8,
                                fontSize: 18),
                            suffixIcon:IconButton(icon: isvisible?
                               Icon(Icons.visibility_off)
                              :Icon(Icons.visibility),
                              onPressed: (){
                                setState(() {
                                  isvisible= !isvisible;
                                });
                              },
                             
                              
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  // color: Colors.blue
                                  ),
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
                          ),
                          obscureText: isvisible,
                          ),
                          
                    ),
                       SizedBox(
                      height: height * 0.06,
                    ),
                     InkWell(
                       
                      onTap:() async {
                        int responce = await checkUser(_username.text,_password.text);
                        if (responce == 2) {
                          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          HeadOfDepMain(
                                        idDep:idDep,
                                        instName :instName,
                                        depName :depName,
                                      ),
                                    ),
                                  ); 
                        }
                        else if (responce == 0){
                          Dialog alert = showAlert(context,'?????? ???????????????? ???? ???????? ???????????? ?????? ????????',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );}

                       else  if (responce == -2){
                         Dialog alert = showAlert(context,'???? ?????? ???????????? ?????? ???????????????? ?????????? ????????????',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                     
                          }

                        else if (responce == -3){
                          Dialog alert = showAlert(context,'???? ?????? ???????????? ?????? ????????????????',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                     }

                        else if (responce == -4){
                          Dialog alert = showAlert(context,'???? ?????? ???????????? ???????? ????????????',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                     }
                     else if (responce == 1){ // ???????? ???????????? 
                      //  Navigator.pushReplacementNamed(context, '/HeadOfDepMain',
                      //   arguments: {
                      //     'idInstrctor': state,
                      //     'type':type}); 
                     }

                      else if (responce == 3){ // ??????????  
                      // DoctorMain
                      Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           DoctorMain(
                                             idDep:idDep,
                                        instName :instName,
                                        depName :depName,
                                          

                                        ),
                                      ),
                                    );
                       
                     }
                           
                          
                          
                       

                        },
                      child:Center(
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
                          "?????????? ????????",
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
                    SizedBox(
                      height: height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ForgetPassword');
                        
                    
                      },
                      child: Text(
                        "???? ???????? ???????? ??????????????",
                        style: GoogleFonts.amiri(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1.7),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),


                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    
  }

    
    
}

 