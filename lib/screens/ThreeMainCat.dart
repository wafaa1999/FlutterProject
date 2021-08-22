
import 'dart:io';
import 'package:graduationproject/screens/MatForOtherDep.dart';
import 'package:graduationproject/screens/MatOfOtherDep.dart';
import 'package:graduationproject/screens/instSoftConst.dart';
import 'package:graduationproject/screens/showtables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/Login.dart';
import 'package:graduationproject/screens/MatOfDep.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/onHaver.dart';

class Showcat extends StatefulWidget {

final String idDep;
final String tableName;
final String depName;
final String instName;
final String year;
final String sem;

  const Showcat({Key key, this.idDep, this.tableName, this.depName, this.instName, this.year, this.sem}) : super(key: key);

  @override
  _ShowcatState createState() => _ShowcatState();
}

class _ShowcatState extends State<Showcat> {
  @override
  void initState() { 
    super.initState();
    getdep();
  }
  String ip ="http://192.168.1.7:3000/";
  String tableName;
  bool show = false;
  int _value = 0;
  bool start = false;
  List<String> room1 =[];
  List<String> inst1 =[];
  List<String> course1 =[];
  List<String> years = [];
  List<String> course2 = [];
  List<String> days1 = [];
  List<String> fromTime1 =[];
  List<String> toTime1 = [];
  List<String> depNames = [];
  List<String> depsId = [];
  List<String> dep =[];
  List<String> status = [];
  List<String> notes = [];
    List<String> tableNames = [];
    List<String> sems = [];
    bool back= false;


  Future getdep() async {

    String id = '60ddc9735b4d43f8eaaabf83';
    String apiUrl = "https://core-graduation.herokuapp.com/getAllDep";
    final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       depsId.add(decoded['response'][i]['idDepartment']); 
       depNames.add(decoded['response'][i]['name']); 
       

      
}
   print(depsId);
   print(depNames);
  
        
       
    }
    return 1;

   }

  Future getalldata() async {
    room1.clear();
    inst1.clear();
    course1.clear();
    String id = '60ddc9735b4d43f8eaaabf83';

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tableName}";
 final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       if(decoded['response'][i]['fromOtherDep']== 'false' && decoded['response'][i]['toOtherDep']== 'false' ){
            room1.add(decoded['response'][i]['roomType']); 
            inst1.add(decoded['response'][i]['courseIns']); 
            course1.add(decoded['response'][i]['courseName']);

       }
       }
   print(room1);
   print(inst1);
   print(course1);
}
    return 1 ;

    

      }

  Future getalldata2() async {
    String id = '60ddc9735b4d43f8eaaabf83';
    years.clear();
    course2.clear();
    fromTime1.clear();
    toTime1.clear();
    days1.clear();
    dep.clear();

    List<String> arr =[];
    String time = "";

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tableName}";
    print(apiUrl);
 final response =
        await http.get(Uri.parse(apiUrl));
        print(response.statusCode);
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
      if(decoded['response'][i]['fromOtherDep']== 'true' && decoded['response'][i]['toOtherDep']== 'false' ){

      
       years.add(decoded['response'][i]['year']); 
       course2.add(decoded['response'][i]['courseName']); 
       time = decoded['response'][i]['timeSolt'];
       print(time);
     
         arr = time.split('/');
         fromTime1.add(arr[0]);
         toTime1.add(arr[1]);
         days1.add(arr[2]);
         print (arr[0]);
        String departid =(decoded['response'][i]['orignaldep']);
        for(int k =0;k<depsId.length;k++){
          if(departid == depsId[k]){
            dep.add(depNames[k]);
            break;
          }
        }

       
      }
       

      
       }
  
        
       
    }

 
    
    return 1 ;

    

      }

  Future getalldata3() async {
   
    String id = '60ddc9735b4d43f8eaaabf83';
    years.clear();
    course2.clear();
    fromTime1.clear();
    toTime1.clear();
    days1.clear();
    dep.clear();
    inst1.clear();
    room1.clear();

    List<String> arr =[];
    String time = "";

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tableName}";
    print(apiUrl);
 final response =
        await http.get(Uri.parse(apiUrl));
        print(response.statusCode);
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
      if(decoded['response'][i]['fromOtherDep']== 'false' && decoded['response'][i]['toOtherDep']== 'true' ){

      
       years.add(decoded['response'][i]['year']); 
       course2.add(decoded['response'][i]['courseName']); 
       time = decoded['response'][i]['timeSolt'];
       inst1.add(decoded['response'][i]['courseIns']);
       room1.add(decoded['response'][i]['roomType']);
       print(time);
     
         arr = time.split('/');
         fromTime1.add(arr[0]);
         toTime1.add(arr[1]);
         days1.add(arr[2]);
         print (arr[0]);     
      }
     }     
    }
    return 1 ;

    

      }
  
  Future getalldata4() async {
    notes.clear();
    inst1.clear();
    status.clear();
    fromTime1.clear();
    toTime1.clear();
    days1.clear();
    String id = '60ddc9735b4d43f8eaaabf83';

    String apiUrl = "https://core-graduation.herokuapp.com/getSoftConst?idDep=${widget.idDep}";
 final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
            inst1.add(decoded['response'][i]['insName']); 
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
   print(inst1);
   print(status);
   print(notes);
}
    return 1 ;

    

      }
  
  Future getalltables() async {
    tableNames.clear();
    status.clear();
    years.clear();

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getTables?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       tableNames.add(decoded['response'][i]['name']);  
       status.add(decoded['response'][i]['status']);
       years.add(decoded['response'][i]['year']);
       sems.add(decoded['response'][i]['semester']);

      
       }
     print(tableNames);
     print(status);
        
       }
    return 1 ;

    

      }
  
  Future runCore() async {
    String flag="";
    if(_value == 1){
      flag = 'false';
    }
    else 
    flag = 'true';


    String apiUrl =ip+"runCore?idDep=${widget.idDep}&tableName=${widget.tableName}&date=${widget.year}&semester=${widget.sem}&softFlag=$flag";
    final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       depsId.add(decoded['response'][i]['idDepartment']); 
       depNames.add(decoded['response'][i]['name']); 
       

      
}
   print(depsId);
   print(depNames);
  
        
       
    }
    return 1;

   }
  
    
  @override
  Widget build(BuildContext context) {
    return Scaffold( drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
            appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[ Text(
                                "${widget.tableName}",
                                style: GoogleFonts.amiri(
                                    fontSize: 20,
                                    color:Colors.white,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,
                              ),
                                
                                  //  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                    IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 25,), onPressed: ()async{
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
                                        tablenames:tableNames,
                                        status:status,
                                        year:years ,
                                        semster: sems,
                                      ),
                                    ),
                                  ); 
                           }

                                  

                                   }),
                                ]

        
                            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color:Color.fromRGBO(64, 128, 128, 1),
                                offset: Offset(1,1))
                          ],
                gradient: LinearGradient(
                  colors:[Color.fromRGBO(64, 128, 128, 1),
                  Color.fromRGBO(64, 128, 128, 1),],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft
                ),

              ),

         
            ),
            
            elevation: 0,
            


          
      ),
        body:   SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height:MediaQuery.of(context).size.height * 0.06 ,
                ),
                InkWell(
                  onTap: (){
                    print("fost");
                  },
                                  child: Center(
                    // child: Padding(
                      // padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: ()async{

                          int res = await getalldata();
                          print(widget.year);
                          if(res == 1)
                          Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable1(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tableName,
                                        year:widget.year,
                                        courses:course1,
                                        rooms:room1,
                                        inst:inst1

                                          

                                        ),
                                      ),
                                    );

                        },
                                              child: Container(
                          decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey[400],width: 3),
                                  gradient: new LinearGradient(
                                      colors: [Colors.white,
                                     Colors.white] ),
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color: Color.fromRGBO(33, 84, 84, 1),
                                        offset: Offset(2, 2))
                                  ],
                                  ),
                          
                        height:MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child:Center(child: OnHoverText(
                                                  child: Text("مواد من القسم ", style: GoogleFonts.amiri(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
                        )),),
                      ),
                    ),
                ),
                // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              
               Center(
                  // child: Padding(
                    // padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: ()async{
                          int res = await getalldata2();
                          if(res == 1)
                          {
                            print(dep);
                            print(course2);
                            print(years);
                            print(days1);
                            print(fromTime1);
                            print(toTime1);
                           

                          Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable2(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tableName,
                                        year:widget.year,
                                        deprtments: dep,
                                        courses:course2,
                                        yearOfStuding:years ,
                                        days:days1,
                                        fromTime:fromTime1,
                                        toTime:toTime1

                                          

                                        ),
                                      ),
                                    );
                          }

                        },
                                          child: Container(
                        decoration: BoxDecoration(
                               border: Border.all(color: Colors.grey[400],width: 3),
                                gradient: new LinearGradient(
                                    colors: [Colors.white,
                                   Colors.white] ),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      color: Color.fromRGBO(33, 84, 84, 1),
                                      offset: Offset(2, 2))
                                ],
                                ),
                        
                      height:MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.65,
                      child:Center(child: Text("مواد من قسم أخر ", style: GoogleFonts.amiri(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7),
                            textAlign: TextAlign.center,)),),
                    ),
                  ),
                // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

               Center(
                  // child: Padding(
                    // padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: ()async{
                      int res = await getalldata3();
                          if(res == 1)
                          {
                            // print(dep);
                            print(course2);
                            print(years);
                            print(days1);
                            print(fromTime1);
                            print(toTime1);
                            print(room1);
                           

                          Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable3(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tableName,
                                        year:widget.year,
                                        // deprtments: dep,

                                        courses:course2,
                                        // yearOfStuding:years ,
                                        days:days1,
                                        fromTime:fromTime1,
                                        toTime:toTime1,
                                        inst:inst1,
                                        room: room1,

                                          

                                        ),
                                      ),
                                    );
                          }

                      },
                                          child: Container(
                        decoration: BoxDecoration(
                               border: Border.all(color: Colors.grey[400],width: 3),
                                gradient: new LinearGradient(
                                    colors: [Colors.white,
                                   Colors.white] ),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      color: Color.fromRGBO(33, 84, 84, 1),
                                      offset: Offset(2, 2))
                                ],
                                ),
                        
                        height:MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.65,
                      child:Center(child: Text("مواد لقسم أخر  ", style: GoogleFonts.amiri(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7),
                            textAlign: TextAlign.center,)),),
                    ),
                  ),
                // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              Center(
                  // child: Padding(
                    // padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: ()async{
                      int res = await getalldata4();
                          if(res == 1)
                          {
                    
                          Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable4(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tableName,
                                        year:widget.year,
                                        // deprtments: dep,

                                        status:status,
                                        // yearOfStuding:years ,
                                        days:days1,
                                        fromTime:fromTime1,
                                        toTime:toTime1,
                                        instNames:inst1,
                                        notes: notes,

                                          

                                        ),
                                      ),
                                    );
                          }

                      },
                                          child: Container(
                        decoration: BoxDecoration(
                               border: Border.all(color: Colors.grey[400],width: 3),
                                gradient: new LinearGradient(
                                    colors: [Colors.white,
                                   Colors.white] ),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      color: Color.fromRGBO(33, 84, 84, 1),
                                      offset: Offset(2, 2))
                                ],
                                ),
                        
                      height:MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.65,
                      child:Center(child: Text("مواعيد المدرسين", style: GoogleFonts.amiri(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7),
                            textAlign: TextAlign.center,)),),
                    ),
                  ),
                // ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
              Center(
                      child: InkWell(
                                              child: Container(
                          
                           
                          width: MediaQuery.of(context).size.width * 0.5,
                          height:  MediaQuery.of(context).size.height * 0.08,
                          
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                              
                          decoration: BoxDecoration(
                            //  border: Border.all(color: Colors.white,width: 2),
                              gradient: new LinearGradient(
                                  colors: [Color.fromRGBO(212, 172, 13,1,),
                                 Color.fromRGBO(212, 172, 13,1,)] ),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.white,
                                    offset: Offset(2, 2))
                              ],
                              ),
                              

                              
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: back == false?Text(start?
                              "ايقاف":"انشاء جدول",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ):
                            Text('رجوع',
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                        ),
                      onTap: ()async{
                        if (back == true){
                          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AllTableshow(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        tablenames:tableNames,
                                        status:status,
                                        year:years ,
                                        semster: sems,
                                      ),
                                    ),
                                  ); 
                          
                        }
                        if(start == false){
                        setState(() {
                          show = !show;
                        });
                        }
                         if(start == true && show == false){

                             int res = await stopCore();
                              Dialog alert = showAlert(context,'يرجى الانتظار بضع دقائق سيتم ارسال اشعار عند الانتهاء',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           start = true;

                            setState(() {
                            back = true;
                            });

                          
                         }
                          

                      },),
                    ),
                    show?
                     Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                          child: Row(children: [

                      
                                  Radio(
                 

                 
                 value: 1,
                  groupValue:_value, 
                  
                  onChanged: (value){
                    setState(() {
                    _value = value;
                    });
                  }),
                  Text("تطبيق القيود الرئيسية فقط", style: GoogleFonts.amiri(
                                  fontSize: 18,
                                  color:Color.fromRGBO(64, 128, 128, 1),

                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
                 ],),
                        ),
             Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
               child: Row(children: [
                Radio(
                   value: 2,
                    groupValue: _value, 
                     onChanged: (value){
                      setState(() {
                      _value = value;
                      });
                    }),
                  Text("تطبيق القيود الرئيسية و القيود الثانية ", style: GoogleFonts.amiri(
                                  fontSize: 18,
                                  color:Color.fromRGBO(64, 128, 128, 1),
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
               
               ],),
             ),

             
           Container(
                  
                          width: MediaQuery.of(context).size.width ,
                          height:  MediaQuery.of(context).size.height * 0.05,
                          
              
                  decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        
                          
                          child: IconButton(icon: Icon(Icons.done_all),color: Color.fromRGBO(64, 128, 128, 1),
                          alignment: Alignment.center, 
                          onPressed:(){
                           runCore();
                             Dialog alert = showAlert(context,'تم البدء! سيصلك تنبيه عند الانتهاءمنه ',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           start = true;
                           setState(() {
                             show = !show;
                           });


                           }),
                        
                

              ),
           
                      ],
                    ) 
                    :SizedBox(height: 0,),

                    SizedBox(height: 10,),
                                        

                    
              
              ],
            ),
          
        ),
      
     


    );



  }

  Future stopCore() async {
   


    String apiUrl =ip+"storCore?tableName=${widget.tableName}";
    final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'].length);

       

       }

    return 1;

  
  }
}
