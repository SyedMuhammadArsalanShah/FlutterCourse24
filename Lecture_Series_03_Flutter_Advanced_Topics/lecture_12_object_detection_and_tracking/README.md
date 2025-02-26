# Object Detection App - Documentation

## Overview
This Flutter application utilizes Google ML Kit's Object Detection API to detect objects in images. Users can select an image from the gallery or capture one using the camera, and the app will analyze and display detected objects.

## Permissions Required
The application requires the following permissions in `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

## Dependencies
Ensure the following dependencies are added to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^0.8.5+3
  google_mlkit_object_detection: ^0.6.0
```

## Main Components
### 1. **Main Application Widget**
```dart
void main() {
  runApp(ObjectDetectionApp());
}
```
The app starts with the `ObjectDetectionApp` class, which initializes the `MaterialApp`.

### 2. **Stateful Widget: ObjectDetectionScreen**
Handles image selection and processing.
```dart
class ObjectDetectionScreen extends StatefulWidget {
  @override
  _ObjectDetectionScreenState createState() => _ObjectDetectionScreenState();
}
```

### 3. **Image Selection and Processing**
The app allows users to pick images from the camera or gallery using `ImagePicker`.
```dart
Future<void> _pickImage(ImageSource source) async {
  final XFile? pickedFile = await _imagePicker.pickImage(source: source, imageQuality: 100);
  if (pickedFile != null) {
    setState(() {
      _selectedImage = File(pickedFile.path);
      _detectionResult = "Analyzing image...";
    });
    _analyzeImage();
  }
}
```

### 4. **Object Detection Using ML Kit**
The `_analyzeImage` method processes the selected image and detects objects.
```dart
Future<void> _analyzeImage() async {
  if (_selectedImage == null) return;

  final objectDetector = ObjectDetector(
    options: ObjectDetectorOptions(
      mode: DetectionMode.single,
      classifyObjects: true,
      multipleObjects: true,
    ),
  );

  final inputImage = InputImage.fromFile(_selectedImage!);
  final List<DetectedObject> detectedObjects = await objectDetector.processImage(inputImage);

  setState(() {
    _detectionResult = detectedObjects.isEmpty
      ? "No objects detected."
      : detectedObjects.map((obj) => obj.labels.isNotEmpty
        ? obj.labels.map((label) => "${label.text} (${(label.confidence * 100).toStringAsFixed(2)}%)").join("\n")
        : "Unlabeled Object Detected").join("\n");
  });

  objectDetector.close();
}
```

### 5. **User Interface**
The `build` method displays the image, detection results, and buttons for image selection.
```dart
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
          Text(_detectionResult, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
```

### 6. **Image Picker Buttons**
Helper function to create buttons for image selection.
```dart
Widget _buildImagePickerButton(IconData icon, String label, ImageSource source) {
  return ElevatedButton.icon(
    onPressed: () => _pickImage(source),
    icon: Icon(icon),
    label: Text(label),
  );
}
```

## Summary
- Uses **Google ML Kit** for object detection.
- Allows users to **capture or select images**.
- Displays **detected objects** with confidence percentages.
- Simple and interactive **UI with buttons** for user-friendly experience.

## Future Enhancements
- Implement real-time object detection using the camera.
- Improve UI/UX with animations and better design.
- Add additional features like text and barcode recognition.

---
**Author:** Syed Muhammad Arsalan Shah Bukhari

