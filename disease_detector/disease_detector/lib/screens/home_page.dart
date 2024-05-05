import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:disease_detector/services/detect_service.dart';
import 'package:disease_detector/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../drawer/app_drawer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final DetectService detectService = DetectService();

  File? selectedImage;
  String imageUrl = "";
  bool _isLoading = false;
  String result = "";
  double tumorProb = 0.0;

  Future<void> _pickImageFromGallery() async {
    final cloudinary = CloudinaryPublic('dxv0vmmer', 'bpjdtpta');
    XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      print('Image picked: ${pickedImage.path}');
      try {
        setState(() {
          _isLoading = true;
        });
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedImage.path,
              resourceType: CloudinaryResourceType.Image),
        );
        setState(() {
          _isLoading = false;
          selectedImage = File(pickedImage.path);
          imageUrl = response.secureUrl;
        });
        print(response.secureUrl);
      } on CloudinaryException catch (e) {
        if (!context.mounted) return;
        _isLoading = false;
        print(e.message);
        print(e.request);
        showSnackBar(context, "Failed to upload images");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: const Text(
          "Brain Tumor Detector",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Please Input Brain CT-Scan Image",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(imageUrl == "" ? "" : imageUrl),
              selectedImage != null
                  ? Image.file(
                selectedImage!,
                height: 300,
                width: 300,
              )
                  : Image.asset(
                "assets/tumor.png",
                height: 250,
                width: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    result = "";
                  });
                  _pickImageFromGallery();
                },
                color: Colors.blue,
                minWidth: double.infinity,
                child: Text(
                  selectedImage == null ? "Select Image" : "Change Image",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              selectedImage != null
                  ? MaterialButton(
                onPressed: () async {
                  final data = await detectService.detectDisease(
                      context: context, imageUrl: imageUrl);
                  if (data[0]) {
                    setState(() {
                      result = data[1];
                      tumorProb = data[2] * 100;
                    });
                  } else {
                    setState(() {
                      result = "";
                    });
                  }
                },
                color: Colors.green,
                minWidth: double.infinity,
                child: const Text(
                  "Detect Tumor",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              result.isNotEmpty && result != "No Tumor"
                  ? Column(
                children: [
                  Image.asset(
                    "assets/false.png",
                    height: 150,
                    width: 300,
                  ),
                  Text(
                    "You have a $result",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Tumor Probability: ${tumorProb.toStringAsFixed(2)}%",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              )
                  : result == "No Tumor"
                  ? Column(
                children: [
                  Image.asset(
                    "assets/true.png",
                    height: 150,
                    width: 300,
                  ),
                  const Text(
                    "You don't have brain tumor",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}