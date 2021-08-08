import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<T> showTextDialog<T>(
  BuildContext context, {
  String title ,
  String value,
  String flag,
  String one,
  String two,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        one:one,
        two: two,
      
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String one;
  final String two;


  const TextDialogWidget({
    Key key,
    this.title,

   this.one, this.two,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  

  @override
  void initState() {
    super.initState();

   
  }
      int _value =0;


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

             Radio(
                 value: 1,
                  groupValue:_value, 
                  
                  onChanged: (value){
                    setState(() {
                      _value = value;
                    });
                  }),
                  Text(widget.one, style: GoogleFonts.amiri(
                                  fontSize: 18,
                                  color:Colors.grey,
                                    
                                   fontWeight: FontWeight.bold,
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
                Text(widget.two, style: GoogleFonts.amiri(
                                  fontSize: 18,
                                  color:Colors.grey,
                                    
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,),
             


          ],),
       
        // content: TextField(
        //   controller: controller,

        //  decoration: InputDecoration(
        //                   hintStyle: TextStyle(
        //                       fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(20),
        //                     borderSide: BorderSide(
        //                         width: 1,
        //                         style: BorderStyle.solid,
        //                         color: Colors.grey),
        //                   ),
        //                   filled: true,
        //                   fillColor: Colors.white,
        //                   contentPadding: EdgeInsets.all(12),
        //                   enabledBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(20),
        //                     borderSide: BorderSide(
        //                         width: 1,
        //                         style: BorderStyle.solid,
        //                         color: Colors.grey),
        //                   ),
        //                 ),
                     
        // ),
        
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

                      
                       if( _value == 1){
                         Navigator.of(context).pop(widget.one);
                        }
                        else Navigator.of(context).pop(widget.two);


                        

                      }

                      
                    
                    
                  ),
                  
                  
                                  ]),
              ),
            ),
          ),

           
        ],
      );
}