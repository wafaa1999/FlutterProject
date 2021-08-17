import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/screens/HeadOfDepMain.dart';
import 'package:graduationproject/screens/Login.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/screens/showIns.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/screens/showtables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppDrawer extends StatefulWidget {
  // AppDrawer(String idDep);
 final String idDep;
 final String depName;
 final String instName;
    const AppDrawer({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
 

  @override
  _AppDrawerState createState() => _AppDrawerState();
}
// Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute<void>(
//                                       builder: (BuildContext context) =>
//                                          AddNewMat(
                                        
//                                       ),
//                                     ),
//                                   ); 

class _AppDrawerState extends State<AppDrawer> {
    final notifications = FlutterLocalNotificationsPlugin();

    List<String> roomsnames=[];
     List<String> roomstype=[];
     List<String> roomscamp=[];
     List<String> tablenames = [];
     List<String> status = [];
     List<String> year=[];
     List<String> roomsnum=[];
     List<String> instNames = []; 
     List<String> sem = [];
         Future getInst() async {

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getAllIsn?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       instNames.add(decoded['response'][i]['name']);  
      


       }
      
       }
   print(instNames);
 
    return 1 ;

    

      }
 
      Future getroomsall() async {

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getRoomsofDep?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       roomsnames.add(decoded['response'][i]['number']);  
       roomstype.add(decoded['response'][i]['type']);
       roomscamp.add(decoded['response'][i]['campous']);
       roomsnum.add(decoded['response'][i]['name']);


       }
      
       }
   print(roomsnames);
   print(roomstype);
   print(roomscamp);
   print(roomsnum);
    return 1 ;

    

      }

    Future getalltables() async {


    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getTables?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       tablenames.add(decoded['response'][i]['name']);  
       status.add(decoded['response'][i]['status']);
       year.add(decoded['response'][i]['year']);
       sem.add(decoded['response'][i]['semster']);

      
       }
     print(tablenames);
     print(status);
        
       }
    return 1 ;

    

      }
    
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
                  Text("رئيس القسم : "+widget.instName+" ",style: GoogleFonts.amiri(
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
                                         HeadOfDepMain(
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
                           instNames.clear();
                           int response = await getInst();
                           if(response ==1){
                                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowInst(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        instNames: instNames
                                        
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
             Text("المدرسين",style: GoogleFonts.amiri(
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
                           roomsnames.clear();
                           roomscamp.clear();
                           roomstype.clear();
                           int responce = await getroomsall();
                           if(responce == 1){
                           

                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowRoom(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        roomsnames:roomsnames,
                                        roomscamp:roomscamp,
                                        roomstype:roomstype,
                                        roomnum: roomsnum,
                                        
                                      ),
                                    ),
                                  ); 
                           }
                         },           child: ListTile(
                              
            title: Container(
              height: height * 0.04,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:[ 
             Text("القاعات",style: GoogleFonts.amiri(
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
                           tablenames.clear();
                           status.clear();
                           year.clear();
                             int responce = await getalltables();
                           if(responce == 1){
                           

                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AllTableshow(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        tablenames:tablenames,
                                        status:status,
                                        year:year,
                                        semster: sem, 
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
                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         PlanOfMaterials(
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
             Text("المساقات",style: GoogleFonts.amiri(
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