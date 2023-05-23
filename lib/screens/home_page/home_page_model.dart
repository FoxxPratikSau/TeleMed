import '/components/recent_products_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for recentProducts component.
  late RecentProductsModel recentProductsModel1;
  // Model for recentProducts component.
  late RecentProductsModel recentProductsModel2;
  // Model for recentProducts component.
  late RecentProductsModel recentProductsModel3;
  // Model for recentProducts component.
  late RecentProductsModel recentProductsModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    recentProductsModel1 = createModel(context, () => RecentProductsModel());
    recentProductsModel2 = createModel(context, () => RecentProductsModel());
    recentProductsModel3 = createModel(context, () => RecentProductsModel());
    recentProductsModel4 = createModel(context, () => RecentProductsModel());
  }

  void dispose() {
    textController?.dispose();
    recentProductsModel1.dispose();
    recentProductsModel2.dispose();
    recentProductsModel3.dispose();
    recentProductsModel4.dispose();
  }

  /// Additional helper methods are added here.
}
