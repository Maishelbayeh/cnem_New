import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';

final Map<String, String> revenue = {
  "ارباح هذا الشهر": "0",
  "ارباح الشهر الماضي": "0",
  "ارباح اخر سته اشهر": "0",
  "ارباح السنه": "0",
};

class mobilerev extends StatefulWidget {
  const mobilerev({super.key});

  @override
  _mobilerevState createState() => _mobilerevState();
}

class _mobilerevState extends State<mobilerev> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.01), // 1% of screen width
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
        border: Border.all(color: Colors.grey, width: .5),
      ),
      child: const Column(
        children: [
          // Displaying the revenue information cards
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Wrap(
              spacing: 16.0, // Space between items in the row
              runSpacing: 16.0, // Space between rows
              alignment: WrapAlignment.start,
              children: [
                RevenueInfo(
                  title: "ارباح هذا الشهر",
                  amount: "0",
                ),
                RevenueInfo(
                  title: "ارباح الشهر الماضي",
                  amount: "0",
                ),
                RevenueInfo(
                  title: "ارباح اخر سته اشهر",
                  amount: "0",
                ),
                RevenueInfo(
                  title: "ارباح السنه",
                  amount: "0",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// RevenueInfo widget for displaying the title and amount
class RevenueInfo extends StatelessWidget {
  final String title;
  final String amount;

  const RevenueInfo({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: second, // Background color for each card
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Title text color
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Amount text color
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
