import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(color: Color(0xffF3E4C9), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff8A5F41),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Empty'),
      )
    );
  }
}
