import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/screens/showIns.dart';
import 'package:graduationproject/screens/showRooms.dart';
import 'package:graduationproject/widgets/alertDialg.dart';
import 'package:graduationproject/widgets/drawer1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddInst extends StatefulWidget {
  final String idDep;
  final String depName;
  final String instName;

  const AddInst({Key key, this.idDep, this.depName, this.instName}) : super(key: key);
   

  @override
  _AddInstState createState() => _AddInstState();
}

class _AddInstState extends State<AddInst> {
    
    final _number = TextEditingController();
    final _name = TextEditingController();

     List<String> instNames = [];
  
    bool show = false;

    @override
    void initState() { 
      super.initState();
      
      
    }
  Future getInst() async {

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/getAllIsn?idDep=${widget.idDep}";
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);

     for(int i =0; i<decoded['response'].length; i++){
       instNames.add(decoded['response'][i]['name']);  
      


       }
      
       }
   print(instNames);
 
    return 1 ;

    

      }
 

  Future addInsts() async {

    print(widget.idDep);
    final String apiUrl = "https://core-graduation.herokuapp.com/addInstToDepartment?idDep=${widget.idDep}&name=${_name.text}";
    print(apiUrl);
    final response =
        await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
        Map decoded = json.decode(response.body) as Map<String, dynamic>;; 
        print(decoded['response'].length);
        return decoded['response'] ;

      


      
      
       }
  //  print(instNames);
 
    

    

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
                              "اضافة مدرس جديدة",
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
                            int responce = await getInst();
                           if(responce == 1){
                             Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                         ShowInst(
                                        instName: widget.instName,
                                        depName: widget.depName,
                                        idDep:widget.idDep,
                                        instNames: instNames,
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
           
                  child: Text("رقم المدرس",style: GoogleFonts.amiri(
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
          SizedBox(height: 15,),
             Row(
            children: [
              SizedBox(height :height *0.03),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
           
                  child: Text("اسم المدرس",style: GoogleFonts.amiri(
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
                          if (_number.text.isEmpty || _name.text.isEmpty  ){
                            Dialog alert = showAlert(context,'يجب ادخال جميع البيانات المطلوبة',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );

                          }
                 
                            else{

                          
                          String response = await addInsts( );
                           if (response == 'true'){
                             Dialog alert = showAlert(context,'تم اضافة المدرس',0);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                              setState(() {
                           
                           show = false;
                           _number.clear();
                           _name.clear();
                         });

                           }

                          
                          else {
                             Dialog alert = showAlert(context,'المدرس موجودة مسبقا',1);
                          showDialog(
                            context: context,
                           child:alert,
                           barrierDismissible: false, );
                              setState(() {
                         
                           show = false;
                           _number.clear();
                           _name.clear();
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


  


}