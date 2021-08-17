

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/teacher/chat2.dart';
import 'package:graduationproject/teacher/finalTableD.dart';
import 'package:graduationproject/teacher/softCon.dart';
import 'package:graduationproject/widgets/Gridwidget.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer2.dart';
import 'package:graduationproject/widgets/tnoti.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DoctorMain extends StatefulWidget {
  final String idDep;
  final String depName;
  final String instName;
  const DoctorMain({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
   

  @override
  _DoctorMainState createState() => _DoctorMainState();
}

class _DoctorMainState extends State<DoctorMain> {
     bool wafaa1 = true;
     bool wafaa2 = true;
     List<NotificationMessage> noti = [];
     bool wafaa = false ;
     final notifications = FlutterLocalNotificationsPlugin();
     List<Inst> insts= [];
    String doctorId ="";

 
 
 
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
        getNotification();


    getUser();
    
  }
    List<String> notes = [];
    List<String> status = [];
    List<String> fromTime1 = [];
    List<String> toTime1 = [];
    List<String> days1 = [];

  List<String> courseNamesd = [] ;
  List<String> courseNumbersd = [] ;
  List<String> daysd = [] ;
  List<String> toTimed = [] ;
  List<String> fromTimed = [] ;
  List<String> roomd = [] ;

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
 
    

    Future onSelectNotification(String payload){}
 
  // updateNoti
  Future updateNoti(String note) async {
  
    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/editNotification?instName=${widget.instName}&note=${note}";
    print(apiUrl);
    

https://core-graduation.herokuapp.com/editNotification?idDep=60ddc9735b4d43f8eaaabf83&instName=علاء الدين المصري&note= الاول يرجى البدء باعداد الجدول الدراسي للفصل الدراسي بالاطلاع على المواعيد الدراسية للفصل
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'].length);

    
      print(noti);
      
       }
       
  
   setState(() {
     wafaa2 =!wafaa2;
   });
 
    return 1 ;

    

      }
 

  Future getNotification() async {
  List<NotificationMessage> noti1 = [];
  noti.clear();
  noti1.clear();
    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getNotification?instName=${widget.instName}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
      //  if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['type'] != 'head of department')
       noti1.add(NotificationMessage(decoded['response'][i]['note'],decoded['response'][i]['flag'],decoded['response'][i]['from'],decoded['response'][i]['hour']));  
           if (decoded['response'][i]['flag'] == 'true'){
             showSilentNotification(notifications,
                  title: 'تنبيه', body: decoded['response'][i]['note'], id: i);
           
             setState(() {
               wafaa = true;
             });
           }
           else {
             setState(() {
               wafaa = false;
             });
           }
       }
      

      print(wafaa);
      // int k =0;
      for (int j = (noti1.length) -1 ; j>= 0 ;j--){
        noti.add(noti1[j]);
        // k++;
      }
      print("notes = ${noti}");
      
       }
       
  
   setState(() {
  
     wafaa1 =!wafaa1;
   });
 
    return 1 ;

    

      }
 
  
     Future getUser() async {

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getUsers?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['type'] == 'head of department')
       insts.add(Inst(decoded['response'][i]['name'],decoded['response'][i]['gender'],decoded['response'][i]['id'],decoded['response'][i]['type']));
       if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['name'] == widget.instName)
           doctorId = decoded['response'][i]['id'];
     
       
      


       }
      
      
       }
      
     
   print(insts);
   setState(() {
     wafaa1 =!wafaa1;
   });
 
    return 1 ;

    

      }
 

 

  @override
  Widget build(BuildContext context) {
    return Stack(
         overflow: Overflow.visible,
        // alignment: Alignment.topCenter,
          children:[ 
            
             
              
              
             
           
            
            
     DefaultTabController(
          length:3,
                child: Scaffold(
                  
            //  endDrawer: new AppDrawer(), // right side
          drawer: AppDrawer2(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            //  widget.idDep

            appBar:AppBar(
              // backgroundColor: Color(0xFFF5CEB8),
              
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[Color.fromRGBO(64, 128, 128, 1),Color.fromRGBO(64, 128, 128, 1),],
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft
                  ),

                ),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(icon:Icon(Icons.home),text:"الصفحة الرئيسية",),
                  Tab(icon:Icon(Icons.notifications),text:"الاشعارات"),
                  Tab(icon:Icon(Icons.message),text:"الرسائل"),


                ],
              ),
              elevation: 0,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed:() {
           
            //   },
            // ),
            
  
            ),
            

            body: 
                 TabBarView(
              
              children: [
                buildHomePage(context),
               buildNotification(context),
               buildChat(context),


              ],
            ),
          ),
        ),
          
         wafaa? Padding(
            padding: const EdgeInsets.fromLTRB(0, 88, 183, 0),
            
            child: CircleAvatar(
                  backgroundColor:Colors.redAccent,
                  radius: 5,
              
                        // Text("1",style: GoogleFonts.amiri(fontSize: 10))
                ),
          ):
          SizedBox(height: 0,),
         
          
          ]
    );





    
  }
 
  String query = '';
  bool wafaa11=true;
  Widget buildPage(String text){
    
    return Center(
   
    child: Text(text),
  );
  }
  
  Widget buildHomePage(BuildContext context) {
     

      var size = MediaQuery.of(context).size;
      return Scaffold(
        body: Stack(
          
          children:<Widget> [

            Container(
              height: size.height * 0.15,

              // width: MediaQuery.of(context).size.width,

              decoration:BoxDecoration(
                
                // color: Color(0xFFF5CEB8),
               

              ) ,
            ),
            SafeArea(
              child:Padding(
             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
             child:Column(
              children:<Widget> [
               
            
                SizedBox(height:size.height *0.09,),
              
                
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      InkWell(

                        onTap:()async{
                          getNotification();
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
                        } ,
                         child: Gridwidget(svgScr:"assets/images/doc.svg",
                        title:" ملاحظات "),
                      ),
                      
                       InkWell(
                         onTap: ()async{
                        int inm = await getFinalDataTable();
         if(inm == 1){
             Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowFinalTableD(

                                        idDep:widget.idDep,
                                        instName:widget.instName,
                                        depName:widget.depName,
                          
                                        courseNumbers :courseNumbersd,
                                        courseNames :courseNamesd,
                                        room:roomd,
                                        fromTime:fromTimed,
                                        toTime:toTimed,
                                        days:daysd,
                                        
      
                                      ),
                                    ),
             );
         
         }else {  
          Dialog alert = showAlert(context,'لم يتم انشاء الجدول الرجاء الانتظار',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
         }

                         },
                           


                         
                         child: Gridwidget(svgScr:"assets/images/timetable.svg",
                      title:"الجدول الدراسي"),
                       ),

                   



                    ],
                   
                  
                  ),
                )

              ],

            ),
              ),
            ),


           ],

        ),
      );
      

    
  }
 
 Widget buildChat(BuildContext context) {
   return  Scaffold(
     body:Column(
       children:
        [ 
           if (wafaa1)
           buildbuildInstOfDep(context),
            
           
           if (!wafaa1)
           buildbuildInstOfDep(context)]),
        

      );
 }
int index =0;
Widget buildNotification(BuildContext context) {
  
   return  Scaffold(
     body:Column(
       children:
        [  
           if (wafaa2)
           buildbuildNotOfDep(context),
            
          
           if (!wafaa2)
           buildbuildNotOfDep(context)]),
        

      );
 }


 

   Widget buildbuildNotOfDep(BuildContext context) {
 return Expanded(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildNotti(),
        ),
      );
 }
  Widget buildNotti() { 
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = noti[index];

          return Column(
                      children: [Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          color: user.flag == 'true' ?Colors.grey[300]:Colors.grey[270],

               constraints: BoxConstraints(maxHeight:110),
              child: InkWell( 
               
                              child: ListTile(

                                // tileColor: user.flag == 'true' ?Colors.grey[300]:Colors.white,
                
                
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:user.from == 'head'?  AssetImage('assets/images/not.jfif' ):
                     AssetImage('assets/images/app.jpg' ),
                  ),
                  title: Column(
                                        children:[Text(user.note ,style: GoogleFonts.amiri(
                                                      fontSize: 16,
                                                      color:Colors.black,
                                                        
                                                      // fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.7,
                                                    //  / height: 1.32,
                                                      ),),
                                                    user.flag =='true'?Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 160, 2),
                                                      child:  InkWell(child: Icon(Icons.done),

                                                      onTap: (){
                                                        setState(() {
                    
                        user.flag = 'false';
                    
                    updateNoti(user.note);
                    wafaa = false;
                 });
                
                                         
                 

                                                      },
                                                     ),
                                                      
                 
                ):SizedBox(height: 0,),
                                                   
                                        ]),
                ),
              ),
              
            ),
                      ),
                    // Divider(thickness: 1,), 
                     ]);
        },
        itemCount: noti.length,
      );
  }
  
  


 Widget buildbuildInstOfDep(BuildContext context) {
 return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );
 }

  Widget buildChats() { 
   
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final user = insts[index];
    
              return Column(
                          children: [Container(
                  height: 75,
                  child: InkWell(
                   
                                child: ListTile(
                      onTap: () {
                      
                        print(user.id);
    
                      Navigator.push(
                        
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                             Chatpage2(
                                            idDep:widget.idDep,
                                            instName: widget.instName,
                                            depName: widget.depName,
                                            instId:doctorId,
                                            headId:user.id,
                                            gender:user.gender,
                                            doctorN:user.name
                                            
                                            
                                          ),
                                        ),
                                      ); 
                        
    
                      },
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundImage: user.gender == 'ذكر'?AssetImage('assets/images/1.jpg'):
                        AssetImage('assets/images/2.jpg'),
                      ),
                      title: Text(user.name ,style: GoogleFonts.amiri(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                      
                                                    // fontWeight: FontWeight.bold,
                                                    letterSpacing: 1.7,
                                                  //  / height: 1.32,
                                                    ),),
                    ),
                  ),
                  
                ),
                        Divider(thickness: 1,),  ]);
            },
            itemCount: insts.length,
      );
  }
  
Future getFinalDataTable()async{

  
  courseNamesd.clear();
  courseNumbersd.clear();
  daysd.clear();
  toTimed.clear();
  fromTimed.clear();
  roomd.clear();





   String apiUrl = "https://core-graduation.herokuapp.com/getDataFromApprovalOfDep?idDep=${widget.idDep}";
   print(apiUrl);
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print(decoded);
      for(int i =0; i<decoded['response'].length; i++){
        if(decoded['response'][i]['instName'] == widget.instName){
            courseNamesd.add(decoded['response'][i]['courseName']); 
            courseNumbersd.add(decoded['response'][i]['courseNumber']); 
            daysd.add(decoded['response'][i]['days']); 
            toTimed.add(decoded['response'][i]['endHour']); 
            fromTimed.add(decoded['response'][i]['startHour']); 
            roomd.add(decoded['response'][i]['roomNumber']); 
           

      }}
   
    
    }
    if( roomd.length == 0){
      return -1;
    }
    return 1;
}


   
}


// 

class Inst{
  // final String id;
  final String name;
  final String gender;
  final String id;
  final String type;



  Inst( this.name, this.gender, this.id, this.type);



}

class NotificationMessage{
  final String note;
  String flag;
  final String from;
  final String hour;


  NotificationMessage(this.note, this.flag, this.from, this.hour);


  
}

