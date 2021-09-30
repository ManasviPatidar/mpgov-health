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
        ['Name', data['name'] ?? 'NAME'],
        ['Age', (data['age'] ?? 0).toString()],
        ['Phone number', (data['phone'] ?? 'Not added')],
        ['Gender', (data['gender'] ?? 'Not selected')],
        ['Address', (data['address'] ?? 'Not added')],
      ];
      if (data['answers'].length == 11) {
        answers = [
          [
            'Q1: क्या आपको पेट के निचले हिस्से में दर्द रहता है?',
            data['answers'][0] ?? 'Not answered',
          ],
          [
            'Q2: क्या आपको अक्सर सफेद पानी की समय रहती है?',
            data['answers'][1] ?? 'Not answered',
          ],
          [
            'Q3: क्या आप की योनि में खुजाली होती है?',
            data['answers'][2] ?? 'Not answered',
          ],
          [
            'Q4: योनि से होने वाले रिसाव अथवा  पानी में दुर्गंध आती है?',
            data['answers'][3] ?? 'Not answered',
          ],
          [
            'Q5: क्या आपका मासिक धर्म नियमित आता है-(21 se 35 din)?',
            data['answers'][4] ?? 'Not answered',
          ],
          [
            'Q6: क्या आप को मासिक धर्म के दौरन लम्बे समय तक भारी ररक्तस्राव  होता है?',
            data['answers'][5] ?? 'Not answered',
          ],
          [
            'Q7: क्या आप को मासिक धर्म कम होता है?',
            data['answers'][6] ?? 'Not answered',
          ],
          [
            'Q8: क्या आप को मासिक धर्म के दौरन पेट में अधिक दर्द होता है?',
            data['answers'][7] ?? 'Not answered',
          ],
          [
            'Q9: क्या आप को  संभोग करते समय दर्द होता है?',
            data['answers'][8] ?? 'Not answered',
          ],
          [
            'Q10: क्या आपके पास रजोनिवृति के लक्षण है जैसे गरम फ्लश अवसाद या चिंता?',
            data['answers'][9] ?? 'Not answered',
          ],
          [
            'Q11: आप एक दिन में कितना पानी पी लेते हैं?',
            data['answers'][10] ?? 'Not answered',
          ],
        ];
      } else {
        answers = [
          [
            'Q1: बच्चे की आयु?',
            data['answers'][0] ?? 'Not answered',
          ],
          [
            'Q2: बच्चे का वजन?',
            data['answers'][1] ?? 'Not answered',
          ],
          [
            'Q3: बच्चे की ऊंचाई?',
            data['answers'][2] ?? 'Not answered',
          ],
          [
            'Q4: बच्चे की ग्रेड?',
            data['answers'][3] ?? 'Not answered',
          ],
          [
            'Q5: बच्चे की भुख का स्तर',
            data['answers'][4] ?? 'Not answered',
          ],
          [
            'Q6: क्या बच्चा मिट्टी, चुना खाता है?',
            data['answers'][5] ?? 'Not answered',
          ],
          [
            'Q7: बच्चा कितनी बार दूध पिता है?',
            data['answers'][6] ?? 'Not answered',
          ],
          [
            'Q8: बच्चा कितनी बार थोस अहार लेता है?',
            data['answers'][7] ?? 'Not answered',
          ],
          [
            'Q9: थोस आहार?',
            data['answers'][8] ?? 'Not answered',
          ],
          [
            'Q10: क्या बच्चा फल खाता है?',
            data['answers'][9] ?? 'Not answered',
          ],
          [
            'Q11: कितनी बार फल खाता है?',
            data['answers'][10] ?? 'Not answered',
          ],
          [
            'Q12: क्या बच्चे को अक्सर थंडी लगती है?',
            data['answers'][11] ?? 'Not answered',
          ],
          [
            'Q13: क्या बच्चे को अक्सर बुखार आता-है?',
            data['answers'][12] ?? 'Not answered',
          ],
          [
            'Q14: बच्चा मां का दूध कितनी बार पिता है?',
            data['answers'][13] ?? 'Not answered',
          ],
          [
            'Q15: क्या बच्चा अक्सर उल्टी करता है?',
            data['answers'][14] ?? 'Not answered',
          ],
          [
            'Q16: अगर बच्चा उल्टी करता है तो कितनी बार करता है?',
            data['answers'][15] ?? 'Not answered',
          ],
        ];
      }
      details.addAll(answers);
    }
    return true;
  }
}
