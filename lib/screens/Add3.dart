import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/button2.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'MatForOtherDep.dart';

class AddTable3 extends StatefulWidget {
    final String instName;
  final String idDep;
  final String depName;
  final String year;
  final String tablename;
  final List<String> intName;
  final List<String> courese;
  final List<String> labs;

  const AddTable3({Key key, this.instName, this.idDep, this.depName, this.year, this.tablename, this.intName, this.courese, this.labs}) : super(key: key);
  
   

  @override
  _AddTable3State createState() => _AddTable3State();
}

class _AddTable3State extends State<AddTable3> {
      
      
   
    
    //  String couresSelected;
     String instSelectd = "لم يتم اختياره";
     String courseSelected = "لم يتم اختياره";
     List<String> course=[];
     List<String> inst = [];
     bool day1 =false;
     bool day2 =false;
     bool day3 =false;
     bool day4 =false;
     bool day5 =false;
     bool day6 =false;
      List <String> course2 = [];
      List <String> toTime1 = [];
      List <String> days1 = [];
      List <String> inst1 = [];
      List <String> room1 = [];
      List<String> fromTime1 = [];
      bool show = false;
      String labSelected = 'لم يتم اختياره';
      int _value = 0;
 
     
     


    //  *****************

TimeOfDay time;
TimeOfDay time2;
bool select = false;
bool select2 = false;

   String getText() {
    if (time == null) {
      return 'اختر الوقت';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

   String getText2() {
    if (time2 == null) {
      return 'اختر الوقت';
    } else {
      final hours = time2.hour.toString().padLeft(2, '0');
      final minutes = time2.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }


  



    @override
    void initState() { 
      super.initState();
      
      
    }
  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     return Scaffold(
        drawer: AppDrawer(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "اضافة مساق لقسم أخر ",
                              style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
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

       body: SingleChildScrollView(
        child:Column(children:<Widget> [
           Row(
            children: [
              Container(
                
                width: width,
                height: height * 0.05,
                  decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        
                          
                          child: IconButton(icon: Icon(Icons.close),color: Color.fromRGBO(64, 128, 128, 1),
                          alignment: Alignment.bottomLeft, 
                          onPressed:()async{
                            int res = await getalldata3();
                          if(res == 1)
                          {
                            // print(dep);
                            print(course2);
                            // print(years);
                            print(days1);
                            print(fromTime1);
                            print(toTime1);
                            print(room1);
                           

                          Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable3(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tablename,
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
                          }),
                        
                

              ),
            ],

          ),
          SizedBox(height :height *0.03),

      
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
             child: Row(children: [
               Text("اسم المساق",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
             
             
             Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value:courseSelected,
                     hint: Text("اختر اسم المساق"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: widget.courese.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        courseSelected = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
         ],),
           ),
       
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
             child: Row(children: [
               Text("اسم المدرس",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
             
             
             Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value:instSelectd,
                     hint: Text("اختر اسم المدرس"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: widget.intName.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        instSelectd = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
         ],),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 7, 5),
             child: Row(children: [
               Text(" نوع القاعة",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
     
             
                Radio(
                 

                 
                 value: 1,
                  groupValue:_value, 
                  
                  onChanged: (value){
                    setState(() {
                      _value = value;
                      show = false;
                    });
                  }),
                  Text("قاعة تدريس", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
               

              Radio(
                 value: 2,
                  groupValue: _value, 
                   onChanged: (value){
                    setState(() {
                      _value = value;
                      show = true;
                    });
                  }),
                Text("مختبر", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
          ],),
           ),
           show?        
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
             child: Row(children: [
               Text("نوع المختبر",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
             
             
             Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: labSelected,
                     hint: Text("اختر نوع المختبر"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: widget.labs.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        labSelected = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
         ],),
           ):SizedBox(height: 0,),
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 15, 2),
             child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
             
                    child: Text("موعد بدء المحاضرة",style: GoogleFonts.amiri(
                                        fontSize: 18,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(0),
                   child: Center(
                     child: ButtonTimePiker(title: "", 
                text: getText(), onClicked: ()=>pickTime(context)),
                   ),
                 ),

              //  select? Text(getText()):SizedBox(height :0),
         
         
             ],),
           ),
      
       Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
             child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
             
                    child: Text("موعد نهاية المحاضرة",style: GoogleFonts.amiri(
                                        fontSize: 18,
                                        color:Colors.black,
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(0),
                   child: Center(
                     child: ButtonTimePiker(title: "", 
                text: getText2(), onClicked: ()=>pickTime2(context)),
                   ),
                 ),

         
         
             ],),
           
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
             child: Row(
             children:[ Padding(
               padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
               child: Text("الايام",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),

             Padding(
               padding: const EdgeInsets.all(0.0),
               child: Checkbox(value: day1, onChanged:(value,
    //                activeColor:Colors.red,
    // this.checkColor,
    // this.focusColor,
    // this.hoverColor,
    ){
                 setState(() {
                                day1 =value;
                 }); 
               }),
             ),
              Padding(
               padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
               child: Text("السبت",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),

             

             Checkbox(value: day2, onChanged:(value){
               setState(() {
                              day2 =value;
               }); 
             }),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
               child: Text("الاحد",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),

             Checkbox(value: day3, onChanged:(value){
               setState(() {
                              day3 =value;
               }); 
             }),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
               child: Text("الاثنين",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7),),
             ),



             
              ] ),
           ),
         
         Row(
           children:[ Padding(
             padding: const EdgeInsets.fromLTRB(5, 5, 40, 0),
             
           ),

           Padding(
             padding: const EdgeInsets.all(0.0),
             child: Checkbox(value: day4, onChanged:(value){
               setState(() {
                              day4 =value;
               }); 
             }),
           ),
            Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
             child: Text("الثلاثاء",style: GoogleFonts.amiri(
                                            fontSize: 18,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),

           

           Checkbox(value: day5, onChanged:(value){
             setState(() {
                            day5 =value;
             }); 
           }),
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
             child: Text("الاربعاء",style: GoogleFonts.amiri(
                                            fontSize: 18,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),

           Checkbox(value: day6, onChanged:(value){
             setState(() {
                            day6 =value;
             }); 
           }),
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
             child: Text("الخميس",style: GoogleFonts.amiri(
                                            fontSize: 18,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),



           
            ] ),
         

         Row(children: [
          SizedBox(height: height * 0.1,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: Container(
                width: width * 0.3,
             height: height *0.055,
             
              decoration: BoxDecoration(
                
                 gradient: new LinearGradient(
                     colors: [Color.fromRGBO(206, 222, 223, 1), Color.fromRGBO(207, 222, 222, 1)]),
                 borderRadius: BorderRadius.circular(20),
               ),
               child: InkWell(
                 onTap: ()async {
                          if (courseSelected =='لم يتم اختياره' || _value ==0 ||
                           getText() == 'اختر الوقت' || getText2() =='اختر الوقت'  ){
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }
                         
                            else{

                          
                          int response = await addnew3();
                           if (response == 1){
                             Dialog alert = showAlert(context,'تمت الاضافة ',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                              setState(() {
                                instSelectd ='لم يتم اختياره';
                                courseSelected ='لم يتم اختياره';
                                _value =0;
                                labSelected = 'لم يتم اختياره';
                                day1 = false;
                                day2 = false;
                                day3 = false;
                                day4 = false;
                                day5 = false;
                                day6 = false;
                                time = null;
                                time2 = null;
                                
                                
                           
                         });

                           }

                          
                        
                       
                          }
                      

                         
                        },
            
               child: Padding(
                 padding: const EdgeInsets.all(3),
                 child: Text(
                   "حفظ",
                   style: GoogleFonts.amiri(
                       fontSize: 20,
                       color: Colors.black,
                       letterSpacing: 1.7),
                   textAlign: TextAlign.center,
                 ),
               ),
             
           ),
             ),
         ),
        ],),


           
          




        ],
        ),
       ),
     );
      
 
  }

  Future getalldata3() async {
   
    String id = '60ddc9735b4d43f8eaaabf83';
    // years.clear();
    course2.clear();
    fromTime1.clear();
    toTime1.clear();
    days1.clear();
    // dep.clear();
    inst1.clear();
    room1.clear();

    List<String> arr =[];
    String time = "";

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tablename}";
    print(apiUrl);
 final response =
        await http.get(Uri.parse(apiUrl));
        print(response.statusCode);
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
      if(decoded['response'][i]['fromOtherDep']== 'false' && decoded['response'][i]['toOtherDep']== 'true' ){

      
      //  years.add(decoded['response'][i]['year']); 
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
      
      
      
 Future addnew3 () async {
         String timeSlot = "";
      
         timeSlot += getText();

       
         timeSlot += '/';
         timeSlot += getText2();
         timeSlot += '/';
         List<String> days = [];
         if(day1 == true){
           days.add( 'سبت');
         }
          if(day2 == true){
           
           days.add( 'احد');
         }
          if(day3 == true){
           
           days.add( 'اثنين');
         }
          if(day4 == true){
           
           days.add( 'ثلاثاء');
         }
          if(day5 == true){
           
           days.add( 'اربعاء');
         }
          if(day6 == true){
           days.add( 'خميس');
         } 
         for(int y =0; y<days.length;y++){
           timeSlot += days[y];
           if(y+1 ==days.length){
             continue;
           }
           timeSlot += ',';
         }

         print(timeSlot);
         String room;
  if(_value == 1){
    room = "قاعة تدريس";
  }
  else room = labSelected;

 
    final String apiUrl = 
    "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.tablename}&courseIns=$instSelectd&courseName=$courseSelected&flag=2&timeSlot=$timeSlot&roomType=$room&date=${widget.year}";
    
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'][0]);
        // return decoded['response'][0]['flag'];
      

    }
          return 1;

    }
 



  

   Future pickTime(BuildContext context) async {
   
    final initialTime = TimeOfDay(hour: 8, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
    setState(() {
      select = true;
    });

  }

  Future pickTime2(BuildContext context) async {
   
    final initialTime = TimeOfDay(hour: 8, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time2 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time2 = newTime);
    setState(() {
      select2 = true;
    });

  }


}