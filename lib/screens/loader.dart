part of bc_screens;

class Loader extends ConsumerStatefulWidget {
  const Loader({super.key});

  @override
  ConsumerState<Loader> createState() => _LoaderState();
}

class _LoaderState extends ConsumerState<Loader> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    super.initState();
  }

  init() async {
    // final predProv = ref.read(predictionProvider);
    // final resp = await predProv();
    // print(resp);
    // if (resp == 'success') {
    goto(AppRoutes.homeRoute);
    // }
  }

  goto(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
