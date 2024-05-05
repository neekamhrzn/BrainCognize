import 'package:disease_detector/utils/details_text.dart';
import 'package:flutter/material.dart';

class BrainTumorScreen extends StatefulWidget {
  const BrainTumorScreen({super.key});

  @override
  State<BrainTumorScreen> createState() => _BrainTumorScreenState();
}

class _BrainTumorScreenState extends State<BrainTumorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brain Tumor"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.network(
                "https://th.bing.com/th/id/OIG.zV0Sg0sqIYNDl2wPWR05?w=1024&h=1024&rs=1&pid=ImgDetMain",
                width: 300,
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                brainTumor,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "How common are brain tumors, and are they dangerous?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                brainDangerous,
                textAlign: TextAlign.justify,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
