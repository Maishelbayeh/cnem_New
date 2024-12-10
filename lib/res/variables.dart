// ignore_for_file: non_constant_identifier_names

import 'package:cenem/main.dart';
import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/model/paymentModel.dart';
import 'package:cenem/model/paymentTable.dart';
import 'package:cenem/model/userModel.dart';
import 'package:flutter/material.dart';

String userId = '';
bool confirmEmail = false;
String phoneNumber = '';
bool ismember = false;
bool isfreemember = false;
double money = 20;
ValueNotifier<bool> visibleTree = ValueNotifier<bool>(false);

TextEditingController pass = TextEditingController();
TextEditingController parentToken = TextEditingController(text: '00000');
DateTime? selectedDate;

User user = userService.loadUser()!;
late Member mem;
late User Loadduser;
late String formattedDate;
late DateTime birthdate;
bool isSuperAdmin = storageService.loadBool('isSuperAdmin') ?? false;
String email = storageService.loadString("email") ?? user.email;
String phone = storageService.loadString("phone") ?? user.phone;
String authtoken = storageService.loadString("auth") ?? user.authToken!;
String parentName = storageService.loadString("parent") ?? "";
String responseJson = '''

  ''';
String x_api = '';
Subscription? sub = subscriptionService.loadSubscription();

int? offspringMembersCount;
late List<Children> responseJsonchildren;
int countOrange = 0; // encodeClassification 101
int countGreen = 0; // encodeClassification 100
int countRed = 0; // encodeClassification 103
int countBlack = 0; // encodeClassification 102
int countBlue = 0; // encodeClassification 102

List<SubscriptionPayment>? subscriptionPayment;
