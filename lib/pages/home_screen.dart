import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walleet/widgets/outlind_button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'payment_page.dart';
import 'package:walleet/model/transaction_data.dart';
import 'transfer_page.dart';
import 'topUp_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TransactionData>(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet',
                      style: GoogleFonts.poppins(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Active',
                      style: GoogleFonts.poppins(fontSize: 13),
                    )
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/me.png'),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black45,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '\$10000',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Visa',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlindButton(
                  text: 'Transfer',
                  icon: Iconsax.convert,
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage()));
                  },
                ),
                OutlindButton(
                  text: 'Payment',
                  icon: Iconsax.export,
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                  },
                ),
                OutlindButton(
                  text: 'Payout',
                  icon: Iconsax.money_send,
                  onpressed: () {},
                ),
                OutlindButton(
                  text: 'Top up',
                  icon: Iconsax.add,
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TopUpPage()));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Transaction',
                  style: GoogleFonts.poppins(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All',
                  style: GoogleFonts.poppins(fontSize: 13),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: vm.transData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(vm.transData[index]['icon'].toString()),
                  ),
                  title: Text(
                    vm.transData[index]['title'].toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    vm.transData[index]['subTitle'].toString(),
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  trailing: Text(
                    '\$${vm.transData[index]['amount']}',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
