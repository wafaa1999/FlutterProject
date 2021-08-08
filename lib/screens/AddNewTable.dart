import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/showtables.dart';

import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/button.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:graduationproject/widgets/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewTable extends StatefulWidget {
  final String idDep;
  final String instName;
  final String depName;

  const AddNewTable({Key key, this.idDep, this.instName, this.depName}) : super(key: key);

  @override
  _AddNewTableState createState() => _AddNewTableState();
}

class _AddNewTableState extends State<AddNewTable> {
    
    final _name = TextEditingController();
    int _value1 =0;
    int index =0;
    bool first = false;
    String year;
      List<String> tablenames = [];
     List<String> status = [];
     List<String> years=[];
List <String> values=[
  '2016/2017','2017/2018',
  '2018/2019','2019/2020',
  '2020/2021','2021/2022',
  '2022/2023','2023/2024',
  '2025/2026','2026/2027',
  '2027/2028','2028/2028',
  '2028/2029','2029/2030',
  '2030/2031','2031/2032',
  '2032/2033','2033/2034',
  '2034/2035','2035/2036',

];

 

    @override
    void initState() { 
      super.initState();
      
      
    }
 
  Future addnewtable () async {
    
    String semester;
    if(_value1 == 1)
      semester = '1';
      else semester = "2";
    print(semester);
    print(_value1);
    print(year);
    print(_name.text);

    final String apiUrl = "https://core-graduation.herokuapp.com/addTable?idDep=${widget.idDep}&name=${_name.text}&year=$year&semester=$semester&status=new";
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;
        print(decoded['response'][0]);
        return decoded['response'][0]['flag'];
      }
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
       years.add(decoded['response'][i]['year']);

      
       }
     print(tablenames);
     print(status);
        
       }
    return 1 ;

    

      }
    
    

  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     return Scaffold(
        drawer: AppDrawer(
             ),
      appBar:AppBar(
            // backgroundColor: Color(0xFFF5CEB8),
            title: Text(
                              "اضافة بيانات جدول جديد",
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
                            int resp = await getalltables();
                            if(resp == 1){
                              Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         AllTableshow(
                                        idDep:widget.idDep,
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        tablenames:tablenames,
                                        status:status,
                                        year:years 
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
           
                  child: Text("اسم الجدول ",style: GoogleFonts.amiri(
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
          
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Text("الفصل الدراسي ",style: GoogleFonts.amiri(
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
                    });
                  }),
                  Text("الفصل الاول", style: GoogleFonts.amiri(
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
                  }),
                Text("الفصل الثاني", style: GoogleFonts.amiri(
                                  fontSize: 16,
                                  color:Colors.black,
                                    
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             
             
             
             ],),
           ),
        
        Padding(
             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: Row(children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("السنة الدراسية",style: GoogleFonts.amiri(
                                                fontSize: 18,
                                                color:Colors.black,
                                                  
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.7)
),
               ),
               

              
               ButtonWidget(
                onClicked: ()
                 => Utils.showSheet(
                  context,
                  child: buildCustomPicker(),
                  onClicked: () {
                    setState(() {
                      first = true;

                    });

                    final value = values[index];
                    year = values[index];
                    
                    print(value);
                    // Utils.showSnackBar(context, 'Selected "$value"');

                    Navigator.pop(context);
                  },
                ),
              ),
           
          
],),
           ),

           first ?Row(children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
             child: Container(
                width:MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05 ,

                 decoration: BoxDecoration(
                   
                             
                              gradient: new LinearGradient(

                                  colors: [Color.fromRGBO(212, 172, 13,1,),Color.fromRGBO(212, 172, 13,1,)]),
                              borderRadius: BorderRadius.circular(5),
                            ),
               child: Center(
                 child: Text("${values[index]}",style: GoogleFonts.amiri(
                                                          fontSize: 17,
                                                          color:Colors.black,
                                                            
                                                          fontWeight: FontWeight.bold,
                                                          letterSpacing: 1.7),),
               ),
             ),
           ),
           ],):SizedBox(height: 10,),
        
         Row(children: [
          SizedBox(height: height * 0.1,),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
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
                         
                          if ( _name.text.isNotEmpty && year != ""&& _value1 !=0){
                          String resp = await addnewtable();
                          if(resp == 'true'){
                            Dialog alert = showAlert(context,'تم اضافة بيانات الجدول!',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }else{
                            Dialog alert = showAlert(context,'اسم الجدول موجود مسبقا ',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                          }
                          



                          }
                          else {
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                     

                          }
                          
                          _name.clear();
                          year = "";
                          setState(() {
                            first = false;
                          });

                     
                      
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
 Widget buildCustomPicker() => SizedBox(
        height: 250,
        child: CupertinoPicker(
          
          itemExtent: 64,
          diameterRatio: 0.7,
          looping: true,
          //  selectionOverlay:,
          //   CupertinoPickerDefaultSelectionOverlay(
          //   background: Colors.pink.withOpacity(0.12),
          // ),
          onSelectedItemChanged: (index) =>
           setState(() => this.index = index),
          // selectionOverlay: Container(),
         
          children: Utils.modelBuilder<String>(
            values,
            (index, value) {
              // print(1);
              // print(values[index]);
              // print(5);
              // print(value);
              final isSelected = this.index == index;
         
              final color = isSelected ?Colors.grey[400]:Color.fromRGBO(212, 172, 13,1,);

              return Center(
                child: Text(
                  value,
                  style: TextStyle(color: color, fontSize: 20),
                ),
              );
            },
          ),
        ),
      );



  


}