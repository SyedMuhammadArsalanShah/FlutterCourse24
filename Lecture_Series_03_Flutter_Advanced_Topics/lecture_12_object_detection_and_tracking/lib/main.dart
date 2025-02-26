

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

void main() {
  runApp(ObjectDetectionApp());
}

/// Main Application Widget
class ObjectDetectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ObjectDetectionScreen(),
    );
  }
}

/// Stateful Widget for Object Detection
class ObjectDetectionScreen extends StatefulWidget {
  @override
  _ObjectDetectionScreenState createState() {
    return _ObjectDetectionScreenState();
  }
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  String _detectionResult = "No objects detected.";

  /// Opens the image picker and allows the user to select an image.
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 100, // High-quality image
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _detectionResult = "Analyzing image...";
      });

      _analyzeImage();
    }
  }

  /// Processes the selected image and detects objects.
  Future<void> _analyzeImage() async {
    if (_selectedImage == null) {
      return;
    }

    final objectDetector = ObjectDetector(
      options: ObjectDetectorOptions(
        mode: DetectionMode.single,
        classifyObjects: true, // Enables classification
        multipleObjects: true, // Detects multiple objects
      ),
    );

    final inputImage = InputImage.fromFile(_selectedImage!);
    final List<DetectedObject> detectedObjects = await objectDetector.processImage(inputImage);

    if (detectedObjects.isEmpty) {
      setState(() {
        _detectionResult = "No objects detected.";
      });
    } else {
      String result = "";

      for (var object in detectedObjects) {
        if (object.labels.isNotEmpty) {
          for (var label in object.labels) {
            result += "${label.text} (${(label.confidence * 100).toStringAsFixed(2)}%)\n";
          }
        } else {
          result += "Unlabeled Object Detected\n";
        }
      }

      setState(() {
        _detectionResult = result.trim();
      });
    }

    objectDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Object Detection")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null)
              Column(
                children: [
                  Image.file(_selectedImage!, height: 250, fit: BoxFit.cover),
                  SizedBox(height: 20),
                ],
              ),
            Text(
              _detectionResult,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImagePickerButton(Icons.camera_alt, "Camera", ImageSource.camera),
                _buildImagePickerButton(Icons.photo_library, "Gallery", ImageSource.gallery),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Creates an image picker button.
  Widget _buildImagePickerButton(IconData icon, String label, ImageSource source) {
    return ElevatedButton.icon(
      onPressed: () {
        _pickImage(source);
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
