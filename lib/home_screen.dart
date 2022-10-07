import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            CarouselSlider(
              items: List.generate(
                3,
                (index) => Image.asset(
                  "assets/images/Mask  3079.png",
                  fit: BoxFit.fill,
                ),
              ),
              options: CarouselOptions(
                height: 180,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (entry) {
                return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(255, 226, 226, 226),
                    ));
              }).toList(),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Machine type",
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text("See All"),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6.0),
                SizedBox.fromSize(
                  size: const Size.fromHeight(200),
                  child: ListView.separated(
                    itemCount: 3,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const MachineItem();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16.0);
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Recent surveys",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Wrap(
                runSpacing: 16.0,
                children: const [
                  HistoryItem(
                    name: "Mini Excavator",
                    date: "18/07/2020",
                    model: "734TWYRR",
                    miles: "342 km",
                    year: "2018",
                  ),
                  HistoryItem(
                    name: "Mini Excavator",
                    date: "18/07/2020",
                    model: "734TWYRR",
                    miles: "342 km",
                    year: "2018",
                  ),
                  HistoryItem(
                    name: "Mini Excavator",
                    date: "18/07/2020",
                    model: "734TWYRR",
                    miles: "342 km",
                    year: "2018",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MachineItem extends StatelessWidget {
  const MachineItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints.tight(const Size(220, 170)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.black,
          ),
          child: const Icon(
            Icons.construction,
            color: Colors.grey,
            size: 100,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Mini Excavator",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SizedBox.fromSize(
        size: Size.fromHeight(padding + 60),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox.fromSize(
              size: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        "assets/images/avatar.png",
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Jessica Smith",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "jessica_smith",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/Certified.png")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
