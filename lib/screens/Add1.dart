import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/MatOfDep.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTable1 extends StatefulWidget {
  
final String idDep;
final String depName;
final String instName;
final String tablename;
final String year;


  const AddTable1({Key key, this.idDep, this.depName, this.instName, this.tablename, this.year}) : super(key: key);

  // const AddTable1({Key key, this.idDep, this.depName, this.instName, this.tablename, this.year, this.courses, this.labs, this.inst}) : super(key: key);



  @override
  _AddTable1State createState() => _AddTable1State();
}

class _AddTable1State extends State<AddTable1> {

    List<String> room1 =[];
  List<String> inst1 =[];
  List<String> course1 =[];

     List<String> inst = [];
     List<String> labs =[];
     List<String> courses =[];
     String instSelected="لم يتم اختياره";     String labSelectd="لم يتم اختياره";
     String courseSelected="لم يتم اختياره";
     int _value1 = 0;
     bool show = false;
    

    @override
    void initState() { 
      super.initState();
      print(widget.tablename);
      getalldata2();
      inst.add("لم يتم اختياره");
      courses.add("لم يتم اختياره");
      labs.add("لم يتم اختياره");

      
      
    }

        
    Future getalldata2() async {
    String id = widget.idDep;

    String apiUrl = "https://core-graduation.herokuapp.com/getMatOfSpeDep?idDep=$id&id=$id";
    String apiUrl2 = "https://core-graduation.herokuapp.com/getAllIsn?idDep=$id";
     String apiUrl3 = "https://core-graduation.herokuapp.com/getRoomCat?idDep=$id";

   for(int i =0;i< 3 ; i++){
    
    if (i ==0){
 final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
             setState(() {
                      courses.add(decoded['response'][i]['name']); 

             });      
       }
   print(courses);
        
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
         inst.add(decoded['response'][i]['name']);
       });
        
      
       }
   print(inst);
        
       }
    }
      else  if (i == 2){
 final response2 =
        await http.get(Uri.parse(apiUrl3));
        
    if (response2.statusCode == 200) {
  
        Map decoded = json.decode(response2.body) as Map<String, dynamic>;
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       setState(() {
         labs.add(decoded['response'][i]['name']);
       }); 
      
       }
   print(labs);
        
       }
    }

   

   }
 
    
    return 1 ;

    

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
                              "اضافة مساق للقسم ",
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
                         
                          int res = await getalldata();
                          if(res == 1)
                          Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                           ShowTable1(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        tablename: widget.tablename,
                                        year:widget.year,
                                        courses:course1,
                                        rooms:room1,
                                        inst:inst1

                                          

                                        ),
                                      ),
                                    );

                        
                                     
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

                    items: courses.map((String dropDown){

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
             padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                     hint: Text("اختر اسم المدرس"),
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
                        instSelected = value;
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
                  groupValue:_value1, 
                  
                  onChanged: (value){
                    setState(() {
                      _value1 = value;
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
                  groupValue: _value1, 
                   onChanged: (value){
                    setState(() {
                      _value1 = value;
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
                    
                     value: labSelectd,
                     hint: Text("اختر نوع المختبر"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items:labs.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        labSelectd = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
         ],),
           ):SizedBox(height: 0,),
        
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
                          if (instSelected =='لم يتم اختياره'||courseSelected =='لم يتم اختياره' || _value1 ==0 ){
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }
                         
                            else{

                          
                          int response = await addnew1();
                           if (response == 1){
                             changeStatus();
                             Dialog alert = showAlert(context,'تمت الاضافة ',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                              setState(() {
                                instSelected ='لم يتم اختياره';
                                courseSelected ='لم يتم اختياره';
                                labSelectd ='لم يتم اختياره';
                                _value1 =0;
                           
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
  Future addnew1 () async {
    
  String flag = '0';
  String timeSlot = '0';
  String room;
  if(_value1 == 1){
    room = "قاعة تدريس";
  }
  else room = labSelectd;

    // final String apiUrl = 
    // "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.year}&courseIns=$instSelected&courseName=$courseSelected&flag=$flag&timeSlot=$timeSlot&roomType=$roomSelected";
    final String apiUrl = 
    "https://core-graduation.herokuapp.com/saveMatOfDraft?depId=${widget.idDep}&tableName=${widget.tablename}&courseIns=$instSelected&courseName=$courseSelected&flag=$flag&timeSlot=$timeSlot&roomType=$room&date=${widget.year}";
    
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
 
      Future getalldata() async {
    String id = '60ddc9735b4d43f8eaaabf83';

    String apiUrl = "https://core-graduation.herokuapp.com/getFromDraft?idDep=${widget.idDep}&tableName=${widget.tablename}";
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
 
 

Future changeStatus () async {
   String id = widget.idDep;

    final String apiUrl = 
    "https://core-graduation.herokuapp.com/changeStatus?idDep=${id}&tableName=${widget.tablename}&status=draft";
    
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        // print(decoded['response'][0]);
        
      }

    }
 


  



 


  


}