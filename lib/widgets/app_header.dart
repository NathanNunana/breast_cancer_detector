part of bc_widgets;

class CustomAppHeader extends ConsumerWidget {
  final double? height;
  final String? title;
  const CustomAppHeader({super.key, this.height, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 15,
      ),
      decoration: const BoxDecoration(
        // color: appTheme.primaryColor.withOpacity(.6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/bc1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            contentPadding: EdgeInsets.zero,
            // leading: ,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title ?? "",
                  style: textTheme.labelLarge,
                  maxLines: 2,
                ),
              ),
              // SizedBox(
              //   height: 60,
              //   child: Image.asset("assets/images/bc.png"),
              // ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
        ],
      ),
    );
  }
}
