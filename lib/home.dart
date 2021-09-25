import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  int age = 0;
  String? gender;
  String? address;
  String? mobile;

  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Patient Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _formKeyScreen1.currentState?.reset();
              setState(() {
                name = null;
                age = 0;
                gender = null;
                address = null;
                mobile = null;
              });
            },
          )
        ],
      ),
      body: Form(
        key: _formKeyScreen1,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    hintText: 'Enter name.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                    ),
                  ),
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  onChanged: (String? a) {
                    if (a == null) return;
                    setState(() {
                      name = a;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Age'),
                    hintText: 'Enter age.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                    ),
                  ),
                  onChanged: (String? a) {
                    if (a == null) return;
                    setState(() {
                      age = int.parse(a);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Address'),
                    hintText: 'Enter Address.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                    ),
                  ),
                  onChanged: (String? a) {
                    if (a == null) return;
                    setState(() {
                      address = a;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text('Phone Number'),
                    hintText: 'Enter Phone Number.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                    ),
                  ),
                  onChanged: (String? a) {
                    if (a == null) return;
                    setState(() {
                      mobile = a;
                    });
                  },
                ),
              ),
              DropdownButton<String>(
                hint: const Text('Gender'),
                value: gender,
                items: ['Male', 'Female', 'Other']
                    .map((String a) => DropdownMenuItem(
                          child: Text(a),
                          value: a,
                        ))
                    .toList(),
                onChanged: (String? a) {
                  if (a == null) return;
                  setState(() {
                    gender = a;
                  });
                },
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Gynecology'),
                    onPressed: () async {
                      _formKeyScreen1.currentState!.save();
                      if (!_formKeyScreen1.currentState!.validate()) {
                        return;
                      }
                      _formKeyScreen1.currentState?.reset();
                      setState(() {
                        name = null;
                        age = 0;
                        gender = null;
                        address = null;
                        mobile = null;
                      });
                      Get.toNamed(
                        '/gyneco',
                        arguments: {
                          'name': name,
                          'gender': gender,
                          'age': age,
                          'address': address,
                          'phone': mobile,
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                  ),
                  TextButton(
                    child: const Text('Pediatric'),
                    onPressed: () {
                      _formKeyScreen1.currentState!.save();
                      if (!_formKeyScreen1.currentState!.validate()) {
                        return;
                      }
                      Get.toNamed(
                        '/pedia',
                        arguments: {
                          'name': name,
                          'gender': gender,
                          'age': age,
                          'address': address,
                          'phone': mobile,
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
