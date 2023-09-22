part of bc_screens;

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});
  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  final Box<ResultAdapter> resultBox = Hive.box<ResultAdapter>('results');
  // late final List<ResultAdapter> results;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppHeader(
              height: MediaQuery.of(context).size.height * .25,
              // title: "Test Results",
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appTheme.light,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 25),
                        child: Text(
                          "History",
                          style: textTheme.bodyLarge,
                        ),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        shrinkWrap: true,
                        itemCount: resultBox.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0),
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: appTheme.bgColor2,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(resultBox.getAt(index)!.image!),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                    resultBox.getAt(index)!.label.toString()),
                                subtitle: Text(
                                  '${resultBox.getAt(index)!.confidence!.toInt().ceil()}%  . ${resultBox.getAt(index)!.date.toString().substring(0, 10)}',
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      resultBox.deleteAt(index);
                                    });
                                  },
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 0.0, vertical: 12),
                            //   child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //       children: []),
                            // ),
                            // const Divider(endIndent: 15, indent: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
