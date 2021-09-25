import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PediatricPage extends StatefulWidget {
  PediatricPage({Key? key})
      : data = Get.arguments,
        super(key: key);

  final Map<String, dynamic> data;

  @override
  _PediatricPageState createState() => _PediatricPageState();
}

class _PediatricPageState extends State<PediatricPage> {
  late List<String?> answers;

  late Map<String, dynamic> data;

  @override
  void initState() {
    data = widget.data;
    answers = List.filled(15, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pediatric'),
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
                  const Text('Q1 :- What is weight of the child?'),
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
                  const Text('Q2 :- What is the height of the child?'),
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
                      'Q3 :- What is the mid arm circumference of the child?'),
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
                  const Text('Q4 :- What is appetite?'),
                  DropdownButton<String>(
                    value: answers[3],
                    items: ['Low', 'Moderate', 'Often']
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
                  const Text('Q6 :- How much isilk intake?'),
                  DropdownButton<String>(
                    value: answers[5],
                    items: ['Once ', 'Twice', 'Never']
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
                  const Text('Q7 :- How many times he/ she takes solid food?'),
                  DropdownButton<String>(
                    value: answers[6],
                    items: ['Once ', 'Twice', 'Never']
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
                  const Text('Q8 :- What solid food?'),
                  DropdownButton<String>(
                    value: answers[7],
                    items: ['Dal chawal', 'Roti sabji', 'Khichdi']
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
                  const Text('Q9 :- Is there fruit intake?'),
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
                  const Text('Q10 :- If yes then how many times in a day?'),
                  DropdownButton<String>(
                    value: answers[9],
                    items: ['Once ', 'Twice', 'Sometimes in a week']
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
            Container(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      '11 :- Does the child have loose motion and stomach ache often?'),
                  DropdownButton<String>(
                    value: answers[10],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[10] = a;
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
                  const Text('12 :- Is he/ she prone to cold?'),
                  DropdownButton<String>(
                    value: answers[11],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[11] = a;
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
                  const Text('13 :- Does he gets fever very often'),
                  DropdownButton<String>(
                    value: answers[12],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[12] = a;
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
                      '14 :- If he/she is taking mother\'s milk then how many times ?'),
                  DropdownButton<String>(
                    value: answers[13],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[13] = a;
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
                  const Text('15 :- Does the child vomit very often?'),
                  DropdownButton<String>(
                    value: answers[14],
                    items: ['Yes', 'No']
                        .map((String a) => DropdownMenuItem(
                              child: Text(a),
                              value: a,
                            ))
                        .toList(),
                    onChanged: (String? a) {
                      setState(() {
                        answers[14] = a;
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
