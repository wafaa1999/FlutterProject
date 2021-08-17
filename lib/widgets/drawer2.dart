import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:graduationproject/screens/Login.dart';

import 'package:graduationproject/teacher/DoctorMain.dart';
import 'package:graduationproject/teacher/softCon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppDrawer2 extends StatefulWidget {
  // AppDrawer(String idDep);
 final String idDep;
 final String depName;
 final String instName;
    const AppDrawer2({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
 

  @override
  _AppDrawer2State createState() => _AppDrawer2State();
}
 

class _AppDrawer2State extends State<AppDrawer2> {
    final notifications = FlutterLocalNotificationsPlugin();

 


    @override
    void initState() { 
      super.initState();
      final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
    }

     Future onSelectNotification(String payload){

     }
        List<String> notes = [];
    List<String> status = [];
    List<String> fromTime1 = [];
    List<String> toTime1 = [];
    List<String> days1 = [];


  Future getalldata4() async {
    notes.clear();
  
    status.clear();
    fromTime1.clear();
    toTime1.clear();
    days1.clear();
    String id = '60ddc9735b4d43f8eaaabf83';

    String apiUrl = "https://core-graduation.herokuapp.com/getSoftConst?idDep=${widget.idDep}";
 final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
          if(decoded['response'][i]['insName'] == widget.instName){
            status.add(decoded['response'][i]['need']); 
            notes.add(decoded['response'][i]['note']);
      List<String> time = [] ;
      String one = decoded['response'][i]['time'];
      print(one);
      time = one.split('/');
      toTime1.add(time[1]);
      fromTime1.add(time[0]);
      days1.add(time[2]);

     
       }
     }
  //  print(inst1);
   print(status);
   print(notes);
}
    return 1 ;

    

      }
 
    

 
  @override

  Widget build(BuildContext context) {
        var height = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: <Widget>[
           DrawerHeader(
              decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.white,width: 2),
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(55, 71, 79, 1),
                               Color.fromRGBO(55, 71, 79, 1)] ),
                            //  borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.grey[200],
                                  offset: Offset(2, 2))
                            ],
                            ),
             
              child:  Container(
              
                
                
                child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  
                  Text(" قسم "+widget.depName+" ",style: GoogleFonts.amiri(
                              fontSize: 20,
                              color:  Color.fromRGBO(212, 172, 13,1,),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7),
                          textAlign: TextAlign.center, ),
                  // SizedBox(height: height * 0.01,),
                  Divider(height: height*0.02,thickness: 2,),
                  Text("المدرس: "+widget.instName+" ",style: GoogleFonts.amiri(
                              fontSize: 20,
                              color:  Color.fromRGBO(212, 172, 13,1,),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7),
                          textAlign: TextAlign.center,),


                ],
              )),
          ),
             InkWell(

               onTap:() =>{
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         DoctorMain(
                                        idDep:widget.idDep ,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        
                                      ),
                                    ),
                                  ) 

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("الصفحة الرئيسية",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
           InkWell(

                onTap: ()async{
                  int res = await getalldata4();
                          if(res == 1) {

                          Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowSoftCon(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                    

                                        status:status,
                                        
                                        days:days1,
                                        fromTime:fromTime1,
                                        toTime:toTime1,
                                       
                                        notes: notes,
                                        
                                      ),
                                    ),
                                  ); 
                          
                          }
                         },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("الملاحظات",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
                InkWell(

                onTap: ()async{
                          
                         
                         },           child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("الجدول الدراسي",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
            
                InkWell(

               onTap:() =>{
                  // notifications.cancelAll,
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         Login(
                                      
                                      ),
                                    ),
                                  )

               },
                            child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("تسجيل الخروج",style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Color.fromRGBO(33, 84, 84, 1),
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1.7), ),
            
            Icon(Icons.arrow_right,color:  Color.fromRGBO(33, 84, 84, 1),size: 30,),
          
            ])),
            
          ),
             ),
             
             

        ],
      ),
    );
  }
} 