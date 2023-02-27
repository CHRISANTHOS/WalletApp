import 'package:flutter/material.dart';
class BillsList extends StatelessWidget {
  const BillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Airtime and Data'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Airtime Top-up'),
                trailing: Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Betting, Lottery and Gaming'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Cable TV'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Event Tickets'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Financial Services'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Invoice Payments'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Pay Tv'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Prepaid Card Services'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
              ListTile(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment method coming soon')));
                },
                title: const Text('Travel Hotel'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
              ),
            ],).toList()
        ),
      ),
    );
  }
}
