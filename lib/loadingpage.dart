import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cashtrack/studparentpage.dart'; // Import the StudParent screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashTrack',
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController for continuous rotation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // Rotate indefinitely

    // Simulate loading for 3 seconds then navigate to StudParent page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const studparent()),
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Entire screen is black
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Centered "Logo" and text in the middle of the screen
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo container with rounded edges
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF252525),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Text(
                          'CT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Text below the logo with custom font and padding
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'CashTrack',
                        style: TextStyle(
                          fontFamily: 'InstrumentalSans', // Ensure this font is added in your pubspec.yaml
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF04CF73),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Rotating group of triangles at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationController.value * 2 * math.pi,
                    child: CustomPaint(
                      size: const Size(80, 80),
                      painter: TrianglesPainter(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom painter to draw a set of triangles arranged radially.
class TrianglesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;
    const triangleCount = 5;

    for (int i = 0; i < triangleCount; i++) {
      final angle = 2 * math.pi * i / triangleCount;
      final path = Path();

      // Coordinates for the triangle’s corners
      final p1 = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      final p2 = Offset(
        center.dx + radius * math.cos(angle + 0.3),
        center.dy + radius * math.sin(angle + 0.3),
      );
      final p3 = center; // tip of the triangle at the center

      path.moveTo(p1.dx, p1.dy);
      path.lineTo(p2.dx, p2.dy);
      path.lineTo(p3.dx, p3.dy);
      path.close();

      // Alternate colors for the triangles
      paint.color = (i % 2 == 0) ? Colors.yellow : Colors.blueAccent;
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(TrianglesPainter oldDelegate) => false;
}
