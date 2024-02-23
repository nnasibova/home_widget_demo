import 'package:home_widget/home_widget.dart';
import 'package:home_widget_demo/constants/strings.dart';

class HomeWidgetConfig {
  static Future<void> update(context, String timer) async {
    HomeWidget.saveWidgetData<String>('timerValue', timer);

    await HomeWidget.updateWidget(
        iOSName: iosWidget, androidName: androidWidget);
  }

  static Future<void> initialize() async {
    await HomeWidget.setAppGroupId(groupId);
  }
}
