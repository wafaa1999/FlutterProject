import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/MatOfOtherDep.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/button2.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTable2 extends StatefulWidget {
  final String instName;
  final String idDep;
  final String depName;
  final String year;
  final String tablename;
  final List<String> depNames;
  final List<String> idDeps;

  const AddTable2({Key key, this.instName, this.depName, this.year, this.tablename, this.depNames, this.idDep, this.idDeps}) : super(key: key);

  @override
  _AddTable2State createState() => _AddTable2State();
}

class _AddTable2State extends State<AddTable2> {

    
    //  String couresSelected ="لم يتم اختياره";
     String depSelected= "لم يتم اختياره";
     String courseSelected= "لم يتم اختياره";
     List<String> names=['لم يتم اختياره']; 
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
     List<String> depNames1 = [];
     List<String> idDeps1 = [];
      List<String> days1 = [];
  List<String> fromTime1 =[];
  List<String> toTime1 = [];
  List<String> depNames = [];
  List<String> depsId = [];
  List<String> dep =[];
  List<String> years = [];
  List<String> course2 = [];
     @override
     void initState() { 
       super.initState();
       for(int i =0; i <widget.idDeps.length;i++){
         if(widget.idDep != widget.idDeps[i]){
           depNames1.add(widget.depNames[i]);
           idDeps1.add(widget.idDeps[i]);
         }

       }
     }

             
      Future getValues() async {
        names.clear();
        names.add('لم يتم اختياره');

      
        String id ;
        print(depSelected);
        for(int i =0;i<depNames1.length;i++){
          if(depNames1[i]==depSelected){
            id = idDeps1[i];
            break;
          }
          
        }

        final String apiUrl = "https://core-graduation.herokuapp.com/getAllMaterialsOfDepartment?idDep=${widget.idDep}";
      

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
        if (decoded['response'][i]['idDepartment'] == widget.idDep && 
        decoded['response'][i]['toDepartments'] == id)
             
             names.add(decoded['response'][i]['name']);  
      

       }
 print(names);
 updateCourse(names);
    

    

      }

    
     
    
    }
 

 
    

     updateCourse(List <String> value){
       setState(() {
         course =value;
       });
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

 String getText3() {
    if (time2 == null) {
      return 'اختر الوقت';
    } else {
      final hours = time2.hour.toString().padLeft(2, '0');
      final minutes = time2.minute.toString().padLeft(2, '0');
      final  per = time2.period.toString();

      return '$hours:$minutes:$per';
    }
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
                              "اضافة مساق من قسم أخر ",
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
                              
                          int res = await getalldata2();
                          if(res == 1)
                          {
                            print(dep);
                            print(course2);
                            print(years);
                            print(days1);
                            print(fromTime1);
                            print(toTime1);
                           

                          Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable2(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tablename,
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
                            isExpanded: false,

                    
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

                    items: depNames1.map((String dropDown){
                         ButtonTheme(
        alignedDropdown: false,);

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
                       getValues();
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
          SizedBox(height: height * 0.2,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: InkWell(


              onTap: ()async {
                          if (depSelected =='لم يتم اختياره'||courseSelected =='لم يتم اختياره' ||
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
                                depSelected ='لم يتم اختياره';
                                courseSelected ='لم يتم اختياره';
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

 
    // final String apiUrl = 
    // "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.year}&courseIns=$instSelected&courseName=$courseSelected&flag=$flag&timeSlot=$timeSlot&roomType=$roomSelected";
    final String apiUrl = 
    "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.tablename}&courseIns=0&courseName=$courseSelected&flag=1&timeSlot=$timeSlot&roomType=0&date=${widget.year}";
    
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

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tablename}";
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
        for(int k =0;k<widget.idDeps.length;k++){
          if(departid == widget.idDeps[k]){
            dep.add(widget.depNames[k]);
            break;
          }
        }

       
      }
       

      
       }
  
        
       
    }

 
    
    return 1 ;

    

      }


     


}