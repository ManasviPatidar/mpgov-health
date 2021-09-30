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
  List<String?> answers = List.filled(16, null);

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
                  const Text('Q1 :- बच्चे की आयु?'),
                  TextField(
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
                  const Text('Q2 :- बच्चे का वजन?'),
                  TextField(
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
                  const Text('Q3 :- बच्चे की ऊंचाई?'),
                  TextField(
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
                  const Text('Q4 :- बच्चे की ग्रेड?'),
                  DropdownButton<String>(
                    value: answers[3],
                    items: _getOptions([
                      'अति गंभीर कुपोषित',
                      'मध्यम गंभीर कुपोषित',
                      'बहुत कम वजन'
                    ]),
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
                      'Q5 :- बच्चे की भुख का स्तर?'), //TODO: Add question.
                  DropdownButton<String>(
                    value: answers[4],
                    items: _getOptions(['कम', 'मध्यम', 'अच्छा']),
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
                  const Text('Q6 :- क्या बच्चा मिट्टी, चुना खाता है?'),
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
                  const Text('Q7 :- बच्चा कितनी बार दूध पिता है?'),
                  DropdownButton<String>(
                    value: answers[6],
                    items: _getOptions([' एक', 'दो', 'तीन', 'कभी नहीं']),
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
                  const Text('Q8 :- बच्चा कितनी बार थोस अहार लेता है?'),
                  DropdownButton<String>(
                    value: answers[7],
                    items: _getOptions(['एक', 'दो', 'तीन', 'कभी नहीं']),
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
                  const Text('Q9 :- थोस आहार?'),
                  DropdownButton<String>(
                    value: answers[8],
                    items: _getOptions(
                        ['दाल चावल', 'रोटी सब्जी', 'खिचड़ी', 'अन्य']),
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
                  const Text('Q10 :- क्या बच्चा फल खाता है?'),
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
                  const Text('Q11 :- कितनी बार फल खाता है?'),
                  DropdownButton<String>(
                    value: answers[10],
                    items: _getOptions(['एक', 'दो', 'तीन', 'कभी नहीं']),
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
                  const Text('Q12 :- क्या बच्चे को अक्सर थंडी लगती है?'),
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
                  const Text('Q13 :- क्या बच्चे को अक्सर बुखार आता-है?'),
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
                  const Text('Q14 :- बच्चा मां का दूध कितनी बार पिता है?'),
                  DropdownButton<String>(
                    value: answers[13],
                    items: _getOptions(['एक', 'दो', 'तीन', 'तीन से ज्यादा']),
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
                  const Text('Q15 :- क्या बच्चा अक्सर उल्टी करता है?'),
                  DropdownButton<String>(
                    value: answers[14],
                    items: _yesAndNo(),
                    onChanged: (a) => _save(a, 14),
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
                      'Q16 :- अगर बच्चा उल्टी करता है तो कितनी बार करता है?'),
                  DropdownButton<String>(
                    value: answers[15],
                    items: _getOptions(['एक', 'दो', 'तीन', 'तीन से ज्यादा']),
                    onChanged: (a) => _save(a, 15),
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
