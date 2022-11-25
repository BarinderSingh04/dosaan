import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dosaan/models/machine.dart';
import 'package:dosaan/models/user.dart';
import 'package:dosaan/profile_screen.dart';
import 'package:dosaan/remarketing_evaluation.dart';
import 'package:dosaan/screens/machine%20type/machine_type_screen.dart';
import 'package:dosaan/services/machinetype_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'history_screen.dart';

final machineListProvider = FutureProvider<List<Machine>>((ref) async {
  return ref.watch(machineServiceProvider).getMachineType();
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final machineListState = ref.watch(machineListProvider);

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
                  "assets/images/Mask.png",
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
                  ),
                );
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
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MachineTypeScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6.0),
                machineListState.when(
                  data: (data) {
                    return SizedBox.fromSize(
                      size: const Size.fromHeight(180),
                      child: ListView.separated(
                        itemCount: data.length,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final machineType = data[index];
                          return MachineItem(
                            machineType: machineType,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 16.0);
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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
  final Machine machineType;
  const MachineItem({
    Key? key,
    required this.machineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RemarketingEvaluation(
              machine: machineType,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints.tight(const Size(210, 150)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black,
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: machineType.image,
                placeholder: (context, url) => const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.grey),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            machineType.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
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
              size: const Size.fromHeight(56),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 8.0,
                  right: 16.0,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
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
                          children: [
                            Text(
                              user?.name ?? "User",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user?.email ?? "User@gmail.com",
                              style: const TextStyle(color: Colors.white),
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
