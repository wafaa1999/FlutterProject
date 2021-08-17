

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
  final String idInst;

  const AddNewMat({Key key, this.idDep, this.depName, this.instName, this.idInst}) : super(key: key);
   

  @override
  _AddNewMatState createState() => _AddNewMatState();
}

class _AddNewMatState extends State<AddNewMat> {

  List<String> numberOfHours = ["0","1","2","3","لم يتم اختياره"];
  List<String> year = ["سنة أولى","سنة ثانية","سنة ثالثة","سنة رابعة","سنة خامسة","غير ذلك","لم يتم اختياره"];
  List<String> semester = ["الفصل الأول","الفصل الثاني","غير ذلك","لم يتم اختياره"];
 
  final _name = TextEditingController();
  final _number = TextEditingController();

  String selectedHour ="لم يتم اختياره";
  String selectedYear ="لم يتم اختياره";
  String selectedsem ="لم يتم اختياره";
  String selectedtype="لم يتم اختياره" ;
  String selectedSpe = "لم يتم اختياره";
  List<String> spe= ["لم يتم اختياره"];
  int _value = 0;
  int _value1 = 0;
  int _value2 = 0;
  List<String> dep =["لم يتم اختياره"];
  List<String> course=[];

String selectedHour1 ="لم يتم اختياره";
  String selectedYear1 ="لم يتم اختياره";
  String selectedsem1 ="لم يتم اختياره";
  String selectedtype1="لم يتم اختياره" ;
  String selectedSpe1 = "لم يتم اختياره";
 
 
 List<String> idDep1 =["لم يتم اختياره"];
 List<String> depNames1 =["لم يتم اختياره"];
 List<String> names =[];
 String depSelected = "لم يتم اختياره";
 String courseSelected = "لم يتم اختياره";
 List<String> idCourses = ["لم يتم اختياره"];
  

  @override
  void initState() { 
    super.initState();
    getdep();
    

  }

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
        child:Column(children: [
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
                                        idInst:widget.idInst,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep: widget.idDep,
                                        
                                        
                                      ),
                                    ),
                                  ); 
                            

                           }),
                        
                

              ),
            ],

          ),
        Row(children: [ Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
             child: Row(children: [
               Text("نوع المساق",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
               
               Radio(
                 

                 
                 value: 1,
                  groupValue:_value1, 
                  
                  onChanged: (value){
                    // print(_value1);
                    setState(() {
                      _value1 = value;
                    });
                    print(_value1);
                  }),
                  Text("من القسم", style: GoogleFonts.amiri(
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
                    });
                    print(_value1);
                  }),
                Text("من قسم اخر", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),


        ],) 
        ,
        _value1 == 1?
      build1(context):
       build2(context)


         ] ,)

 ),
        
        
        
        
        
        );
    
  }

  
    Future getdep() async {
    String id = '60ddc9735b4d43f8eaaabf83';
    String apiUrl = "https://core-graduation.herokuapp.com/getAllDep";
    final response =
        await http.get(Uri.parse(apiUrl));
        
    if (response.statusCode == 200) {
  
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       idDep1.add(decoded['response'][i]['idDepartment']); 
       depNames1.add(decoded['response'][i]['name']);
       if(widget.idDep == decoded['response'][i]['idDepartment']) {
         List<String> m = decoded['response'][i]['sections'].toString().split('/');
         for(int j =0;j<m.length;j++){
           spe.add(m[j]);
         }
       }
       }
     
   print(idDep1);
   print(depNames1);
  
        
       
    }
    return 1;

   }
 
    


    

   Future getValues() async {
        names.clear();
        names.add('لم يتم اختياره');

      
        String id ;
        print(depSelected);
        for(int i =0;i<depNames1.length;i++){
          if(depNames1[i]==depSelected){
            id = idDep1[i];
            break;
          }
          
        }

        final String apiUrl = "https://core-graduation.herokuapp.com/getAllMaterialsOfDepartment?idDep=$id";
      

         print(apiUrl);
        

   
    
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>; 

     for(int i =0; i<decoded['response'].length; i++){
        // if (decoded['response'][i]['idDepartment'] == widget.idDep && 
        // decoded['response'][i]['toDepartments'] == id){
             
             names.add(decoded['response'][i]['name']);
             idCourses.add(decoded['response'][i]['number']);  
        // }

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
      String flag = "";
      if(_value2 == 1){
        flag ='0';

      }
      else 
      flag = '2';
    
                          // https://core-graduation.herokuapp.com/addCourseToDepartment?idDep=60ddc9735b4d43f8eaaabf83&number=123&type=اجباري&year=2&sem=2&name=تجربه&numberOfHour=3&specialty=هندسة حاسوب&toDepartments=60ddc9735b4d43f8eaaabf83&flag=0
    final String apiUrl = "https://core-graduation.herokuapp.com/addCourseToDepartment?idDep=${widget.idDep}&name=${_name.text}&number=${_number.text}&numberOfHour=${selectedHour}&type=${typeOfcourse}&year=${yearOfcourse}&sem=${semOfcourse}&specialty=$selectedSpe&toDepartments=${widget.idDep}&flag=$flag";
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

  Widget build2(BuildContext context) {
    return     Column(children:<Widget> [
    
            
    
              // SizedBox(height :height *0.03),
    
              
    
    
               
    
              Row(children: [
    
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
    
             ]),
    
            Row(children:[Padding(
    
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
    
            ]),
    
                 Row(children:[Padding(
    
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
    
                        
    
                         value: selectedHour1,
    
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
    
                            selectedHour1 = value;
    
                          });
    
                        } ,
    
    
    
                       
    
    
    
                      ),
    
                    ),
    
                  ),
    
              ]),
    
              
    
             
    
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
    
                      value:selectedYear1,
    
    
    
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
    
                          selectedYear1 = value;
    
                        });
    
                      } ,
    
    
    
    
    
    
    
                    ),
    
                  ),
    
                ),
    
             
    ],),
    
    
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
    
                      value: selectedsem1,
    
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
    
                          selectedsem1 = value;
    
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
    
                  child: Text("التخصص", style: GoogleFonts.amiri(
    
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
    
                      value: selectedSpe1,
    
                                        //  hint: Text("اختر الفصل الدراسي"),
    
                      dropdownColor: Color.fromRGBO(206, 222, 222, 1),
    
                      elevation: 5,
    
                      iconSize: 30,
    
                     style: TextStyle(
    
                                              fontSize: 16,
    
                                              color:Colors.black,
    
                                                
    
                                              // fontWeight: FontWeight.bold,
    
                                              letterSpacing: 1.7),
    
    
    
    
    
                      
    
                     
    
                      items: spe.map((String dropDown){
    
    
    
                        return DropdownMenuItem<String>(
    
                          
    
                          value: dropDown,
    
                          child:Text(dropDown) ,
    
                        );
    
                        
    
                      }).toList(),
    
                     onChanged:(value){
    
                        setState(() {
    
                          selectedSpe1= value;
    
                        });
    
                      } ,
    
    
    
    
    
    
    
                    ),
    
                  ),
    
                ),
    
              ],),
               Row(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
                        height:MediaQuery.of(context).size. height *0.055,
                        
                         decoration: BoxDecoration(
                           
                            gradient: new LinearGradient(
                                colors: [Color.fromRGBO(206, 222, 223, 1), Color.fromRGBO(207, 222, 222, 1)]),
                            borderRadius: BorderRadius.circular(20),
                          ),
             child: InkWell(
                        onTap: ()async {
                          String responce = await checkUser2();
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
                           setState(() {
                              selectedHour1 ="لم يتم اختياره";
                           selectedSpe1="لم يتم اختياره";
                           selectedsem1 ="لم يتم اختياره";
                          depSelected ="لم يتم اختياره";
                          courseSelected = "لم يتم اختياره";
                           selectedYear1 = "لم يتم اختياره";
                           });

                            }
                            else if (responce == '0') {
                              Dialog alert = showAlert(context,'المساق مضاف مسبقا',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           setState(() {
                              selectedHour1 ="لم يتم اختياره";
                           selectedSpe1="لم يتم اختياره";
                           selectedsem1 ="لم يتم اختياره";
                          depSelected ="لم يتم اختياره";
                          courseSelected = "لم يتم اختياره";
                           selectedYear1 = "لم يتم اختياره";
                           });
                           

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
        

   
               ],);
  }
   Future checkUser2( ) async {
   var yearOfcourse ;
   var typeOfcourse;
   var semOfcourse;


   

    if(courseSelected ==""|| depSelected ==""|| selectedsem1=="" || selectedtype1=="" || selectedYear1=="") {
      return '-1';
    }
    else{
      switch(selectedYear1){
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

      if( selectedsem1 == "الفصل الأول"){
        semOfcourse ='1';
      }
      else if ( selectedsem1== "الفصل الثاني") {
        semOfcourse ='2';
      }
      else if(selectedsem1 == "غير ذلك"){
        semOfcourse ='-1';
      }

      
        typeOfcourse="اجباري";

     }
      
      String idDepto ="";
     String flag1 = '1';
    for (int i =0; i<depNames1.length; i++){
      if(depSelected == depNames1[i]){
        idDepto = idDep1[i];
        break;


      
      }
    }
String idcourse= "";
    for (int j =0;j< names.length;j++){
      if(courseSelected == names[j]){
        idcourse = idCourses[j];

      }
    }
                          // https://core-graduation.herokuapp.com/addCourseToDepartment?idDep=60ddc9735b4d43f8eaaabf83&number=123&type=اجباري&year=2&sem=2&name=تجربه&numberOfHour=3&specialty=هندسة حاسوب&toDepartments=60ddc9735b4d43f8eaaabf83&flag=0
    final String apiUrl = "https://core-graduation.herokuapp.com/addCourseToDepartment?idDep=${widget.idDep}&name=$courseSelected&number=$idcourse&numberOfHour=$selectedHour1&type=$typeOfcourse&year=$yearOfcourse&sem=$semOfcourse&specialty=$selectedSpe1&toDepartments=$idDepto&flag=$flag1";
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'][0]);
        return decoded['response'][0];
        
        
       }
   
      
    }

 Widget build1(BuildContext context){
  return Column(children:<Widget> [
        
          SizedBox(height :MediaQuery.of(context).size.height *0.03),
          Row(
            children: [
              SizedBox(height :MediaQuery.of(context).size.height *0.03),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 20, 10),
                child: Container(
           
                  child: Text("اسم المساق",style: GoogleFonts.amiri(
                                      fontSize: 18,
                                      color:Colors.grey[600],
                                        
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),),
                ),
              ),




                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height:MediaQuery.of(context).size. height * 0.06,
                   
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
            SizedBox(height:MediaQuery.of(context).size.height * 0.01),
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
                    width: MediaQuery.of(context).size.width * 0.6,
                    height:MediaQuery.of(context).size. height * 0.06,
                   
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

             SizedBox(height :MediaQuery.of(context).size.height * 0.1),
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

           Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("القسم ",style: GoogleFonts.amiri(
                                              fontSize: 18,
                                              color:Colors.black,
                                                
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7)
),
               
               Radio(
                 

                 
                 value: 1,
                  groupValue:_value2, 
                  
                  onChanged: (value){
                    setState(() {
                      _value2 = value;
                    });
                  }),
                  Text("القسم الحالي", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
               

              Radio(
                 value: 2,
                  groupValue: _value2, 
                   onChanged: (value){
                    setState(() {
                      _value2 = value;
                    });
                  }),
                Text("قسم اخر", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
          
       
          Row(children: [
            Container(child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text("التخصص", style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color:Colors.black,
                                      
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),
                                textAlign: TextAlign.center,),
            )),

            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: Container(
                
                // height: height * 0.5,
                child: DropdownButton<String>(
                  value: selectedSpe,
                                    //  hint: Text("اختر الفصل الدراسي"),
                  dropdownColor: Color.fromRGBO(206, 222, 222, 1),
                  elevation: 5,
                  iconSize: 30,
                 style: TextStyle(
                                          fontSize: 16,
                                          color:Colors.black,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),


                  
                 
                  items: spe.map((String dropDown){

                    return DropdownMenuItem<String>(
                      
                      value: dropDown,
                      child:Text(dropDown) ,
                    );
                    
                  }).toList(),
                 onChanged:(value){
                    setState(() {
                      selectedSpe = value;
                    });
                  } ,



                ),
              ),
            ),
          ],),
            Row(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 125, 0),
           child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
                        height:MediaQuery.of(context).size. height *0.055,
                        
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
                            setState(() {
                             _number.clear();
                           _name.clear();
                           selectedHour ="لم يتم اختياره";
                           selectedSpe="لم يتم اختياره";
                           selectedsem ="لم يتم اختياره";
                           _value2 =0;
                           _value = 0;
                           });

                            }
                            else if (responce == '0') {
                              Dialog alert = showAlert(context,'المساق مضاف مسبقا',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                           setState(() {
                              _number.clear();
                           _name.clear();
                           selectedHour ="لم يتم اختياره";
                           selectedSpe="لم يتم اختياره";
                           selectedsem ="لم يتم اختياره";
                           _value2 =0;
                           _value = 0;
                           });

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
        

          
        ],) ;
 } 

}




      





