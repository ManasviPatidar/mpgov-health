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
  List<String?> answers = List.filled(10, null);

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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 0),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 1),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 2),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 3),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 4),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 5),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 6),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 7),
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
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 8),
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
                    items: _getOptions([
                      '2-3 Glasses',
                      '4-6 Glasses',
                      '7-10 Glasses',
                    ]),
                    onChanged: (a) => _save(a, 9),
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
              onPressed: () async => await saveUser(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveUser() async {
    var patient = FirebaseFirestore.instance.collection('patient');
    widget.data.addAll({'answers': answers});
    await patient.add(widget.data);
  }

  List<DropdownMenuItem<String>> _yesAndNo() {
    return _getOptions(['Yes', 'No']);
  }

  List<DropdownMenuItem<String>> _getOptions(List<String> options) {
    return List.generate(
      options.length,
      (index) {
        return DropdownMenuItem(
          child: Text(options[index]),
          value: options[index],
        );
      },
    );
  }

  void _save(String? answer, int index) {
    setState(() {
      answers[index] = answer;
    });
  }
}
