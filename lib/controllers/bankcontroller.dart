import 'dart:convert';

import 'package:get/get.dart';

class Bankcontroller extends GetxController {
  var orderNumber = ''.obs;
  var customerName = ''.obs;
  var address = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var postalCode = ''.obs;
  var country = ''.obs;
  var cardType = ''.obs;
  var cardNumber = ''.obs;
  var expiryDate = ''.obs;
  var totalAmount = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

void fetchData() {
    
    String jsonResponse = '''
    {
      "orderNumber": "REF680445545",
      "customerName": "Youness Khdeirr",
      "address": "Ramallah",
      "city": "Ramallah",
      "state": "PS-RBH",
      "postalCode": "900430",
      "country": "Palestinian Territories",
      "cardType": "visa",
      "cardNumber": "xxxxxxxxxxxx3705",
      "expiryDate": "03-2026",
      "totalAmount": "\$50",
      "experimentalField1": "value1",
      "experimentalField2": "value2"
    }
    ''';

    
    var data = json.decode(jsonResponse);

  
    orderNumber.value = data['orderNumber'] ?? '';
    customerName.value = data['customerName'] ?? '';
    address.value = data['address'] ?? '';
    city.value = data['city'] ?? '';
    state.value = data['state'] ?? '';
    postalCode.value = data['postalCode'] ?? '';
    country.value = data['country'] ?? '';
    cardType.value = data['cardType'] ?? '';
    cardNumber.value = data['cardNumber'] ?? '';
    expiryDate.value = data['expiryDate'] ?? '';
    totalAmount.value = data['totalAmount'] ?? '';

  }
}
