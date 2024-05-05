import 'package:flutter/material.dart';

import '../utils/details_text.dart';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({super.key});

  @override
  State<ResearchScreen> createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Research on Brain Tumor"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.network(
                "https://www.labiotech.eu/wp-content/uploads/2023/05/Brain-tumor-research.jpg",
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(height: 15,),
              const Text(
                tumorResearch,
                textAlign: TextAlign.justify,
              ),
              const Text(
                tumorResearchList,
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
