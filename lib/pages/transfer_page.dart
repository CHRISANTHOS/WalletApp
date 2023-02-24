import 'package:flutter/material.dart';
import 'package:walleet/widgets/card.dart';
import 'package:walleet/utils/constants.dart';
import 'package:walleet/widgets/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walleet/model/transaction_data.dart';

enum MoneyTo{
  myAcc,
  otherAcc
}

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  MoneyTo? moneyTo;

  Widget _myAccForm(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Amount', style: GoogleFonts.poppins(fontSize: 15)),
            SizedBox(height: 5,),
            TextField(
              decoration: kTextFieldInputDecoration.copyWith(
                  labelText: 'e.g: 2000'
              ),
            ),
            const Spacer(),
            Align(child: RoundedButton(color: Colors.black, text: 'Send money', onPressed: (){}))
          ],
        ),
      ),
    );
  }

  String? selectedBank;

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<TransactionData>(context);
    DropdownButton<String> androidDropdown() {
      List<DropdownMenuItem<String>> dropdownItems = [];
      for (String bank in vm.banks) {
        var newItem = DropdownMenuItem(
          child: Text(bank),
          value: bank,
        );
        dropdownItems.add(newItem);
      }

      return DropdownButton<String>(
        hint: const Text('Select bank'),
        isExpanded: true,
        value: selectedBank,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedBank = value;
          });
        },
        underline: Container(),
      );
    }

    Widget _otherAcc(){
      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter beneficiary account', style: GoogleFonts.poppins(fontSize: 15)),
                SizedBox(height: 5,),
                TextField(
                  decoration: kTextFieldInputDecoration.copyWith(
                      labelText: 'e.g: 1234567890'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Choose bank', style: GoogleFonts.poppins(fontSize: 15)),
                DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: androidDropdown(),
                    )),
                SizedBox(
                  height: 15,
                ),
                Text('Enter Description', style: GoogleFonts.poppins(fontSize: 15)),
                SizedBox(height: 5,),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: kTextFieldInputDecoration.copyWith(
                      labelText: 'e.g: Food Budget'
                  ),
                ),
                SizedBox(height: 10,),
                Text('Enter Amount', style: GoogleFonts.poppins(fontSize: 15)),
                SizedBox(height: 5,),
                TextField(
                  decoration: kTextFieldInputDecoration.copyWith(
                      labelText: 'e.g: 2000'
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget transferBody(){
      switch(moneyTo){
        case MoneyTo.myAcc:
          return _myAccForm();
        case MoneyTo.otherAcc:
          return _otherAcc();
        default:
          return Align(child: Text('Select Account', style: GoogleFonts.poppins(
              fontSize: 15, fontWeight: FontWeight.bold)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Text('Transfer money', style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ReusableCard(colour: moneyTo == MoneyTo.myAcc? kUncardColours : kCardColours, cardChild: Text('Send to my Acc'), gesture: (){
                setState(() {
                  moneyTo = MoneyTo.myAcc;
                });
              }),
              ReusableCard(colour: moneyTo == MoneyTo.otherAcc? kUncardColours : kCardColours, cardChild: Text('Send to Other Acc'), gesture: (){
                setState(() {
                  moneyTo = MoneyTo.otherAcc;
                });
              })
            ],
          ),
          SizedBox(height: 5,),
          transferBody(),
          moneyTo == MoneyTo.otherAcc? Align(child: RoundedButton(color: Colors.black, text: 'Send money', onPressed: (){})) : Container()
        ],
      ),
    );
  }
}
