import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<T> showTextDialog1<T>(
  BuildContext context, {
  String title ,
  String value,
  List<String> inst,
  String selected,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => InstDialogWidget(
        title: title,
        inst:inst,
 
      
      ),
    );

class InstDialogWidget extends StatefulWidget {
  final String title;
  final List<String> inst;
  
  


  const InstDialogWidget({
    Key key, this.title, this.inst,
    

  }) : super(key: key);

  @override
  _InstDialogWidgetState createState() => _InstDialogWidgetState();
}

class _InstDialogWidgetState extends State<InstDialogWidget> {
  

  @override
  void initState() {
    super.initState();

   
  }
    String instSelected;

  @override
  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      
        title: Text(widget.title,style: GoogleFonts.amiri(
                                  fontSize: 20,
                                  color:Colors.grey[700],
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),),

        content: 
          Row(children: [

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

                    items: widget.inst.map((String dropDown){

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
        

          ],),
       
     
        
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                 decoration: BoxDecoration(
                              // gradient: new LinearGradient(
                              //     colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                child: Row(
                                  children:[ ElevatedButton(
                    child: Text('حفظ',style: GoogleFonts.amiri(
                                          fontSize: 18,
                                          color:Colors.white,
                                            
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1.7),),
                    onPressed: (){

                      
                      
                    Navigator.of(context).pop(instSelected);
                     
                        

                      }

                      
                    
                    
                  ),
                  
                  
                                  ]),
              ),
            ),
          ),

           
        ],
      );
}