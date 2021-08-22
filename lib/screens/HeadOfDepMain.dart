import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/screens/showIns.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/screens/showtables.dart';
import 'package:graduationproject/screens/times.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:graduationproject/widgets/Gridwidget.dart';
// import 'package:graduationproject/widgets/headOfInsHome.dart';
import 'dart:math';
import 'package:graduationproject/widgets/Gridwidget.dart';
import 'package:graduationproject/screens/chatPage.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/search.dart';
import 'package:graduationproject/widgets/tnoti.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class HeadOfDepMain extends StatefulWidget {
  final String idDep;
  final String depName;
  final String instName;
  const HeadOfDepMain({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
   

  @override
  _HeadOfDepMainState createState() => _HeadOfDepMainState();
}

class _HeadOfDepMainState extends State<HeadOfDepMain> {
      List<String> roomsnames=[];
     List<String> roomstype=[];
     List<String> roomscamp=[];
    //  List<Room> roomm = [];
     List<String> tablenames = [];
     List<String> status = [];
     List<String> year=[];
     List<String> roomsnum=[];
     List<String> instNames = [];
     List<Inst> insts =[];
     List<Inst> insts1 =[];
     bool wafaa1 = true;
     String idHead = "";
     bool wafaa2 = true;
     List<NotificationMessage> noti = [];
     bool wafaa = false ;
       final notifications = FlutterLocalNotificationsPlugin();
       List<String> semester=[];
         List<String> start=[];
   List<String> end=[];
   List<String> breakFlag=[]; // في بريك  بفصل ع الباك سلاش
   List<String> breakTimeStart=[];
    List<String> breakTimeEnd=[];
   List<String> duration=[];
   List<String> groupC=[];
   List<String>flahAllDay=[];
   List<String> startL=[];
   List<String> endL=[];
   List<String>flahAllDayL=[];
   Timer timer;

 
 
 
  @override
  void initState() { 
    super.initState();
    getNotification();
     final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(body));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
        

 timer = Timer.periodic(Duration(seconds: 150), (Timer t) =>getNotification());
    getUser();
    
  
    print("mainpage");
    print(widget.idDep);
    print(widget.depName);
    print(widget.instName);
    


    
  }

  @override
void dispose() {
  timer?.cancel();
  super.dispose();
}
    Future onSelectNotification(String contant)async{
      print(" contant is $contant");
      int index1 = 0;
      for(int i =0; i <noti.length;i++){
        if (noti[i].note == contant){
          index1 =i;
          break;
        }
      }
      print(noti[index1].from);
       if(noti[index1].from == 'head'){   
         int responce = await getTimes(noti[index1].hour);
                           if(responce == 1){
                            Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         TimesOfSemester(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,

                                        start: start,
                                        end: end,
                                        breakFlag:breakFlag ,
                                        breakTimeStart:breakTimeStart,
                                        breakTimeEnd: breakTimeEnd,
                                        duration: duration,
                                        flahAllDay:flahAllDay,
                                        groupC:groupC,
                                        startL: startL,
                                        endL: endL,
                                        flahAllDayL:flahAllDayL

                                      ),
                                    ),
                                  );
                           }

                         


         }
          //  if(noti[index1].from == 'sch'){ 
          //                    tablenames.clear();
          //                  status.clear();
          //                  year.clear();
          //                    int responce = await getalltables();
                             
          //                  if(responce == 1){
          //                   //  getNotification();
                           

          //                   Navigator.push(
          //                           context,
          //                           MaterialPageRoute<void>(
          //                             builder: (BuildContext context) =>
          //                                AllTableshow(
          //                               idDep:widget.idDep,
          //                               instName: widget.instName,
          //                               depName: widget.depName,
          //                               tablenames:tablenames,
          //                               status:status,
          //                               year:year ,
          //                               semster:semester
          //                             ),
          //                           ),
          //                         ); 
 
          //                  }
          //                  }
                           
        


    }
 
  // updateNoti
  Future updateNoti(String note) async {
  
    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/editNotification?instName=${widget.instName}&note=${note}";
    print(apiUrl);
    

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
    print("notification");
  List<NotificationMessage> noti1 = [];
  noti.clear();
  noti1.clear();
    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getNotification?instName=${widget.instName}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
      //  if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['type'] != 'head of department')
       noti1.add(NotificationMessage(decoded['response'][i]['note'],decoded['response'][i]['flag'],decoded['response'][i]['from'],decoded['response'][i]['date'],i));  
           if (decoded['response'][i]['flag'] == 'true'){
             showSilentNotification(notifications,
                  title: 'تنبيه', body: decoded['response'][i]['note'], id: i);
           setState(() {
              wafaa = true;
           });
            
           }
           else{
             setState(() {
                wafaa = false;
             });
           }
       }
      

      print(wafaa);
      int k =0;
      for (int j = (noti1.length) -1 ; j>= 0 ;j--){
        noti.add(noti1[j]);
        k++;
      }
      print(noti);
      
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
       if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['type'] != 'head of department')
       insts.add(Inst(decoded['response'][i]['name'],decoded['response'][i]['gender'],decoded['response'][i]['id'],decoded['response'][i]['type']));
     
       if (decoded['response'][i]['idDep'] != widget.idDep && decoded['response'][i]['type'] == 'head of department')
       insts.add(Inst(decoded['response'][i]['name'],decoded['response'][i]['gender'],decoded['response'][i]['id'],decoded['response'][i]['type']));
       
       if (decoded['response'][i]['idDep'] == widget.idDep && decoded['response'][i]['type'] == 'head of department') 
       idHead = decoded['response'][i]['id'];


       }
      
      
       }
      
       insts1 = insts;
   print(insts);
   setState(() {
     wafaa1 =!wafaa1;
   });
 
    return 1 ;

    

      }
 

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
        roomsnames.clear();
        roomstype.clear();

        roomscamp.clear();
        roomsnum.clear();

        

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
       semester.add(decoded['response'][i]['semester']);
      //  semester

      
       }
     print(tablenames);
     print(status);
        
       }
    return 1 ;

    

      }
    
            // bool wafaa = true;
    Future getTimes(String date) async {
      
    
   start.clear();
   end.clear();
   breakFlag.clear();
   breakTimeStart.clear();
   breakTimeEnd.clear();
   duration.clear();
   groupC.clear();
   flahAllDay.clear();
   startL.clear();
   endL.clear();
   flahAllDayL.clear();
 



    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getTimesForHeadOfDep?date=$date";
    final response =
        await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);
        List<String> courseTime = decoded['response'][0]['courseTimes'].split('*');
        
        for(int i =0 ;i< courseTime.length ; i++){
          List<String> course = courseTime[i].split(',');
          start.add(course[0].split('/')[0]);
          end.add(course[0].split('/')[1]);
          breakFlag.add(course[1]);
          breakTimeStart.add(course[2].split('/')[0]);
          breakTimeEnd.add(course[2].split('/')[1]);
          duration.add(course[3]);
          switch (course[4]) {
            case '1':
            groupC.add('الأولى');
              
              break;
             case '2':
            groupC.add('الثانية');
              
              break; 
            case '3':
            groupC.add('الثالثة');
              
              break;
             case '4':
            groupC.add('الرابعة');
              
            break; 
            case '5':
            groupC.add('الخامسة');
              
              break;
          }
          flahAllDay.add(course[5]);


        }
      List<String> labTime = decoded['response'][0]['labsTimes'].split('*');
      for(int i =0 ;i< labTime.length ; i++){
          List<String> labs = labTime[i].split(',');
          startL.add(labs[0].split('/')[0]);
          endL.add(labs[0].split('/')[1]);
          flahAllDayL.add(labs[1]);}
     

     
        
       }
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
             drawer: AppDrawer(
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
                  Tab(icon:Icon(Icons.message),text:"الرسائل"),
                  Tab(icon:Icon(Icons.notifications),text:"الاشعارات"),
                  


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
                buildChat(context),
                buildNotification(context),
               


              ],
            ),
          ),
        ),
          
         wafaa? Padding(
            padding: const EdgeInsets.fromLTRB(0, 88, 315, 0),
            
            child: CircleAvatar(
                  backgroundColor:Colors.red[900],
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

                        onTap:(){
                          // getNotification();
                             

                          Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         PlanOfMaterials(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        
                                      ),
                                    ),
                                  ); 

                        } ,
                         child: Gridwidget(svgScr:"assets/images/books.svg",
                        title:"المساقات"),
                      ),
                      
                       InkWell(
                         onTap: ()async{
                           tablenames.clear();
                           status.clear();
                           year.clear();
                             int responce = await getalltables();
                             
                           if(responce == 1){
                            //  getNotification();
                           

                            Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AllTableshow(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        tablenames:tablenames,
                                        status:status,
                                        year:year ,
                                        semster:semester
                                      ),
                                    ),
                                  ); 
 
                           }
                         },
                           


                         
                         child: Gridwidget(svgScr:"assets/images/timetable.svg",
                      title:"الجدول الدراسي"),
                       ),

                       InkWell(
                         onTap: ()async{
                           int responce = await getroomsall();
                           if(responce == 1){
                            //  getNotification();
                           

                            Navigator.push(
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
                         },
                      child: Gridwidget(svgScr:"assets/images/room.svg",
                      title:"القاعات"),
                       ),

                       InkWell(
                         onTap: ()async{
                           
                           instNames.clear();
                           int response = await getInst();
                           if(response ==1){
                            //  getNotification();
                                 Navigator.push(
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
                       child: Gridwidget(svgScr:"assets/images/teacher.svg",
                      title:"المدرسين"),
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
        [  if (wafaa1)
           buildSearch(),
           if (wafaa1)
           buildbuildInstOfDep(context),
            
           if (!wafaa1)
           buildSearch(),
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


  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'ادخل اسم المدرس',
        onChanged: searchInst,
      );

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
               onTap: ()async{
                 print(user.from);

         if(user.from == 'head'){   
         int responce = await getTimes(user.hour);
                           if(responce == 1){
                            Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         TimesOfSemester(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,

                                        start: start,
                                        end: end,
                                        breakFlag:breakFlag ,
                                        breakTimeStart:breakTimeStart,
                                        breakTimeEnd: breakTimeEnd,
                                        duration: duration,
                                        flahAllDay:flahAllDay,
                                        groupC:groupC,
                                        startL: startL,
                                        endL: endL,
                                        flahAllDayL:flahAllDayL

                                      ),
                                    ),
                                  );
                           }

                         


         }
           if(user.from == 'sch'){ 
                             tablenames.clear();
                           status.clear();
                           year.clear();
                             int responce = await getalltables();
                             
                           if(responce == 1){
                            //  getNotification();
                           

                            Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AllTableshow(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        tablenames:tablenames,
                                        status:status,
                                        year:year ,
                                        semster:semester
                                      ),
                                    ),
                                  ); 
 
                           }
                           }
                           




setState(() {
                    
                        user.flag = 'false';
                    
                    updateNoti(user.note);
                    wafaa = false;
                 });
               },
                              child: ListTile(

                                // tileColor: user.flag == 'true' ?Colors.grey[300]:Colors.white,
                
                
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:AssetImage('assets/images/not.jfif' ),
                  ),
                  title: Column(
                                        children:[Text(user.note ,style: GoogleFonts.amiri(
                                                      fontSize: 16,
                                                      color:Colors.black,
                                                        
                                                      // fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.7,
                                                    //  / height: 1.32,
                                                      ),),
                //                                     user.flag =='true'?Padding(
                //                                       padding: const EdgeInsets.fromLTRB(0, 0, 160, 2),
                //                                       child:  InkWell(child: Icon(Icons.done),

                //                                       onTap: (){
                //                                         setState(() {
                    
                //         user.flag = 'false';
                    
                //     updateNoti(user.note);
                //     wafaa = false;
                //  });
                
                                         
                 

                //                                       },
                //                                      ),
                                                      
                 
                // ):SizedBox(height: 0,),
                                                   
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
                    print(idHead);
                    print(user.id);

                  Navigator.push(
                    
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         Chatpage(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        instId:user.id,
                                        headId:idHead,
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
  
  
  void searchInst(String query) {
    insts = insts1;
    final searchedInst = insts.where((inst) {
      final name = inst.name;
      final searchLower = query;

      return name.contains(searchLower);
    }).toList();
      setState(() {
      this.query = query;
      this.insts = searchedInst; 
    });

  
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
  final int id;
  final String note;
  String flag;
  final String from;
  final String hour;


  NotificationMessage(this.note, this.flag, this.from, this.hour, this.id);


  
}

