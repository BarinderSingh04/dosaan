import 'package:flutter/material.dart';

class JessicaSmithScreen extends StatelessWidget {
  const JessicaSmithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              Container(
              
                decoration: const BoxDecoration(
                  color: Colors.black
                ),
                child: Row(
                  
                  children: [
                    const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage("assets/images/avatar.png")),
                    const SizedBox(width: 12),
                    Column(
                      children: const [
                        Text(
                          "Jessica Smith",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("jessica_smith",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      ],
                    ),
                    const SizedBox(width: 90),
                    Image.asset("assets/images/Certified.png")
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to",
                style: TextStyle(fontSize: 18, color: Color(0xfff26b23)),
              ),
              const SizedBox(height: 14),
              Image.asset("assets/images/Mask  3079.png"),
              const SizedBox(height: 32),
              const Text(
                "Select Machine Type",
                style: TextStyle(
                    color: Color(0xff231f20),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}
