import 'package:flutter/material.dart';
import 'package:graduationproject/screens/AddNewMaterial.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/screens/showIns.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/screens/showtables.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:graduationproject/widgets/Gridwidget.dart';
// import 'package:graduationproject/widgets/headOfInsHome.dart';
import 'dart:math';
import 'package:graduationproject/widgets/Gridwidget.dart';
import 'package:graduationproject/widgets/drawer1.dart';
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
     List<Room> roomm = [];
     List<String> tablenames = [];
     List<String> status = [];
     List<String> year=[];
     List<String> roomsnum=[];
     List<String> instNames = [];

 
 
 
  @override
  void initState() { 
    super.initState();
    // getroomsall();
    print("mainpage");
    print(widget.idDep);
    print(widget.depName);
    print(widget.instName);
    


    
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

      
       }
     print(tablenames);
     print(status);
        
       }
    return 1 ;

    

      }
    
    


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              buildPage('notifcation Page'),
              buildPage('chat Page'),


            ],
          ),
        ),
      );





    
  }
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
                                        year:year 
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
                           roomsnames.clear();
                           roomscamp.clear();
                           roomstype.clear();
                           int responce = await getroomsall();
                           if(responce == 1){
                           

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


  

}


class Room{
  final String number;
  final String type;
  final String camp;

  const Room(this.number, this.type, this.camp);

  Room copy1(
    String type,
 
  ) =>
      Room(
        this.number,
        type,
        this.camp,
      );


      Room copy2(
    String camp,
 
  ) =>
      Room(
        this.number,
        this.type,
        camp,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Room &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          type == other.type &&
          camp == other.camp;

  @override
  int get hashCode => number.hashCode ^ type.hashCode ^ camp.hashCode;
}

