import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GynecologyPage extends StatefulWidget {
  GynecologyPage({Key? key})
      : data = Get.arguments,
        super(key: key);

  final Map<String, dynamic> data;

  @override
  _GynecologyPageState createState() => _GynecologyPageState();
}

class _GynecologyPageState extends State<GynecologyPage> {
  late List<String?> answers;

  late Map<String, dynamic> data;

  @override
  void initState() {
    data = widget.data;
    answers = List.filled(10, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gynecology'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Q1 :- Do you have pain in lower abdomen?'),
                  DropdownButton<String>(
                    value: answers[0],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[0] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Q2 :- Do you often have white discharge?'),
                  DropdownButton<String>(
                    value: answers[1],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[1] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q3 :- Is there itching in vagina and foul smell in the discharge?'),
                  DropdownButton<String>(
                    value: answers[2],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[2] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q4 :- Are the menstruation regular (21 to 35 days)?'),
                  DropdownButton<String>(
                    value: answers[3],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[3] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q5 :- Do you have heavy prolonged bleeding during menstruation?'),
                  DropdownButton<String>(
                    value: answers[4],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[4] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Q6 :- Do you have scanty menstruation?'),
                  DropdownButton<String>(
                    value: answers[5],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[5] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q7 :- Do you have excessive stomach pain during menstruation?'),
                  DropdownButton<String>(
                    value: answers[6],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[6] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Q8 :- Do you have pain during intercourse?'),
                  DropdownButton<String>(
                    value: answers[7],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[7] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q9 :- (Above 45) Do you have symptoms of menopause like hot flushes, depression or anxiety?'),
                  DropdownButton<String>(
                    value: answers[8],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[8] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Q10 :- How much water do you take in a day (8-10 glass is good)'),
                  DropdownButton<String>(
                    value: answers[9],
                    items: ['2-3 Glasses', '4-6 Glasses', '7-10 Glasses']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[9] = a;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
            TextButton(
              child: const Text('Submit'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
              ),
              onPressed: () async {
                await saveUser();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveUser() async {
    CollectionReference patient =
        FirebaseFirestore.instance.collection('patient');
    await patient.add(data..addAll({'answers': answers}));
  }
}
