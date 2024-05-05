import 'package:flutter/material.dart';

import '../utils/details_text.dart';

class SymptomsAndPreventions extends StatefulWidget {
  const SymptomsAndPreventions({super.key});

  @override
  State<SymptomsAndPreventions> createState() => _SymptomsAndPreventionsState();
}

class _SymptomsAndPreventionsState extends State<SymptomsAndPreventions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Symptoms and Preventions"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Brain Tumor Symptoms",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                tumorSymptoms,
                textAlign: TextAlign.justify,
              ),
              Text(
                tumorSymptomsList,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Preventive Measures for Brain Tumor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tumorPreventive,
                textAlign: TextAlign.justify,
              ),
              Text(
                tumorPreventiveList,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
