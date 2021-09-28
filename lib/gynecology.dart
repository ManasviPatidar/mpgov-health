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
  List<String?> answers = List.filled(11, null);

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
                  const Text(
                      'Q1 :- क्या आपको पेट के निचले हिस्से में दर्द रहता है?'),
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
                  const Text('Q2 :- क्या आपको अक्सर सफेद पानी की समय रहती है?'),
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
                  const Text('Q3 :- क्या आप की योनि में खुजाली होती है?'),
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
                      'Q4 :- योनि से होने वाले रिसाव अथवा  पानी में दुर्गंध आती है?'),
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
                      'Q5 :- क्या आपका मासिक धर्म नियमित आता है-(21 se 35 din)?'),
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
                  const Text(
                      'Q6 :- क्या आप को मासिक धर्म के दौरन लम्बे समय तक भारी ररक्तस्राव  होता है?'),
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
                  const Text('Q7 :- क्या आप को मासिक धर्म कम होता है?'),
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
                  const Text(
                      'Q8 :- क्या आप को मासिक धर्म के दौरन पेट में अधिक दर्द होता है?'),
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
                  const Text('Q9 :- क्या आप को  संभोग करते समय दर्द होता है?'),
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
                      'Q10 :-क्या आपके पास रजोनिवृति के लक्षण है जैसे गरम फ्लश अवसाद या चिंता?'),
                  DropdownButton<String>(
                    value: answers[9],
                    items: _yesAndNo(),
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
                  const Text('Q11 :- आप एक दिन में कितना पानी पी लेते हैं'),
                  DropdownButton<String>(
                    value: answers[10],
                    items: _getOptions([
                      '2-3 Glasses',
                      '4-6 Glasses',
                      '7-10 Glasses',
                    ]),
                    onChanged: (a) => _save(a, 10),
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
    return _getOptions(['हा', 'नहीं']);
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
