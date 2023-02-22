import 'package:flutter/material.dart';

class TransactionData extends ChangeNotifier{

  final List _transData = [
    {'icon': 'images/netflix.png', 'title': 'Netflix', 'subTitle': 'Month Subscription', 'amount': 12},
    {'icon': 'images/apple-music.png', 'title': 'Apple music', 'subTitle': 'Month Subscription', 'amount': 20},
    {'icon': 'images/teller.jpg', 'title': 'Quick teller', 'subTitle': 'Tax', 'amount': 17},
    {'icon': 'images/netflix.png', 'title': 'Netflix', 'subTitle': 'Month Subscription', 'amount': 12},
    {'icon': 'images/apple-music.png', 'title': 'Apple music', 'subTitle': 'Month Subscription', 'amount': 20},
    {'icon': 'images/teller.jpg', 'title': 'Quick teller', 'subTitle': 'Tax', 'amount': 17},
  ];

  get transData => _transData;

}