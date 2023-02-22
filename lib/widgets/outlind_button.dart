import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlindButton extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onpressed;
  OutlindButton(
      {required this.text, required this.icon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onpressed,
          style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(color: Colors.transparent),
              padding: const EdgeInsets.all(10),
              elevation: 5,
              backgroundColor: Colors.white,
              shadowColor: Colors.grey.withOpacity(0.2)),
          child: Icon(
            icon,
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ],
    );
  }
}