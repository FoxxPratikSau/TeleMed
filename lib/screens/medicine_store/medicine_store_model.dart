import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    productModel1 = createModel(context, () => ProductModel());
    productModel2 = createModel(context, () => ProductModel());
    productModel3 = createModel(context, () => ProductModel());
    productModel4 = createModel(context, () => ProductModel());
    productModel5 = createModel(context, () => ProductModel());
    productModel6 = createModel(context, () => ProductModel());
  }

  @override
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
