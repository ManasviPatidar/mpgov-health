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
  List<String?> answers = List.filled(15, null);

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
                    items: _yesAndNo(), //TODO: Change options.
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
                  const Text('Q2 :- What is the height of the child?'),
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
                      'Q3 :- What is the mid arm circumference of the child?'),
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
                  const Text('Q4 :- What is appetite?'),
                  DropdownButton<String>(
                    value: answers[3],
                    items: _getOptions(['Low', 'Moderate', 'Often']),
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
                  const Text('Q5 :- ?'), //TODO: Add question.
                  DropdownButton<String>(
                    value: answers[4],
                    items: _getOptions(['Low', 'Moderate', 'Often']),
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
                  const Text('Q6 :- How much isilk intake?'),
                  DropdownButton<String>(
                    value: answers[5],
                    items: _getOptions(['Once ', 'Twice', 'Never']),
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
                  const Text('Q7 :- How many times he/ she takes solid food?'),
                  DropdownButton<String>(
                    value: answers[6],
                    items: _getOptions(['Once ', 'Twice', 'Never']),
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
                  const Text('Q8 :- What solid food?'),
                  DropdownButton<String>(
                    value: answers[7],
                    items: _getOptions(['Dal chawal', 'Roti sabji', 'Khichdi']),
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
                  const Text('Q9 :- Is there fruit intake?'),
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
                  const Text('Q10 :- If yes then how many times in a day?'),
                  DropdownButton<String>(
                    value: answers[9],
                    items: _getOptions([
                      'Once ',
                      'Twice',
                      'Sometimes in a week',
                    ]),
                    onChanged: (a) => _save(a, 9),
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
                  const Text('Q11 :- Does the child have loose motion '
                      'and stomach ache often?'),
                  DropdownButton<String>(
                    value: answers[10],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 10),
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
                  const Text('Q12 :- Is he/ she prone to cold?'),
                  DropdownButton<String>(
                    value: answers[11],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 11),
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
                  const Text('Q13 :- Does he/she get fever very often?'),
                  DropdownButton<String>(
                    value: answers[12],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 12),
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
                  const Text('Q14 :- If he/she is taking mother\'s milk, '
                      'then how many times?'),
                  DropdownButton<String>(
                    value: answers[13],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 13),
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
                  const Text('Q15 :- Does the child vomit very often?'),
                  DropdownButton<String>(
                    value: answers[14],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 14),
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
                Get.offNamed('/history');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveUser() async {
    var patient = FirebaseFirestore.instance.collection('patient');
    widget.data.addAll({
      'answers': answers,
      'timeAdded': DateTime.now().toIso8601String(),
    });
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
