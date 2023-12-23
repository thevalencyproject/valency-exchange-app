import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/*
[PHOTO VALIDATION FUNCTION EXAMPLE]
Future<bool> validatePhoto(XFile photo) async {
  // Implement validation logic here (send to Valency Backend)

  return result; // Return true if all checks pass, false otherwise
}

[HOW TO IMPLEMENT IN BUILD]
@override
Widget build(BuildContext context) {
  return CustomCameraWidget(
    onPhotoValidated: (XFile photo) async {
      return await validatePhoto(photo);
    },
  );
}
*/
class ValencyKYCCamera extends StatefulWidget {
  const ValencyKYCCamera({
    Key? key,
    required this.onPhotoValidated,
  }) : super(key: key);

  final Function(bool) onPhotoValidated;    // The Function called on a successful photo validation

  @override
  _ValencyKYCCameraState createState() => _ValencyKYCCameraState();
}

class _ValencyKYCCameraState extends State<ValencyKYCWidget> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isPhotoValid = false;
  XFile? _imageFile;

   @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final selfieCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,    // Set the camera to selfie cam
        orElse: () => cameras.first);
    
    _controller = CameraController(
      selfieCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      final image = await _controller!.takePicture();
      _imageFile = image;

      bool isValid = await widget.onPhotoValidated(image);    // Send the photo to the parent to validate
      setState(() {
        _isPhotoValid = isValid;  // Update the UI based on the validation result
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(_controller!),    // Display a camera preview
                Positioned(                     // Snap photo button
                  child: FloatingActionButton(
                    onPressed: _takePicture,
                    child: Icon(Icons.camera),
                  ),
                ),
                
                if (_isPhotoValid)              // Display SUCCESS if photo is valid (while parent switches to next screen)
                  Center(
                    child: Text(
                      'SUCCESS', 
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {      // Display a loading animation until camera is running
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}