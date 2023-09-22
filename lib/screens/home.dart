part of bc_screens;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
        body: Column(
      children: [
        CustomAppHeader(
          height: MediaQuery.of(context).size.height * .25,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // height: 120,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: appTheme.primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Know your cancer status in just 2 clicks",
                          style: textTheme.headlineLarge),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.uploadRoute),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: appTheme.light,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 41,
                      width: 41,
                      decoration: BoxDecoration(
                        color: appTheme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svgs/Breast.svg",
                        ),
                      ),
                    ),
                    title: Text(
                      "Breast Cancer Detector",
                      style: textTheme.bodyMedium,
                    ),
                    subtitle: const Text("Upload scan and get prediction"),
                    trailing: const Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.resultRoute),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: appTheme.light,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 41,
                      width: 41,
                      decoration: BoxDecoration(
                        color: appTheme.success,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svgs/Result.svg",
                        ),
                      ),
                    ),
                    title: Text(
                      "View all Test Results",
                      style: textTheme.bodyMedium,
                    ),
                    subtitle: const Text("Previous scans repository"),
                    trailing: const Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.analyticsRoute,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: appTheme.light,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 41,
                      width: 41,
                      decoration: BoxDecoration(
                        color: appTheme.bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.bar_chart),
                      ),
                    ),
                    title: Text(
                      "Analytics",
                      style: textTheme.bodyMedium,
                    ),
                    subtitle: const Text("Analytics from model training"),
                    trailing: const Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Transform.translate(
        //   offset: const Offset(0, -50),
        //   // child: const ImageSlider(),
        // ),
      ],
    ));
  }
}

// class Carousel {
//   String? url;
//   String? title;

//   Carousel({this.url, this.title});
// }

// final List<Carousel> imgList = [
//   Carousel(
//     title:
//         "Learn about the significance of breast cancer and it’s impact on overall well-being",
//     url: "assets/images/breast1.jpg",
//   ),
//   Carousel(
//     title:
//         "Uncover the key factors that can contribute to the development of breast cancer, helping you to stay informed",
//     url: "assets/images/breast2.jpg",
//   ),
//   Carousel(
//     title:
//         "Empowering yourself with practical strategies and insights to lower your risk and promote breast health for a brighter future",
//     url: "assets/images/breast3.jpg",
//   )
// ];

// final List<Widget> imageSliders = imgList
//     .map(
//       (item) => ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(15.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.asset(item.url.toString(),
//                 fit: BoxFit.cover, width: double.infinity),
//             Positioned.fill(
//               top: 0.0,
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//               ),
//             ),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                   vertical: 15,
//                 ),
//                 child: Text(
//                   item.title.toString(),
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     fontStyle: FontStyle.normal,
//                     letterSpacing: 0.5,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     )
//     .toList();

// class ImageSlider extends StatelessWidget {
//   const ImageSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: true,
//         aspectRatio: 2,
//         enlargeCenterPage: true,
//         autoPlayInterval: const Duration(seconds: 10),
//       ),
//       items: imageSliders,
//     );
//   }
// }
