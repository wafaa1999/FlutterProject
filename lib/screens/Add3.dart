import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/button2.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTable3 extends StatefulWidget {
   

  @override
  _AddTable3State createState() => _AddTable3State();
}

class _AddTable3State extends State<AddTable3> {
      
      
      Future getMat() async {
        names.clear();
        names.add('لم يتم اختياره');

      
        String id ;
        print(depSelected);
          String apiUrl;
        if(depSelected =='هندسة حاسوب'){
        String one ='60ddc9735b4d43f8eaaabf83';
         apiUrl = "https://core-graduation.herokuapp.com/getMatOfSpeDep?idDep=$one&id=60ddc9735b4d43f8eaaabf83";}
        if(depSelected =='هندسة الاتصالات'){
        String two = '60ddc8e95b4d43f8eaaabf7d';
         apiUrl = "https://core-graduation.herokuapp.com/getMatOfSpeDep?idDep=$two&id=60ddc9735b4d43f8eaaabf83";}

         print(apiUrl);
         print("*////");
        // if (flag == '1')
        // id =one;
        //  else id = two;

         print(getText());
         print(getText2());

   
    
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>; 

     for(int i =0; i<decoded['response'].length; i++){
       names.add(decoded['response'][i]['name']);  
      

       }
 print(names);
 updateCourse(names);
    

    

      }

    
     
    
    }

 
    
    //  String couresSelected;
     String depSelected= "لم يتم اختياره";
     String instSelectd;
     String courseSelected = "لم يتم اختياره";
     List<String> names=['لم يتم اختياره'];
     List<String> dep=['هندسة حاسوب','هندسة الاتصالات',"لم يتم اختياره"];
     List<String> course=[];
     List<String> inst = [];
     bool day1 =false;
     bool day2 =false;
     bool day3 =false;
     bool day4 =false;
     bool day5 =false;
     bool day6 =false;

  

     updateCourse(List <String> value){
       setState(() {
         course =value;
       });
     }
     

     
     


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
            //  idDep: widget.idDep,instName: widget.instName,depName: widget.depName,
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
                          onPressed:(){}),
                        
                

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
           
                  child: Text("اسم القسم",style: GoogleFonts.amiri(
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
                    
                     value: depSelected,
                     hint: Text("اختر اسم القسم"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: dep.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      
                      
                      setState(() {
                        depSelected = value;
                        courseSelected ="لم يتم اختياره";
                        

                      });
                      getMat() ;
                    } ,

                   

                  ),
                ),
              ),
         ],

          ),
          
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
                    
                     value: courseSelected,
                     hint: Text("اختر اسم المساق"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: names.map((String dropDown){

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
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
             child: Row(children: [
               Text("السنة الدراسية",style: GoogleFonts.amiri(
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
                    
                     value: instSelectd,
                     hint: Text("اختر السنة الدراسية"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: inst.map((String dropDown){

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
          SizedBox(height: height * 0.2,),
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
               onTap: (){
                 getMat();
                 print(day1);
                 print(day2);
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