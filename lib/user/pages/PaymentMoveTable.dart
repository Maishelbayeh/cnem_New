import 'package:cenem/user/widgets/top_nav.dart';
import 'package:flutter/material.dart';

// Replace this with your actual API and data model imports
import 'package:cenem/Api/paymentTable.dart';
import 'package:cenem/model/paymentTable.dart';
import 'package:cenem/view%20model/responsive.dart';

class PaymentTable extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  PaymentTable({super.key});

  final ApiServicee apiServicee = ApiServicee();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      extendBody: true,
      body: FutureBuilder<List<SubscriptionPayment>>(
        future: apiServicee.fetchSubscriptionPayments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return _buildNoDataView(); // No data message
          } else if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (Responsive.isDesktop(context)) {
                  return AvailableDriversTable(
                      payments: snapshot.data!); // Desktop table
                } else if (Responsive.isTablet(context)) {
                  return AvailableDriversTable.compactView(
                      snapshot.data!); // Tablet table
                } else {
                  return AvailableDriversTable.mobileView(
                      snapshot.data!); // Mobile view
                }
              },
            );
          } else {
            return const Center(child: Text('حدث خطأ غير متوقع.'));
          }
        },
      ),
    );
  }

  Widget _buildNoDataView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'لا يوجد عمليات دفع',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'لا توجد بيانات متاحة لعرضها حالياً',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableDriversTable extends StatelessWidget {
  final List<SubscriptionPayment> payments;

  const AvailableDriversTable({super.key, required this.payments});

  static Widget compactView(List<SubscriptionPayment> payments) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(_dateToString(payment.paymentDate)),
              subtitle: Text("المبلغ المدفوع: ${payment.amountPaid}"),
              trailing: Text(
                payment.accountActivationStatus ? "ناجح" : "قيد الانتظار",
                style: TextStyle(
                  color: payment.accountActivationStatus
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget mobileView(List<SubscriptionPayment> payments) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "التاريخ: ${_dateToString(payment.paymentDate)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("المبلغ المدفوع: ${payment.amountPaid}"),
                  Text("الرقم المرجعي: ${payment.referenceNumber}"),
                  Text(
                    payment.accountActivationStatus
                        ? "الحالة: ناجح"
                        : "الحالة: قيد الانتظار",
                    style: TextStyle(
                      color: payment.accountActivationStatus
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable(
        columnSpacing: 12,
        dataRowHeight: 56,
        headingRowHeight: 40,
        horizontalMargin: 12,
        columns: const [
          DataColumn(label: Text('تاريخ الدفع')),
          DataColumn(label: Text('المبلغ المدفوع')),
          DataColumn(label: Text('الرقم المرجعي')),
          DataColumn(label: Text('الحالة')),
        ],
        rows: payments.map((payment) {
          return DataRow(
            cells: [
              DataCell(Text(_dateToString(payment.paymentDate))),
              DataCell(Text(payment.amountPaid.toString())),
              DataCell(Text(payment.referenceNumber)),
              DataCell(Text(
                payment.accountActivationStatus ? "ناجح" : "قيد الانتظار",
                style: TextStyle(
                  color: payment.accountActivationStatus
                      ? Colors.green
                      : Colors.orange,
                ),
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}

String _dateToString(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}
