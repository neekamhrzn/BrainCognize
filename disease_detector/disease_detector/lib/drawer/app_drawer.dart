import 'package:disease_detector/screens/brain_tumor.dart';
import 'package:disease_detector/screens/prevention.dart';
import 'package:disease_detector/screens/research.dart';
import 'package:disease_detector/screens/treatment.dart';
import 'package:flutter/material.dart';

import '../screens/hospital_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // color: const Color.fromRGBO(242, 244, 255, 1),
      child: Drawer(
        backgroundColor: const Color.fromRGBO(242, 244, 255, 1),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                color: Colors.green,
                child: const ListTile(
                  title: Text(
                    "Brain Tumor Detector",
                  ),
                ),
              ),
              const Divider(
                height: 3,
                thickness: 3,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BrainTumorScreen()));
                },
                leading: const Icon(Icons.question_mark),
                title: const Text(
                  "What is Brain Tumor?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SymptomsAndPreventions()));
                },
                leading: const Icon(Icons.shield),
                title: const Text(
                  "Symptoms and Preventions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TreatmentScreen()));
                },
                leading: const Icon(Icons.local_hospital),
                title: const Text(
                  "Treatment of Brain Tumor",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResearchScreen()));
                },
                leading: const Icon(Icons.search),
                title: const Text(
                  "Research done on Brain Tumor",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const HospitalScreen()));
              //   },
              //   leading: const Icon(Icons.local_hospital_outlined),
              //   title: const Text(
              //     "Hospital in Nepal",
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
