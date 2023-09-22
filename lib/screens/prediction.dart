part of bc_screens;

class PredictionScreen extends ConsumerStatefulWidget {
  final double? confidence;
  final String? label;
  const PredictionScreen({super.key, this.confidence, this.label});

  @override
  ConsumerState<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends ConsumerState<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    double size = 150;
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: size,
                      width: size,
                      child: CircleAvatar(
                        // radius: 10,
                        backgroundColor: appTheme.bgColor2.withOpacity(.3),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        // height: size - 10,
                        // width: size - 10,
                        child: CircularProgressIndicator(
                          value: widget.confidence ?? 0,
                          color: appTheme.primaryColor,
                          strokeWidth: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          // radius: 70,
                          backgroundColor: appTheme.light,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${(widget.confidence!).toInt()}%',
                                  style: textTheme.bodyLarge),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.label.toString(),
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: appTheme.primaryColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: (widget.label.toString() == 'Malignant')
                          ? appTheme.primaryColor
                          : appTheme.success,
                    ),
                  ),
                  title: const Text(
                    "The results from the scan is",
                  ),
                  subtitle: Text(widget.label.toString()),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
