import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  Widget listOptions(BuildContext context){
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          tileColor: Colors.grey[200],
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment method coming soon')));
          },
          title: const Text('Debit Card'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
        ),
        ListTile(
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment method coming soon')));
          },
          title: const Text('Bank Transfer'),
          trailing: Icon(Icons.arrow_forward_ios, size: 13,),
        ),
        ListTile(
          tileColor: Colors.grey[200],
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment method coming soon')));
          },
          title: const Text('Via USSD'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
        ),
        ListTile(
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment method coming soon')));
          },
          title: const Text('Internet Banking'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
        ),
        ListTile(
          tileColor: Colors.grey[200],
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment method coming soon')));
          },
          title: const Text('Other Wallet'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
        ),
      ],).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Text('Top Up', style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          listOptions(context),
          Container(
              padding: EdgeInsets.all(10),
              child: Text('1.Deposit is free, there is no transction fees' ,style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),))
        ],
      ),
    );
  }
}
