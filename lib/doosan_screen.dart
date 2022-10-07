import 'package:flutter/material.dart';

class DoosanScreen extends StatelessWidget {
  const DoosanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231f20),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 26),
                child: Expanded(
                  child: Column(
                    
                        children: [
                          Align(alignment: Alignment.topCenter,
                            child: Image.asset("assets/images/Logo_Black.png")),
                            const SizedBox(height: 12),
                            
                        ],
                      ),
                ),
              ),
            ),
    );
    
  }
}