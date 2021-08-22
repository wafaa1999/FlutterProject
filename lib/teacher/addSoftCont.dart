
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/teacher/softCon.dart';
import 'package:graduationproject/widgets/alertDialg.dart';

import 'package:graduationproject/widgets/button2.dart';
import 'package:graduationproject/widgets/drawer2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddSoft extends StatefulWidget {
  final String instName;
  final String idDep;
  final String depName;

  const AddSoft({Key key, this.instName, this.idDep, this.depName}) : super(key: key);

  


  @override
  _AddSoftState createState() => _AddSoftState();
}

class _AddSoftState extends State<AddSoft> {

    
      final _note = TextEditingController();
      bool day1 =false;
     bool day2 =false;
     bool day3 =false;
     bool day4 =false;
     bool day5 =false;
     bool day6 =false;
     TimeOfDay time;
     TimeOfDay time2;
     bool select = false;
     bool select2 = false;
     int _value = 0;
  double _currentSliderValue = 0;

  var _switchValue = true;
  
     @override
     void initState() { 
       super.initState();
    
      }

  

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
    var width = MediaQuery.of(context).size.width;
     return Scaffold(
        drawer: AppDrawer2(
             idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "اضافة ملاحظة",
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
                            int res = await getalldata4();
                          if(res == 1) {

                          Navigator.pushReplacement(
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

                          }),
                        
                

              ),
            ],

          ),
          SizedBox(height :height *0.03),
          
           Row(
            children: [
              SizedBox(height :height *0.03),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
           
                  child: Text("الملاحظة",style: GoogleFonts.amiri(
                                      fontSize: 18,
                                      color:Colors.grey[600],
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),




                  Container(
                    width: width * 0.6,
                    height: height * 0.06,
                   
                    child: TextField(
                      
                       controller: _note,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.text,
                         
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        ),
                     
                        ),
                        
                  ),
            ],

          ),
          Row(children: [
            
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("الحالة",style: GoogleFonts.amiri(
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
                   
                    });
                  }),
                  Text("أريد محاضرة", style: GoogleFonts.amiri(
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
                    });
                  }),
                Text("لا اريد محاضرة", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
      
          ],),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Row(children: [
                Text("الاهمية",style: GoogleFonts.amiri(
                                                fontSize: 18,
                                                color:Colors.black,
                                                  
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.7)
),
                Slider(
      value: _currentSliderValue,
      min: 0,
      max: 0.9,
      divisions: 3,
      label: _currentSliderValue.toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    )



                  ],),
            ),
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 0, 15, 2),
             child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
             
                    child: Text("موعد البدء ",style: GoogleFonts.amiri(
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
             
                    child: Text("موعد المهاية ",style: GoogleFonts.amiri(
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

              //  select2? Text(getText2()):SizedBox(height :0),
         
         
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
 Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 8, 0),
             child: Text("فراغات بين المحاضرات",style: GoogleFonts.amiri(
                                            fontSize: 18,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
           ),
           
Container(
  // width: 20,
  // height: 20,
  child:  Padding(
        padding: EdgeInsets.only(top: 10),
        child:  CupertinoSwitch(
          activeColor: Color.fromRGBO(64, 128, 128, 1),
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),)
),
         ],),

      
         Row(children: [
          SizedBox(height: height * 0.2,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: InkWell(


              onTap: ()async {
                          if (_note.text.isEmpty|| 
                           getText() == 'اختر الوقت' || getText2() =='اختر الوقت'  ){
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }
                         
                            else{

                          
                          int response = await addnew2();
                           if (response == 1){
                             Dialog alert = showAlert(context,'تمت الاضافة ',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                              setState(() {
                                _currentSliderValue = 0;
                                _switchValue = false;
                                _note.clear();
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
                         

                        child: Container(
                width: width * 0.3,
                          height: height *0.055,
                          
                           decoration: BoxDecoration(
                             
                              gradient: new LinearGradient(
                                  colors: [Color.fromRGBO(206, 222, 223, 1), Color.fromRGBO(207, 222, 222, 1)]),
                              borderRadius: BorderRadius.circular(20),
                            ),
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
        
     Future addnew2 () async {
         String timeSlot = "";
      
       
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
String flag = "";
         print(timeSlot);
         if(_value ==1){
           flag = 'true';

         }else 
         flag = 'false';

  final String apiUrl = 
    "https://core-graduation.herokuapp.com/addSoftConst?idDep=${widget.idDep}&note=${_note.text}&start=${getText()}&end=${getText2()}&days=$timeSlot&weight=$_currentSliderValue&need=$flag&space=${_switchValue}&instName=${widget.instName}";
    
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


}