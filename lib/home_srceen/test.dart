import 'package:flutter/material.dart';
import 'package:wintest/models/data.dart';
import 'package:wintest/utils/databast_helper.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  List<String> text = ['', '', '', '', '', ''];
  DatabaseHelper dp = DatabaseHelper();
  List<Data> savedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Add New Item',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[0],
                          decoration: InputDecoration(hintText: 'Add new item'),
                          onChanged: (value) {
                            setState(() {
                              text[0] = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[1],
                          decoration: InputDecoration(hintText: 'Country'),
                          onChanged: (value) {
                            setState(() {
                              text[1] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[2],
                          decoration: InputDecoration(hintText: 'Costs'),
                          onChanged: (value) {
                            setState(() {
                              text[2] = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[3],
                          decoration: InputDecoration(hintText: 'Shipping Cost'),
                          onChanged: (value) {
                            setState(() {
                              text[3] = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () async {
                          Data newData = Data(
                            text[1],
                            text[0],
                            double.tryParse(text[2]),
                            double.tryParse(text[3]),
                            double.tryParse(text[4]),
                            double.tryParse(text[5]), // Assuming earnings is calculated later
                          );
                          await dp.insertData(newData);
                          print('Submitted');
                          setState(() {
                            for (int i = 0; i <= 5; i++) {
                              controllers[i].text = '';
                              text[i] = '';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[4],
                          decoration: InputDecoration(hintText: 'Buying price'),
                          onChanged: (value) {
                            setState(() {
                              text[4] = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: TextField(
                          controller: controllers[5],
                          decoration: InputDecoration(hintText: 'Selling price'),
                          onChanged: (value) {
                            setState(() {
                              text[5] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}