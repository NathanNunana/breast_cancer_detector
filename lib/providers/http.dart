part of providers;

final httpProvider = Provider((ref) => HttpProvider(ref));

class HttpProvider {
  late Dio http;
  Ref ref;
  HttpProvider(this.ref)
      : http = Dio(
          BaseOptions(
            baseUrl: "https://www.skincancerdetectionapp.org/",
          ),
        );
}
