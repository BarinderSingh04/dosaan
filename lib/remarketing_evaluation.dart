import 'dart:io';

import 'package:dosaan/login_screen.dart';
import 'package:dosaan/screens/pre_form/pre_work_screen.dart';
import 'package:dosaan/services/machinetype_service.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'models/machine.dart';
import 'screens/filter/filter_screen.dart';

final modelsProvider =
    FutureProvider.autoDispose.family<List<Model>, int>((ref, id) async {
  return ref.watch(machineServiceProvider).getModels(id);
});

final serialsProvider =
    FutureProvider.autoDispose.family<List<Serial>, int>((ref, id) async {
  return ref.watch(machineServiceProvider).getSerials(id);
});

class RemarketingEvaluation extends ConsumerStatefulWidget {
  final Machine? machine;
  const RemarketingEvaluation({Key? key, this.machine}) : super(key: key);

  @override
  ConsumerState<RemarketingEvaluation> createState() =>
      _RemarketingEvaluationState();
}

class _RemarketingEvaluationState extends ConsumerState<RemarketingEvaluation> {
  DateTime _selectedDate = DateTime.now();
  List<File> imageList = [];

  @override
  Widget build(BuildContext context) {
    final modelsState = ref.watch(modelsProvider(widget.machine!.id));
    final serialsState = ref.watch(serialsProvider(widget.machine!.id));

    return Scaffold(
      appBar: AppbarWidget(
        title: "Remarketing Evaluation",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat("MM/dd/yyyy").format(_selectedDate),
                    style: const TextStyle(
                      color: Color(0xff269f75),
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Filter by",
                        style:
                            TextStyle(color: Color(0xff808080), fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        iconSize: 30,
                        icon: Image.asset(
                          "assets/images/remarket.png",
                          fit: BoxFit.cover,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => FilterScreen(
                                selectedDay: DateTime.now(),
                              ),
                            ),
                          )
                              .then((value) {
                            setState(() {
                              _selectedDate = value ?? DateTime.now();
                            });
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Model",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              dropDonwModelWidget(
                modelsState,
                "HGS94877400",
              ),
              const SizedBox(height: 16),
              const Text(
                "Serial number",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff231f20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              dropDownWidget(
                serialsState,
                "HGS94877400",
              ),
              const SizedBox(height: 16),
              const Text("Hours",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff231f20),
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const TextField(
                decoration: InputDecoration(
                    hintText: "342",
                    hintStyle: TextStyle(color: Color(0xff808080)),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text(
                "Year",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff231f20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const TextField(
                decoration: InputDecoration(
                    hintText: "2018",
                    hintStyle: TextStyle(color: Color(0xff808080)),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text(
                "No. of attachments",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox.fromSize(
                size: const Size.fromHeight(160),
                child: InkWell(
                  onTap: () async {
                    XFile? pickedImage = await showDialog(
                      context: context,
                      builder: (context) {
                        return const ImagePickerOptions();
                      },
                    );
                    if (pickedImage != null) {
                      setState(() {
                        imageList.add(File(pickedImage.path));
                      });
                    }
                  },
                  child: DottedBorder(
                    color: const Color(0xff808080),
                    strokeWidth: 1,
                    dashPattern: const [8, 8],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(5),
                    strokeCap: StrokeCap.round,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.photo_camera,
                            color: Color(0xfff26b23),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Take a Picture",
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 16.0,
                children: imageList
                    .map(
                      (e) => UploadWidget(
                        fileName: e.path,
                        onClick: () {
                          setState(() {
                            imageList.remove(e);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 22),
              const Text(
                "Add Speciality text",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Type here….",
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 29),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PreWorkScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDownWidget(AsyncValue<List<Serial>> serialState, String hint) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      decoration: InputDecoration(
        hintText: hint,
      ),
      items: serialState.when(
        data: (data) {
          return data
              .map(
                (e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                ),
              )
              .toList();
        },
        error: (error, st) {
          return [
            DropdownMenuItem(
              child: Text(
                error.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ];
        },
        loading: () {
          return [
            DropdownMenuItem(
              child: Row(
                children: const [
                  Text("Please wait..."),
                ],
              ),
            ),
          ];
        },
      ),
      onChanged: (_) {},
    );
  }

  Widget dropDonwModelWidget(AsyncValue<List<Model>> serialState, String hint) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      decoration: InputDecoration(hintText: hint),
      items: serialState.when(
        data: (data) {
          return data
              .map(
                (e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                ),
              )
              .toList();
        },
        error: (error, st) {
          return [
            DropdownMenuItem(
              child: Text(
                error.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ];
        },
        loading: () {
          return [
            DropdownMenuItem(
              child: Row(
                children: const [
                  Text("Please wait..."),
                ],
              ),
            ),
          ];
        },
      ),
      onChanged: (_) {},
    );
  }
}

Widget dropDownModellWidget(List<Model> list, String hint) {
  return DropdownButtonFormField<int>(
    decoration: InputDecoration(hintText: hint),
    items: list
        .map(
          (e) => DropdownMenuItem(
            value: e.id,
            child: Text(e.name),
          ),
        )
        .toList(),
    onChanged: (_) {},
  );
}

class UploadWidget extends StatelessWidget {
  final String fileName;
  final VoidCallback onClick;

  const UploadWidget({
    Key? key,
    required this.fileName,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(height: 90),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xffd7dae0),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.file(
              File(fileName),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              fileName.split("/").last,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff231f20),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 24.0),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: onClick,
          ),
        ],
      ),
    );
  }
}

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Select source",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      content: Wrap(
        children: [
          ListTile(
            title: const Text(
              "Camera",
              style: TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.camera_alt, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.camera, imageQuality: 70)
                  .then((value) {
                Navigator.of(context).pop(value);
              });
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            title: const Text(
              "Gallery",
              style: TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.image, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.gallery, imageQuality: 70)
                  .then((value) {
                Navigator.of(context).pop(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
