import 'package:flutter/material.dart';
import 'package:food_deliver/pages/homepage.dart';
import 'package:food_deliver/widgets/shared_button.dart';
import 'package:heroicons/heroicons.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Orders"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            HeroIcon(
              HeroIcons.shoppingCart,
              style: HeroIconStyle.outline,
              size: 120,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 30),
            const Text(
              "No orders yet",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Hit the orange button down\nbelow to Create an order",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: SharedButton(
                text: "Start ordering",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
