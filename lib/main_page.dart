import 'package:first_flutter_app/const.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 160;
  int weight = 65;
  String gender = " ";
  //MaterialColor bmiResultColor = Colors.red;
  late double bmiValue = calculaterBMI(height: height, weight: weight);
  late String bmiResultString = bmiResult(bmiValue: bmiValue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == "M"
                            ? Color.fromARGB(255, 250, 212, 156)
                            : Color.fromARGB(255, 253, 227, 187),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.male,
                            size: 150,
                          ),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == "F"
                            ? Color.fromARGB(255, 250, 212, 156)
                            : Color.fromARGB(255, 253, 227, 187),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text(
                          "$height",
                          style: kInputTextStyle,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              //height minus button
                              onPressed: () {
                                setState(() {
                                  if (height > 50) {
                                    height--;
                                    bmiValue = calculaterBMI(
                                        height: height, weight: weight);
                                    bmiResultString = bmiResult(
                                      bmiValue: bmiValue,
                                    );
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              //height add button
                              onPressed: (() {
                                setState(() {
                                  if (height < 220) {
                                    height++;
                                    bmiValue = calculaterBMI(
                                        height: height, weight: weight);
                                    bmiResultString = bmiResult(
                                      bmiValue: bmiValue,
                                    );
                                  }
                                });
                              }),
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text(
                          "$weight",
                          style: kInputTextStyle,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              //weight minus button
                              onPressed: (() {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                    bmiValue = calculaterBMI(
                                        height: height, weight: weight);
                                    bmiResultString = bmiResult(
                                      bmiValue: bmiValue,
                                    );
                                  }
                                });
                              }),
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              //weight add button
                              onPressed: (() {
                                setState(() {
                                  if (weight < 150) {
                                    weight++;
                                    bmiValue = calculaterBMI(
                                        height: height, weight: weight);
                                    bmiResultString = bmiResult(
                                      bmiValue: bmiValue,
                                    );
                                  }
                                });
                              }),
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("BMI"),
                  Text(bmiValue.toStringAsFixed(2),
                      style: kInputTextStyle.copyWith(
                          color: Colors.amber, fontSize: 60)),
                  Text(
                    bmiResultString,
                    style: kInputTextStyle.copyWith(
                        color: bmiResulultCOlor(bmiValue: bmiValue),
                        fontSize: 40),
                  )
                ],
              )
            ],
          )),
    ));
  }
}

double calculaterBMI({required int height, required int weight}) {
  return weight / ((height / 100) * (height / 100));
}

String bmiResult({required double bmiValue}) {
  if (bmiValue >= 25) {
    return "Overweight";
  } else if (bmiValue > 18.5) {
    return "Normal";
  } else {
    return "Underweight";
  }
}

MaterialColor bmiResulultCOlor({required double bmiValue}) {
  if (bmiValue >= 25) {
    return Colors.red;
  } else if (bmiValue > 18.5) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}
