import '/components/product_widget.dart';
import '/components/search_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicineStoreModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for product component.
  late ProductModel productModel1;
  // Model for product component.
  late ProductModel productModel2;
  // Model for product component.
  late ProductModel productModel3;
  // Model for product component.
  late ProductModel productModel4;
  // Model for product component.
  late ProductModel productModel5;
  // Model for product component.
  late ProductModel productModel6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    productModel1 = createModel(context, () => ProductModel());
    productModel2 = createModel(context, () => ProductModel());
    productModel3 = createModel(context, () => ProductModel());
    productModel4 = createModel(context, () => ProductModel());
    productModel5 = createModel(context, () => ProductModel());
    productModel6 = createModel(context, () => ProductModel());
  }

  void dispose() {
    productModel1.dispose();
    productModel2.dispose();
    productModel3.dispose();
    productModel4.dispose();
    productModel5.dispose();
    productModel6.dispose();
  }

  /// Additional helper methods are added here.

}
