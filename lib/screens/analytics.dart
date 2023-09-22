part of bc_screens;

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text('Datasets', style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          // height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/dataset.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    ExpansionTile(
                      title: Text('Evaluation Metric',
                          style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          // height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/evaluation.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    ExpansionTile(
                      title: Text('Training and Validation Accuracy',
                          style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/history.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    ExpansionTile(
                      title:
                          Text('Confusion Matrix', style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/confusion_mat.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    ExpansionTile(
                      title: Text('ROC Curve', style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/roc_curve.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    ExpansionTile(
                      title: Text('Values', style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/auc.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/precision.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/accuracy.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/loss.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Distributions', style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/auc1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/precision1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/accuracy1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/loss1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('2-d Distributions',
                          style: textTheme.bodyMedium),
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/distribution.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
