import 'package:flutter/material.dart';

class CreatingPdfScreen extends StatefulWidget {
  const CreatingPdfScreen({Key? key}) : super(key: key);

  @override
  State<CreatingPdfScreen> createState() => _CreatingPdfScreenState();
}

class _CreatingPdfScreenState extends State<CreatingPdfScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 800),
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231f20),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/Logo_Black.png",
              width: 150,
              height: 150,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Image.asset(
                        "assets/images/document-text.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned.fill(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: LoadingWidget(
                          onComplete: () {
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          },
                          duration: const Duration(milliseconds: 4000),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Pdf file generating",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffd8d8d8),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatefulWidget {
  final Duration duration;
  final Function? onComplete;
  const LoadingWidget({Key? key, required this.duration, this.onComplete})
      : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.duration.inMilliseconds.toDouble(),
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onComplete?.call();
    });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: _animation.value / widget.duration.inMilliseconds,
      strokeWidth: 1,
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).primaryColor,
      ),
    );
  }
}
