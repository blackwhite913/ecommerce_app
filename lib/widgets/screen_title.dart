import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.ideographic,
        children: [
          IconButton(
              icon: Icon(
                Icons.chevron_left,
                size:30,
                color: Color(0xFF384a65),
              ),
              onPressed: () {}),
          Text(
            "Plant App",
            style: GoogleFonts.varelaRound(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF384a65).withOpacity(0.8),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                size: 28,
                color: Color(0xFF384a65).withOpacity(0.5),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
