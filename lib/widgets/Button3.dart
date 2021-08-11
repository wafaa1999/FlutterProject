import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button3 extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const Button3({
    Key key,
    @required this.title,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: title,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0,10, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ButtonWidget(
              text: text,
              onClicked: onClicked,
            ),
          ),
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: Size.fromHeight(10),
          
          primary: Color.fromRGBO(212, 172, 13,1,),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: GoogleFonts.amiri(fontSize: 16, color: Colors.black),
          ),
        ),
        onPressed: onClicked,
      );
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              // fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}