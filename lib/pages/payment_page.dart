import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walleet/widgets/bills.dart';
import 'package:walleet/utils/constants.dart';

class PaymentPage extends StatelessWidget {

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black45,
            child: Column(
              children: [
                Text('Pay Bills', style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    focusNode: focusNode,
                    cursorColor: Colors.white,
                    decoration: kTextFieldBiller.copyWith(
                        labelText: 'Find a biller e.g. PHED',
                      labelStyle: TextStyle(color: focusNode.hasFocus ? Colors.white : Colors.white30)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const BillsList(),
        ],
      ),
    );
  }
}
