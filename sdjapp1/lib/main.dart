import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras = [];
  int currentCameraIndex = 0;
  CameraController? controller;

  XFile? capturedImage;

  double currentZoom = 1.0;
  double minZoom = 1.0;
  double maxZoom = 1.0;
  double baseZoom = 1.0;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();

    controller = CameraController(
      cameras[currentCameraIndex],
      ResolutionPreset.high,
    );

    await controller!.initialize();

    minZoom = await controller!.getMinZoomLevel();
    maxZoom = await controller!.getMaxZoomLevel();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> switchCamera() async {
    if (cameras.length < 2) return;

    currentCameraIndex =
        (currentCameraIndex + 1) % cameras.length;

    await controller?.dispose();

    controller = CameraController(
      cameras[currentCameraIndex],
      ResolutionPreset.high,
    );

    await controller!.initialize();

    minZoom = await controller!.getMinZoomLevel();
    maxZoom = await controller!.getMaxZoomLevel();
    currentZoom = 1.0;

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> takePhoto() async {
    try {
      final image = await controller!.takePicture();

      setState(() {
        capturedImage = image;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('撮影失敗: $e'),
        ),
      );
    }
  }

  Future<void> savePhoto() async {
    if (capturedImage == null) return;

    try {
      await GallerySaver.saveImage(capturedImage!.path);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('写真を保存しました'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('保存失敗: $e'),
        ),
      );
    }
  }

  Future<void> generateDisasterImage() async {
    if (capturedImage == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('災害時画像生成機能は準備中です'),
      ),
    );
  }



  Widget cameraView() {
    return Stack(
      children: [
        GestureDetector(
          onScaleStart: (details) {
            baseZoom = currentZoom;
          },
          onScaleUpdate: (details) async {
            double zoom = baseZoom * details.scale;

            if (zoom < minZoom) zoom = minZoom;
            if (zoom > maxZoom) zoom = maxZoom;

            currentZoom = zoom;

            await controller!.setZoomLevel(currentZoom);

            if (mounted) {
              setState(() {});
            }
          },
          child: SizedBox.expand(
            child: CameraPreview(controller!),
          ),
        ),

        Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${currentZoom.toStringAsFixed(1)}x',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),

        Positioned(
          top: 20,
          right: 20,
          child: FloatingActionButton(
            heroTag: "switch",
            mini: true,
            onPressed: switchCamera,
            child: const Icon(Icons.cameraswitch),
          ),
        ),

        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Center(
            child: FloatingActionButton(
              heroTag: "capture",
              onPressed: takePhoto,
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ),
      ],
    );
  }

  Widget previewView() {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.file(
            File(capturedImage!.path),
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          bottom: 40,
          left: 20,
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                capturedImage = null;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('撮り直し'),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 0,
          left: 0,
          child: Center(
              child: ElevatedButton.icon(
                onPressed: generateDisasterImage,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('災害時の画像生成'),
              ),
            ),
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: ElevatedButton.icon(
            onPressed: savePhoto,
            icon: const Icon(Icons.download),
            label: const Text('保存'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null ||
        !controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('カメラ'),
        ),
      ),
      body: capturedImage == null
          ? cameraView()
          : previewView(),
    );
  }
}