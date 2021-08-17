import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({Key key, this.text, this.onChanged, this.hintText}) : super(key: key);

  
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle:  GoogleFonts.amiri(
                                              fontSize: 16,
                                              color:Colors.black,
                                                
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7,
                                              height: 1.32),
          border: InputBorder.none,
        ),
        style:  GoogleFonts.amiri(
                                              fontSize: 17,
                                              color:Colors.black,
                                                
                                              // fontWeight: FontWeight.bold,
                                              letterSpacing: 1.7,
                                              height: 1.32,
                                              ),
        onChanged: widget.onChanged,
      ),
    );
  }
}







