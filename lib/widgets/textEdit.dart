import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<T> showTextDialog22<T>(
  BuildContext context, {
  String title ,
  String value,
  String flag,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget22(
        title: title,
 
      
      ),
    );

class TextDialogWidget22 extends StatefulWidget {
  final String title;

 

  const TextDialogWidget22({
    Key key,
    this.title,
 
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget22> {
   TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text:"");
  }

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
        content: TextField(
          controller: controller,

         decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        ),
                     
        ),
        
        actions: [
          Container(
             decoration: BoxDecoration(
                          // gradient: new LinearGradient(
                          //     colors: [Color.fromRGBO(206, 222, 222, 1), Color.fromRGBO(206, 222, 222, 1)]),
                          borderRadius: BorderRadius.circular(20),
                        ),
            child: ElevatedButton(
              child: Text('حفظ',style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color:Colors.white,
                                      
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.7),),
              onPressed: (){

               Navigator.of(context).pop(controller.text);

                }
              


       
                
           
              
            ),
          ),

           
        ],
      );
}