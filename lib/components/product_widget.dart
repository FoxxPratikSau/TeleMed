import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    this.isFavourite,
    this.productImage,
    this.productTitle,
    this.productCategory,
    this.productPrice,
    this.regularPrice,
    this.productRating,
  }) : super(key: key);

  final bool? isFavourite;
  final String? productImage;
  final String? productTitle;
  final String? productCategory;
  final String? productPrice;
  final String? regularPrice;
  final int? productRating;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 220.0,
      height: 260.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Color(0xFFF2F2F2),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ToggleIcon(
                    onPressed: () async {
                      setState(() =>
                          FFAppState().isFavourite = !FFAppState().isFavourite);
                    },
                    value: FFAppState().isFavourite,
                    onIcon: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFFF3535),
                      size: 14.0,
                    ),
                    offIcon: Icon(
                      Icons.favorite_border,
                      color: Color(0xFFFF3535),
                      size: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
              child: Image.asset(
                widget.productImage!,
                width: 100.0,
                height: 60.0,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productTitle!,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recoleta',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                      child: Text(
                        widget.productCategory!,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹ ${widget.productPrice!}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Recoleta',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.regularPrice!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Recoleta',
                                  color: Color(0xFFFF3535),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFC107),
                      ),
                      direction: Axis.horizontal,
                      rating: widget.productRating!.toDouble(),
                      unratedColor: Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 12.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
