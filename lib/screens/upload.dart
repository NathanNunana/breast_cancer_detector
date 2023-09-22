part of bc_screens;

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  bool processed = false;
  bool processing = false;
  File? _imageFile;
  Map? predictions;
  Map<String, dynamic> result = {};
  ResultAdapter? results;
  Box<ResultAdapter> resultBox = Hive.box<ResultAdapter>('results');

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  Future<void> _performImageDetection() async {
    if (_imageFile != null) {
      setState(() {
        processing = true;
      });

      // await Future.delayed(const Duration(milliseconds: 1000));

      final pred = ref.read(predictionProvider.notifier);
      predictions = await pred.interpret(_imageFile!);

      print(predictions);

      setState(() {
        // for (var x = 0; x < predictions!.length; x++) {
        //   var max = predictions![0]["confidence"];
        //   result["confidence"] = max;
        //   result["label"] = predictions![0]["label"];
        //   if (max < predictions![x]["confidence"]) {
        //     max = predictions![x]["confidence"];
        //     result["confidence"] = max;
        //     result["label"] = predictions![x]["label"];
        //   }
        // }
        result["confidence"] = predictions!["confidence"];
        result["label"] = predictions!["result"];
        result["image"] = _imageFile!.path;
        processed = true;
        processing = false;
        results = ResultAdapter.fromJson(result);
        resultBox.add(results!);
        print(predictions);
        print(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    // final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppHeader(
              height: MediaQuery.of(context).size.height * .22,

              // title: "Breast Cancer Detector",
            ),
            const SizedBox(
              height: 20,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (processed)
                    ? Container()
                    : Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: appTheme.bgColor2,
                          borderRadius: BorderRadius.circular(12),
                          image: (_imageFile != null)
                              ? DecorationImage(
                                  image: FileImage(_imageFile!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                (processing)
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: appTheme.primaryColor,
                        ),
                      )
                    : (processed)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                // child:
                                // Text("Result", style: textTheme.bodyLarge),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .35,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: appTheme.light,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: PredictionScreen(
                                  confidence: result["confidence"] ?? 0.00,
                                  label: result["label"] ?? "0 nothing",
                                ),
                              ),
                            ],
                          )
                        : Container(),
              ],
            ),
            // ),
            (processed)
                ? CustomButton(
                    icon: const Icon(Icons.refresh),
                    title: "Reload",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.initRoute),
                  )
                : (_imageFile != null)
                    ? Column(
                        children: [
                          CustomButton(
                            color: appTheme.secondaryColor,
                            icon: const Icon(
                              CupertinoIcons.search,
                              size: 20,
                            ),
                            title: "Detect Cancer",
                            onPressed: () => _performImageDetection(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            color: appTheme.primaryColor,
                            icon: const Icon(
                              CupertinoIcons.camera,
                              size: 20,
                            ),
                            title: "Re-uploaod Picture",
                            onPressed: () => _pickImage(ImageSource.gallery),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          CustomButton(
                            color: appTheme.primaryColor,
                            icon: const Icon(
                              CupertinoIcons.camera,
                              size: 20,
                            ),
                            title: "Capture with Camera",
                            onPressed: () => _pickImage(ImageSource.camera),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            color: appTheme.uploadColor,
                            icon: const Icon(
                              CupertinoIcons.cloud_upload_fill,
                              size: 20,
                            ),
                            title: "Upload Scan",
                            onPressed: () => _pickImage(ImageSource.gallery),
                          )
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Icon icon;
  final void Function()? onPressed;
  const CustomButton(
      {super.key, this.title, this.color, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // width: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            elevation: 0,
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                title.toString(),
                style: textTheme.labelMedium,
              )
            ],
          )),
    );
  }
}
