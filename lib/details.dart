import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key})
      : id = Get.arguments,
        super(key: key);

  final String id;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<List> details = [], answers = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchData(),
      builder: (context, result) {
        if (result.hasData && result.data != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Details'),
            ),
            body: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: details.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      details[index][0],
                      style: const TextStyle(fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        details[index][1],
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, i) => const Divider(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> _fetchData() async {
    var collection = FirebaseFirestore.instance.collection('patient');
    var data = (await collection.doc(widget.id).get()).data();
    if (data == null) {
      details = [
        ['Error', 'Something went wrong']
      ];
    } else {
      details = [
        ['Name', data['name']],
        ['Age', (data['age'] ?? 0).toString()],
        ['Phone number', (data['phone'] ?? 'Not added')],
        ['Gender', (data['gender'] ?? 'Not selected')],
        ['Address', (data['address'] ?? 'Not added')],
      ];
      if (data['answers'].length == 10) {
        answers = [
          [
            'Q1: Do you have pain in lower abdomen?',
            data['answers'][0] ?? 'Not answered',
          ],
          [
            'Q2: Do you often have white discharge?',
            data['answers'][1] ?? 'Not answered',
          ],
          [
            'Q3: Is there itching in vagina and foul smell in the discharge?',
            data['answers'][2] ?? 'Not answered',
          ],
          [
            'Q4: Are the menstruation regular (21 to 35 days)?',
            data['answers'][3] ?? 'Not answered',
          ],
          [
            'Q5: Do you have heavy prolonged bleeding during menstruation?',
            data['answers'][4] ?? 'Not answered',
          ],
          [
            'Q6: Do you have scanty menstruation?',
            data['answers'][5] ?? 'Not answered',
          ],
          [
            'Q7: Do you have excessive stomach pain during menstruation?',
            data['answers'][6] ?? 'Not answered',
          ],
          [
            'Q8: Do you have pain during intercourse?',
            data['answers'][7] ?? 'Not answered',
          ],
          [
            'Q9: (Above 45) Do you have symptoms of menopause '
                'like hot flushes, depression or anxiety?',
            data['answers'][8] ?? 'Not answered',
          ],
          [
            'Q10: How much water do you take in a day?',
            data['answers'][9] ?? 'Not answered',
          ],
        ];
      } else {
        answers = [
          [
            'Q1: What is weight of the child?',
            data['answers'][0] ?? 'Not answered',
          ],
          [
            'Q2: What is the height of the child?',
            data['answers'][1] ?? 'Not answered',
          ],
          [
            'Q3: What is the mid arm circumference of the child?',
            data['answers'][2] ?? 'Not answered',
          ],
          [
            'Q4: What is appetite?',
            data['answers'][3] ?? 'Not answered',
          ],
          [
            'Q5: ',
            data['answers'][4] ?? 'Not answered',
          ],
          [
            'Q6: How much isilk intake?',
            data['answers'][5] ?? 'Not answered',
          ],
          [
            'Q7: How many times he/she takes solid food?',
            data['answers'][6] ?? 'Not answered',
          ],
          [
            'Q8: What solid food?',
            data['answers'][7] ?? 'Not answered',
          ],
          [
            'Q9: Is there fruit intake?',
            data['answers'][8] ?? 'Not answered',
          ],
          [
            'Q10: If yes then how many times in a day?',
            data['answers'][9] ?? 'Not answered',
          ],
          [
            'Q11: Does the child have loose motion and stomach ache often?',
            data['answers'][10] ?? 'Not answered',
          ],
          [
            'Q12: Is he/ she prone to cold?',
            data['answers'][11] ?? 'Not answered',
          ],
          [
            'Q13: Does he/she get fever very often?',
            data['answers'][12] ?? 'Not answered',
          ],
          [
            'Q14: If he/she is taking mother\'s milk then how many times?',
            data['answers'][13] ?? 'Not answered',
          ],
          [
            'Q15: Does the child vomit very often?',
            data['answers'][13] ?? 'Not answered',
          ],
        ];
      }
      details.addAll(answers);
    }
    return true;
  }
}
