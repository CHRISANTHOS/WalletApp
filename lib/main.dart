import 'package:flutter/material.dart';
import 'package:walleet/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:walleet/model/transaction_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TransactionData(),
      child: MaterialApp(
        title: 'Wallet App',
        home: HomePage(),
      ),
    );
  }
}
