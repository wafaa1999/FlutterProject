import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 42)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.more_time, size: 20),
            const SizedBox(width: 8),
            Text(
              'اختر السنة الدراسية',
              style: GoogleFonts.amiri(
                            letterSpacing: 1.8,
                              fontSize: 18),
            ),
          ],
        ),
        onPressed: onClicked,
      );
}