import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand='✊';
  String computerHand='✊';
  String result='あいこ';

  void selectHand(String selectedHand) {
    myHand=selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  String randomNumberToHand(int randomNumber){
    switch(randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌';
      case 2:
        return '🖐';
      default:
        return '✊';
    }
  }

  void generateComputerHand() {
    final randomNumber=Random().nextInt(3);
    computerHand=randomNumberToHand(randomNumber);
  }

  void judge() {
    if (myHand==computerHand) {
      result = 'あいこ';
    } else if (myHand=='✊' && computerHand=='✌' || myHand=='✌' && computerHand == '🖐' || myHand=='🖐' && computerHand=='✊') {
      result = 'あなたの勝ち';
    } else {
      result = 'あなたの負け';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(computerHand,style:const TextStyle(fontSize: 32)),
            Text(result,style: const TextStyle(fontSize: 48),),
            Text(myHand, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){selectHand('✊');}, child: const Text('✊'),),
                ElevatedButton(onPressed: (){selectHand('✌');}, child: const Text('✌'),),
                ElevatedButton(onPressed: (){selectHand('🖐');}, child: const Text('🖐'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}