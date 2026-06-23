import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  // Accept the central cart notifier from HomePage
  final ValueNotifier<Map<String, Map<String, dynamic>>> cartNotifier;

  const OrdersPage({super.key, required this.cartNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(
            color: Color(0xffF3E4C9),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff8A5F41),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      // Listen to the cart changes to automatically rebuild this page
      body: ValueListenableBuilder<Map<String, Map<String, dynamic>>>(
        valueListenable: cartNotifier,
        builder: (context, cartMap, child) {
          // If the cart is empty, display an empty state placeholder
          if (cartMap.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          // Calculate the total price of all items added to the cart
          double totalBill = 0.0;
          cartMap.forEach((name, details) {
            final double price = details['price'] as double? ?? 0.0;
            final int quantity = details['quantity'] as int? ?? 0;
            totalBill += price * quantity;
          });

          // Extract the keys (item names) into a list to render them in a ListView
          final itemNames = cartMap.keys.toList();

          return Column(
            children: [
              // 1. LIST OF SELECTED ITEMS
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: itemNames.length,
                  itemBuilder: (context, index) {
                    final String name = itemNames[index];
                    final Map<String, dynamic> details = cartMap[name]!;
                    final double price = details['price'] as double? ?? 0.0;
                    final int quantity = details['quantity'] as int? ?? 0;
                    final double itemTotal = price * quantity;

                    return Card(
                      color: Colors.grey.shade50,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            // Circular tag showing item quantity
                            CircleAvatar(
                              backgroundColor: const Color(
                                0xff8A5F41,
                              ).withAlpha(30),
                              child: Text(
                                '${quantity}x',
                                style: const TextStyle(
                                  color: Color(0xff8A5F41),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Item name and individual base price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${price.toStringAsFixed(2)} each',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Accumulated total item group price
                            Text(
                              '\$${itemTotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Price:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${totalBill.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff8A5F41),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Place Order Action Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement checkout process here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff8A5F41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          child: const Text(
                            'Place Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
