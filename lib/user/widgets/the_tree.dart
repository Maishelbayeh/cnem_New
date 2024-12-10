// ignore_for_file: library_private_types_in_public_api

import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/res/variables.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TheTree(),
    );
  }
}

class TheTree extends StatelessWidget {
  const TheTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Person Tree')),
      body: PersonTree(
        person: Person(
            name: 'العملاء', isRoot: true, children: responseJsonchildren),
      ),
    );
  }
}

class Person {
  final String name;
  final bool isRoot;
  final List<Children> children;

  Person({required this.name, this.isRoot = false, required this.children});
}

class PersonTree extends StatefulWidget {
  final Person person;

  const PersonTree({super.key, required this.person});

  @override
  _PersonTreeState createState() => _PersonTreeState();
}

class _PersonTreeState extends State<PersonTree> {
  bool _expanded = false;
  late Map<int, List<Children>> _groupedData;

  @override
  void initState() {
    super.initState();
    _groupedData = _groupByPaymentId(widget.person.children);
  }

  Map<int, List<Children>> _groupByPaymentId(List<Children> children) {
    Map<int, List<Children>> groupedData = {};
    for (var child in children) {
      if (groupedData.containsKey(child.encodeMonthly)) {
        groupedData[child.encodeMonthly]!.add(child);
      } else {
        groupedData[child.encodeMonthly] = [child];
      }
    }
    return groupedData;
  }

  late String status = '';

  @override
  Widget build(BuildContext context) {
    return _buildTree(widget.person);
  }

  Widget _buildTree(Person person) {
    // Define the payment IDs we want to display
    final List<int> displayIds = [100, 101, 102, 103, 104, 105];

    return Column(
      children: [
        ListTile(
          leading: IconButton(
            icon: Icon(
              _expanded ? Icons.expand_less : Icons.expand_more,
              color: second,
            ),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
          title: const Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('تصنيف العملاء للشهر الحالي',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: second)),
              ],
            ),
          ),
        ),
        if (_expanded)
          Column(
            children: displayIds.map((int key) {
              Color backgroundColor;
              String statusText;
              int count = _groupedData[key]?.length ?? 0;

              // Check paymentid and set background color and status text accordingly
              switch (key) {
                case 105:
                  backgroundColor = Colors.white;
                  statusText = "عضو حر";
                  break;
                case 101:
                  backgroundColor = Colors.orange;
                  statusText = "عضو منتسبٍ";
                  break;
                case 100:
                  backgroundColor = Colors.green;
                  statusText = "عضو ملتزم";
                  break;
                case 103:
                  backgroundColor = Colors.red;
                  statusText = "عضو موقوف";
                  break;
                case 102:
                  backgroundColor = Colors.black;
                  statusText = "عضو مفصول";
                  break;
                case 104:
                  backgroundColor = second;
                  statusText = "عضو مجمد";
                  break;

                default:
                  backgroundColor =
                      bgColor; // No specific color if paymentid doesn't match
                  statusText = "Unknown";
              }

              // Filter the children by the current key
              final List<Children>? childrenForKey = _groupedData[key];

              return ExpansionTile(
                collapsedIconColor: second,
                collapsedShape: LinearBorder.bottom(
                    side: BorderSide(color: backgroundColor, width: 3)),
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$statusText ($count)",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: second,
                          )),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.group,
                        color: second,
                      ),
                    ],
                  ),
                ),
                children: childrenForKey != null
                    ? childrenForKey
                        .map<Widget>((Children user) => ListTile(
                              title: Row(
                                children: [
                                  Text(user.childrenName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: second,
                                      )),
                                  const Spacer(),
                                  Text(user.childrenToken,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: second,
                                      )),
                                ],
                              ),
                            ))
                        .toList()
                    : [],
              );
            }).toList(),
          ),
      ],
    );
  }
}
