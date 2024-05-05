import 'package:flutter/material.dart';

import '../utils/details_text.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Treatment of Brain Tumor"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(
                "assets/treatment.png",
                width: double.infinity,
                height: 200,
              ),
              const Text(
                tumorTreatment,
                textAlign: TextAlign.justify,
              ),
              const Text(
                tumorTreatmentList,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
