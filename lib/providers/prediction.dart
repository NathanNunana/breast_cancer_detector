part of providers;

final predictionProvider =
    ChangeNotifierProvider((ref) => PredictionProvider(ref));

class PredictionProvider extends ChangeNotifier {
  Ref ref;
  Box<ResultAdapter>? result;
  PredictionProvider(this.ref) {
    // init();
  }

  Dio get http => ref.read(httpProvider).http;

  // init() async {
  //   await Hive.initFlutter();
  //   Hive.registerAdapter(ResultAdapterAdapter());
  //   Hive.openBox<ResultAdapter>('results');
  // }

  Future interpret(File image) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
    final resp = await http.post('/predict/', data: formData);
    print(resp.data);
    return resp.data;
  }

  // prediction logic
  // Future<String?> loadModel() async {
  //   try {
  //     String modelPath = 'assets/model/model.tflite';
  //     final response = await Tflite.loadModel(
  //       model: modelPath,
  //       labels: 'assets/model/labels.txt',
  //     );
  //     return response;
  //   } catch (e) {
  //     // Handle error
  //     return 'Model loading failed: $e';
  //   }
  // }

  // Future<Uint8List> preprocessImage(File imageFile) async {
  //   final image = imglib.decodeImage(imageFile.readAsBytesSync());

  //   final resizedImage = imglib.copyResize(image!, width: 224, height: 224);

  //   final byteData = resizedImage.getBytes();
  //   final Uint8List inputImage = Uint8List.fromList(byteData);

  //   print(inputImage);

  //   return inputImage;
  // }

  // Future<List<dynamic>?> interpret(File image) async {
  //   try {
  //     int startTime = DateTime.now().millisecondsSinceEpoch;
  //     var recognitions = await Tflite.runModelOnImage(
  //       path: image.path,
  //       numResults: 5,
  //       threshold: 0.1,
  //       imageMean: 127.5,
  //       imageStd: 127.5,
  //     );
  //     int endTime = DateTime.now().millisecondsSinceEpoch;
  //     print("Inference took ${endTime - startTime}ms");

  //     return recognitions;
  //   } catch (e) {
  //     // Handle error
  //     print('error: $e');
  //     // throw Exception(e);
  //     return [];
  //   }
  // }
}
