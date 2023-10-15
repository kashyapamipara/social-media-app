import 'package:social_media_app/app/Constants/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class PostTileWidget extends StatefulWidget {
  final String? personName;

  final String? postCaption;
  final bool isMediaAvailable;
  final String postMediaURLs;
  final String? personId;
  final String? personImage;
  const PostTileWidget(
      {Key? key,
      this.personName,
      this.isMediaAvailable = false,
      this.postCaption,
      required this.postMediaURLs,
      this.personId,
      this.personImage})
      : super(key: key);

  @override
  State<PostTileWidget> createState() => _PostTileWidgetState();
}

class _PostTileWidgetState extends State<PostTileWidget>
    with TickerProviderStateMixin {
  late AnimationController _zoomAnimationController;
  Animation<Matrix4>? _zoomAnimation;
  late TransformationController _transformationController;
  TapDownDetails? _doubleTapDetails;

  final _editKey = GlobalKey();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    final newValue = _transformationController.value.isIdentity()
        ? _applyZoom()
        : _revertZoom();

    _zoomAnimation = Matrix4Tween(
      begin: _transformationController.value,
      end: newValue,
    ).animate(CurveTween(curve: Curves.fastLinearToSlowEaseIn)
        .animate(_zoomAnimationController));
    _zoomAnimationController.forward(from: 0);
  }

  Matrix4 _applyZoom() {
    final tapPosition = _doubleTapDetails!.localPosition;
    final zoomed = Matrix4.identity()
      ..translate(
        -tapPosition.dx * 2,
        -tapPosition.dy * 2,
      )
      ..scale(3.0);
    return zoomed;
  }

  Matrix4 _revertZoom() => Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: 1.8.h),
        padding: EdgeInsets.only(bottom: 1.5.h),
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.3.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///PersonName
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.personImage??'',
                      ),
                      radius: 20,
                    
                    ),
                    SizedBox(width:3.w),
                    Text(
                      widget.personName ?? 'John Doe',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),

                  ///delet
                ]),
          ),

          ///media
          if (widget.isMediaAvailable) ...[
            InkWell(
              onTap: () async {
                _transformationController = TransformationController();
                _zoomAnimationController = AnimationController(
                  vsync: this,
                  duration: const Duration(milliseconds: 600),
                )..addListener(() {
                    _transformationController.value = _zoomAnimation!.value;
                  });
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.zero,
                      content: GestureDetector(
                        onDoubleTapDown: _handleDoubleTapDown,
                        onDoubleTap: _handleDoubleTap,
                        child: InteractiveViewer(
                          panEnabled: true,
                          maxScale: 3,
                          transformationController: _transformationController,
                          child: widget.postMediaURLs != 'null'
                              ? CachedNetworkImage(
                                  imageUrl: widget.postMediaURLs,
                                  fit: BoxFit.contain,
                                )
                              : SizedBox(),
                        ),
                      ),
                    );
                  },
                ).then((value) {
                  _transformationController.dispose();
                  _zoomAnimationController.dispose();
                  setState(() {});
                });
              },
              child: SizedBox(
                  height: 28.h,
                  child: widget.postMediaURLs != 'null'
                      ? Center(
                          child: CachedNetworkImage(
                            imageUrl: widget.postMediaURLs,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox()),
            ),
          ],

          ///caption
          widget.postCaption != null
              ? Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  child: Text(
                    widget.postCaption ?? '',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : const SizedBox(),
        ]));
  }
}
