

import 'dart:convert';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/planOfMaterials.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;


class AddNewMat extends StatefulWidget {
 final String idDep;
   final String depName;
  final String instName;

  const AddNewMat({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
   

  @override
  _AddNewMatState createState() => _AddNewMatState();
}

class _AddNewMatState extends State<AddNewMat> {

  List<String> numberOfHours = ["0","1","2","3"];
  List<String> year = ["سنة أولى","سنة ثانية","سنة ثالثة","سنة رابعة","سنة خامسة","غير ذلك"];
  List<String> semester = ["الفصل الأول","الفصل الثاني","غير ذلك"];
 
  final _name = TextEditingController();
  final _number = TextEditingController();

  String selectedHour ;
  String selectedYear ;
  String selectedsem ;
  String selectedtype ;
  int _value = 0;

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
                              "اضافة مساق جديد",
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
                          alignment: Alignment.bottomLeft, onPressed:(){

                             Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          PlanOfMaterials(
                                        idInst:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
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
                                      color:Colors.grey[600],
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),




                  Container(
                    width: width * 0.6,
                    height: height * 0.06,
                   
                    child: TextField(
                      
                       controller: _name,
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
            SizedBox(height:height * 0.01),
          ],),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("رقم المساق",style: GoogleFonts.amiri(
                                        fontSize: 18,
                                        color:Colors.grey[600],
                                          
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.7),),
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

             SizedBox(height :height * 0.1),
            ],

          ),

          Row(children: [
             Padding(
                padding: const EdgeInsets.all(10),
                child: Text("الساعة المعتمدة ",style: GoogleFonts.amiri(
                                            fontSize: 18,
                                            color:Colors.black,
                                              
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),),
              ),
               Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  // width:width *0.1,
                  child: DropdownButton<String>(
                    
                     value: selectedHour,
                     hint: Text("اختر الساعة المعتمدة"),
                    dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                    elevation: 5,
                    iconSize: 30,
                   style: TextStyle(
                                            fontSize: 16,
                                            color:Colors.black,
                                              
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 1.7),

                    items: numberOfHours.map((String dropDown){

                      return DropdownMenuItem<String>(
                        
                        value: dropDown,
                        child:Text(dropDown) ,
                      );
                      
                    }).toList(),
                    onChanged:(value){
                      setState(() {
                        selectedHour = value;
                      });
                    } ,

                   

                  ),
                ),
              ),
          ]),
          
          

           Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("نوع المساق",style: GoogleFonts.amiri(
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
                  Text("اختياري", style: GoogleFonts.amiri(
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
                Text("اجباري", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
          
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("السنة الدراسية", style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color:Colors.black,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
            ),

            
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // width:width *0.3,
                // height: height * 0.5,
                child: DropdownButton<String>(
                  value:selectedYear,

                  hint: Text("اختر السنة الدراسية"),
                  dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                  elevation: 5,
                  iconSize: 30,
                 style: TextStyle(
                                          fontSize: 16,
                                          color:Colors.black,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),


       
                  
                 
                  items: year.map((String dropDown){

                    return DropdownMenuItem<String>(
                      
                      value: dropDown,
                      child:Text(dropDown) ,
                    );
                    
                  }).toList(),

                  onChanged:(value){
                    setState(() {
                      selectedYear = value;
                    });
                  } ,



                ),
              ),
            ),
          ],)
,
          Row(children: [
            Container(child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("الفصل الدراسي", style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color:Colors.black,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
            )),

            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                // height: height * 0.5,
                child: DropdownButton<String>(
                  value: selectedsem,
                                     hint: Text("اختر الفصل الدراسي"),
                  dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                  elevation: 5,
                  iconSize: 30,
                 style: TextStyle(
                                          fontSize: 16,
                                          color:Colors.black,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),


                  
                 
                  items: semester.map((String dropDown){

                    return DropdownMenuItem<String>(
                      
                      value: dropDown,
                      child:Text(dropDown) ,
                    );
                    
                  }).toList(),
                 onChanged:(value){
                    setState(() {
                      selectedsem = value;
                    });
                  } ,



                ),
              ),
            ),
          ],)
,
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
                          String responce = await checkUser();
                           if (responce == '-1'){
                           Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                            }
                            else if (responce == '1') {
                              Dialog alert = showAlert(context,'تم اضافة المساق ',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                            }
                            else if (responce == '0') {
                              Dialog alert = showAlert(context,'المساق مضاف مسبقا',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

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

          
        ],) ,
        
        ),
        
        
        );
    
  }

 Future checkUser( ) async {
   var yearOfcourse ;
   var typeOfcourse;
   var semOfcourse;


   

    if(_name.text.isEmpty||_number.text.isEmpty || selectedsem=="" || selectedtype=="" || selectedYear==""|| _value ==0) {
      return '-1';
    }
    else{
      switch(selectedYear){
        case ('سنة أولى'):
        yearOfcourse = '1';
        break;

        case ('سنة ثانية'):
        yearOfcourse = '2';
        break;

        case ('سنة ثالثة'):
        yearOfcourse = '3';
        break;

        case ('سنة رابعة'):
        yearOfcourse = '4';
        break;

        case ('سنة خامسة'):
        yearOfcourse = '5';
        break;

        case ('غير ذلك'):
        yearOfcourse = '-1';
        break;
      }

      if( selectedsem == "الفصل الأول"){
        semOfcourse ='1';
      }
      else if ( selectedsem== "الفصل الثاني") {
        semOfcourse ='2';
      }
      else if(selectedsem == "غير ذلك"){
        semOfcourse ='-1';
      }

      if (_value == 1 ){
        typeOfcourse="اختياري";

      }
      else {
        typeOfcourse="اجباري";

      }
      
    final String apiUrl = "https://core-graduation.herokuapp.com/addCourseToDepartment?idDep=${widget.idDep}&name=${_name.text}&number=${_number.text}&numberOfHour=${selectedHour}&type=${typeOfcourse}&year=${yearOfcourse}&sem=${semOfcourse}";
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'][0]);
        return decoded['response'][0];
        
        
       }
   
      }
    }
  

}