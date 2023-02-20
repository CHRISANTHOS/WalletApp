import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walleet/model/transaction_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TransactionData>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Wallet', style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 3,
                                ),
                                Text('Active', style: GoogleFonts.poppins(fontSize: 13),)
                              ],
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('images/me.png'),
                              backgroundColor: Colors.transparent,
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black45,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Balance', style: GoogleFonts.poppins(fontSize: 15),),
                                      SizedBox(height: 3,),
                                      Text('\$10000', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Card', style: GoogleFonts.poppins(fontSize: 15),),
                                    SizedBox(height: 3,),
                                    Text('Visa', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlindButton(text: 'Transfer', icon: Iconsax.convert, onpressed: () {  },),
                            OutlindButton(text: 'Payment', icon: Iconsax.export, onpressed: () {  },),
                            OutlindButton(text: 'Payout', icon: Iconsax.money_send, onpressed: () {  },),
                            OutlindButton(text: 'Top up', icon: Iconsax.add, onpressed: () {  },)
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Last Transaction', style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.bold),),
                            Text('View All', style: GoogleFonts.poppins(fontSize: 13),)
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: vm.transData.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              leading: CircleAvatar(
                                child: Image.asset(vm.transData[index]['icon'].toString()),
                              ),
                              title: Text(vm.transData[index]['title'].toString(), style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),),
                              subtitle: Text(vm.transData[index]['subTitle'].toString(), style: GoogleFonts.poppins(fontSize: 13),),
                              trailing: Text('\$${vm.transData[index]['amount']}', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [

                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingNavbar(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  selectedBackgroundColor: Colors.transparent,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white30,
                  backgroundColor: Colors.black,
                  borderRadius: 24,
                  iconSize: 30,
                  items: [
                    FloatingNavbarItem(icon: Iconsax.home1),
                    FloatingNavbarItem(icon: Iconsax.chart),
                    FloatingNavbarItem(icon: Iconsax.notification),
                    FloatingNavbarItem(icon: Iconsax.setting)
                  ],
                  currentIndex: index,
                  onTap: (i) {
                    setState((){
                      index = i;
                      controller.jumpToPage(index);
                    });
                  },

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutlindButton extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onpressed;
  OutlindButton({required this.text, required this.icon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(onPressed: onpressed, child: Icon(icon, color: Colors.black45,), style: OutlinedButton.styleFrom(
          shape: CircleBorder(),
          side: BorderSide(color: Colors.transparent),
          padding: EdgeInsets.all(10),
          elevation: 5,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.withOpacity(0.2)
        ),),
        SizedBox(height: 3,),
        Text(text, style: GoogleFonts.poppins(fontSize: 15),),
      ],
    );
  }
}
