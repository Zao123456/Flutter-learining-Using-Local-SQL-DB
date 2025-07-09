import 'package:flutter/material.dart';
import 'package:wintest/home_srceen/test.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child:SafeArea(
          child: Column(children: [
            Image.asset(
              'images/test.png'
              ,height: 200,
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()))
            }, child: Text('Add page'))
          ],),
        )
      ),
    );
  }
}