import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/app_services/recent_recomms.dart';
import 'package:crop_recomm/utils/ml_models.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class RecommService extends StatefulWidget {
  const RecommService({super.key});

  @override
  State<RecommService> createState() => _RecommServiceState();
}

class _RecommServiceState extends State<RecommService> {
  bool isCelcius = true;
  double pH = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crop recommendation"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RecentRecommendations(),));
          }, icon: const Icon(Icons.refresh),tooltip: "Recents",)
        ],
      ),
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTextField(controller: null, label: Text("Potassium")),
            const Divider(
              color: Colors.transparent,
            ),
            const CustomTextField(controller: null, label: Text("Nitrogen")),
            const Divider(
              color: Colors.transparent,
            ),
            const CustomTextField(controller: null, label: Text("Phosphorus")),
            const Divider(
              color: Colors.transparent,
            ),
            const CustomTextField(controller: null, label: Text("Rainfall")),
            const Divider(
              color: Colors.transparent,
            ),
            Row(
              children: [
                const Expanded(
                    child: CustomTextField(
                        controller: null, label: Text("Temperature"))),
                VerticalDivider(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: AppTheme().borderRadius(context),
                    boxShadow: [
                      BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.4),offset: const Offset(2,2),blurRadius: 5,spreadRadius: 1)
                    ]
                  ),
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    child: Visibility(
                      replacement: TextButton(
                          onPressed: null,
                          child: Text("℉",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .fontSize))),
                      visible: isCelcius,
                      child: TextButton(
                          onPressed: null,
                          child: Text(
                            "℃",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize),
                          )),
                    ),
                    onTap: () {
                      setState(() {
                        isCelcius = !isCelcius;
                      });
                    },
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              child: SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape(),
                ),
                child: Slider(
                  min: 0,
                  max: 10,
                  divisions: 100,
                  allowedInteraction: SliderInteraction.slideOnly,
                  value: pH,
                  onChanged: (value) {
                    setState(() {
                      pH = value;
                    });
                  },
                ),
              ),
            ),
            AutoSizeText(
              "${pH.toStringAsFixed(3)} pH",
              textAlign: TextAlign.end,
            ),
            // const Spacer(),
            FilledElevatedButton(label: "Get Recommendations", onTap: () {
              runModel();
            }, enabled: true)
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
