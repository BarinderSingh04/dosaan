import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class AnswerTheQuesScreen extends StatelessWidget {
  const AnswerTheQuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          
            image: DecorationImage(
                image: AssetImage("assets/images/Mask Group 3100.png"),
                fit: BoxFit.cover)),
                
              
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 0.7),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    const Text(
                      "Answer the Questionnaires",
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(fontSize: 16, color: Color(0xffd6d6d6)),
                    ),
                    const SizedBox(height: 32),
                    Container(
                     
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                      
                          border: Border.all(color: Colors.white)),
                      child: IconButton(
                          onPressed: (() {
                             Navigator.push(
                      context,
               MaterialPageRoute(builder: (context) => const LoginScreen()),);

                          }),
                          icon: const Icon(Icons.chevron_right,
                         
                              color: Color(0xfff26b23))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
