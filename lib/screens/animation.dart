import 'package:flutter/material.dart';
import 'package:news_app/screens/CountrySelection.dart';
import 'country_selection_screen.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationState();
}

class _AnimationState extends State<AnimationScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimationText;
  late Animation<Offset> slideAnimationImage;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slideAnimationImage = Tween<Offset>(
      begin: const Offset(0, -8),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    slideAnimationText = Tween<Offset>(
      begin: const Offset(0, 8),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    animationController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CountrySelectionScreen()),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: slideAnimationImage,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    "https://images.pexels.com/photos/167538/pexels-photo-167538.jpeg",
                    height: 200,
                  ),
                ),
              ),
              SlideTransition(
                position: slideAnimationText,
                child: const Text(
                  "Read News",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}