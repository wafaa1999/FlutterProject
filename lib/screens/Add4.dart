import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/MatOfOtherDep.dart';
import 'package:graduationproject/screens/showFinalTable.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/button2.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTablefinal extends StatefulWidget {
  final String instName;
  final String idDep;
  final String depName;
  final String year;
  final String tablename;
  // final List<String> instNames;
  // final List<String> coursesNames;

  const AddTablefinal({Key key, this.instName, this.idDep, this.depName, this.year, this.tablename}) : super(key: key);


  @override
  _AddTablefinalState createState() => _AddTablefinalState();
}

class _AddTablefinalState extends State<AddTablefinal> {

    
    //  String couresSelected ="لم يتم اختياره";
     String instSelected= "لم يتم اختياره";
     String courseSelected= "لم يتم اختياره";
     //  List<String> dep=[];
     List<String> course=[];
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
     final _number = TextEditingController();
     bool without = true;
     String labSlected ="لم يتم اختياره";
     String roomSelected ="لم يتم اختياره";
     List<String> rooms=["لم يتم اختياره"];
     List<String> labs=["لم يتم اختياره"];
     List<String> labId=["لم يتم اختياره"];
      List<String> courseNames  = [];
    List<String> courseNumbers  = [];
    List<String> days  = [];
    List<String> toTime  = [];
    List<String> fromTime  = [];
    List<String> insts  = [];
    List<String> roomtype  = [];
    List<String> room  = [];
    List<int> classConflict  = [];
   

     int _value =0;
        List<String> instNames = ["لم يتم اختياره"];
  List<String> coursesNames = ["لم يتم اختياره"];
    
  
     @override
     void initState() { 
       super.initState();
       getalldata();
       getRooms();
    
    
         }

  Future getalldata() async {
    String id = widget.idDep;

    String apiUrl = "https://core-graduation.herokuapp.com/getMatOfSpeDep?idDep=$id&id=$id";
    String apiUrl2 = "https://core-graduation.herokuapp.com/getAllIsn?idDep=$id";
     String apiUrl3 = "https://core-graduation.herokuapp.com/getRoomCat?idDep=$id";

   for(int i =0;i< 2 ; i++){
    
    if (i ==0){
 final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       setState(() {
         coursesNames.add(decoded['response'][i]['name']); 
       });
      
       }
   print(coursesNames);
        
       }
    }
    else  if (i == 1){
 final response1 =
        await http.get(Uri.parse(apiUrl2));
        
    if (response1.statusCode == 200) {
  
        Map decoded = json.decode(response1.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       setState(() {
         instNames.add(decoded['response'][i]['name']); 
       });
      
       }
   print(instNames);
        
       }
    }
  
   

   }
 
    
    return 1 ;

    

      }
      
     
Future getRooms()async{
  String id ="60ddc9735b4d43f8eaaabf83";

 String apiUrl2 = "https://core-graduation.herokuapp.com/getRoomsofDep?idDep=${id}";

 final response1 =
        await http.get(Uri.parse(apiUrl2));
        
    if (response1.statusCode == 200) {
  
        Map decoded = json.decode(response1.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       if (decoded['response'][i]['name'] =='قاعة تدريس'){
       rooms.add(decoded['response'][i]['number']); }
       else{
       labs.add(decoded['response'][i]['name'] ); 
       labId.add(decoded['response'][i]['number'] ); 
       }
      
       }
    }
    return 1;
}

  Future getFinalDataTable(String tableName)async{

  
  

   String apiUrl = "https://core-graduation.herokuapp.com/getFinalTable?tableName=${tableName}&idDep=${widget.idDep}";
   print(apiUrl);
  final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map decoded = json.decode(response.body) ; 
      print(decoded);
      for(int i =0; i<decoded['response'].length; i++){
            courseNames.add(decoded['response'][i]['courseName']); 
            courseNumbers.add(decoded['response'][i]['courseNumber']); 
            days.add(decoded['response'][i]['days']); 
            toTime.add(decoded['response'][i]['endHour']); 
            fromTime.add(decoded['response'][i]['startHour']); 
            insts.add(decoded['response'][i]['instName']); 
            roomtype.add(decoded['response'][i]['roomType']); 
            room.add(decoded['response'][i]['roomNumber']); 
            classConflict.add(decoded['response'][i]['classConflict']); 

      }
   
      
    
    }
    return 1;
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



 
  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     return Scaffold(
        drawer: AppDrawer(
            //  idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
             ),
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "اضافة مساق ",
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
                             int inm = await getFinalDataTable(widget.tablename);
         if(inm == 1){
             Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowFinalTable(

                                        idDep:widget.idDep,
                                        instName:widget.instName,
                                        depName:widget.depName,
                                         tableName:widget.tablename,
                                        year: widget.year,
                                        courseNumbers :courseNumbers,
                                        courseNames :courseNames,
                                        insts:insts,
                                        room:room,
                                        roomtype:roomtype,
                                        fromTime:fromTime,
                                        toTime:toTime,
                                        days:days,
                                        classConflict:classConflict
      
                                      ),
                                    ),
             );
         
         }

                          })

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
           
                  child: Text("رقم الشعبة",style: GoogleFonts.amiri(
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
                      
                       controller: _number,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                         
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

           Row(
            children: [
              SizedBox(height :height *0.03),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
           
                  child: Text("اسم المساق",style: GoogleFonts.amiri(
                                      fontSize: 18,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),




                 Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Container(
                  // width:width *0.1,
                  
                  child: DropdownButton<String>(
                            isExpanded: false,

                    
                     value: courseSelected,
                    //  hint: Text("اختر اسم القسم"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: coursesNames.map((String dropDown){
                         ButtonTheme(
        alignedDropdown: false,);

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
         ],

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
                    
                     value: instSelected,
                    //  hint: Text("اختر اسم المساق"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: instNames.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        instSelected = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
         ],),
           ),

           
          Container(
          // height: without ? 50:120,
                  child: Column(
            children: [
              Row(children: [
                 Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
           
                  child: Text("القاعة الدراسية",style: GoogleFonts.amiri(
                                      fontSize: 18,
                                      color:Colors.black,
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),





               Radio(
                   value: 1,
                    groupValue:_value, 
                    
                    onChanged: (value){
                      setState(() {
                        _value = value;
                        without = false;
                      });
                    }),
                    Text('قاعة  تدريس', style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:Colors.black,
                                      
                                     fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
                Radio(
                   value: 2,
                    groupValue: _value, 
                     onChanged: (value){
                      setState(() {
                        _value = value;
                         without = false;

                      });
                    }),
                  Text('مختبر', style: GoogleFonts.amiri(
                                    fontSize: 16,
                                    color:Colors.black,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
               


            ],)
            ,
            without ?SizedBox(height: 0,):SizedBox(height: 10,),
            _value == 1?
 Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 2),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: roomSelected,
                     hint: Text("اختر رقم القاعة"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: rooms.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        roomSelected = value;
                      });
                    } ,

                   

                  ),
                ),
                
              ):_value ==2 ?
               Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 2),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: labSlected,
                     hint: Text("اختر نوع المختبر"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 17,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: labs.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        labSlected = value;
                      });
                    } ,

                   

                  ),
                ),
              ):
              SizedBox(height: 0,),
        
               
            ],
          ),
        ),
        
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
          SizedBox(height: height * 0.1,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
           child: InkWell(


              onTap: ()async {
                          if (_number.text.isEmpty||instSelected =='لم يتم اختياره'||courseSelected =='لم يتم اختياره' ||
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
                                _number.clear();
                                time = null;
                                time2 = null;
                                instSelected ='لم يتم اختياره';
                                courseSelected ='لم يتم اختياره';
                                roomSelected ='لم يتم اختياره';
                                labSlected ='لم يتم اختياره';
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
   String timeSlot= "";
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

         String roomName = "";
         String roomType1 = ""; 
         if(_value ==1){
           roomType1 = "قاعة تدريس";
           roomName = roomSelected;

         }
         else {
           roomType1 = labSlected;
           for (int i =0; i< labs.length;i++){
             if(labs[i]== labSlected){
               roomName = labId[i]
               ;
               break;

             }
           }

         }

 
    // final String apiUrl = 
    // "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.year}&courseIns=$instSelected&courseName=$courseSelected&flag=$flag&timeSlot=$timeSlot&roomType=$roomSelected";
    final String apiUrl = 
    "https://core-graduation.herokuapp.com/addFinalTable?courseName=${courseSelected}&idDep=${widget.idDep}&tableName=${widget.tablename}&days=$timeSlot&startHour=${getText()}&endHour=${getText2()}&roomNumber=$roomName&roomType=$roomType1&sectionNumber=${_number.text}&instName=$instSelected";

    
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