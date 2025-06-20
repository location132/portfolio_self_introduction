import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_bloc.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_state.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String? type;
  final bool? kakakoMapChange;
  final Function? kakaoMapPop;
  final VoidCallback? saveData;
  final bool? backButton;
  final bool? edit;
  final VoidCallback? onEditPressed;
  final bool? isEditing;
  final bool? isNaverMap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.kakaoMapPop,
    this.saveData,
    this.kakakoMapChange,
    this.type,
    this.backButton,
    this.edit,
    this.onEditPressed,
    this.isEditing = false,
    this.isNaverMap = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    return BlocBuilder<ReviewPageNavigatorBloc, ReviewPageNavigatorState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.018,
            bottom: screenHeight * 0.028,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: widget.backButton == null ? 1.0 : 0.0,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (widget.backButton != true) {
                        if (state.currentPage) {
                          Navigator.pushNamed(context, '/StoreDetail',
                              arguments: {
                                'marketId': state.marketId,
                                'isFavorite': false,
                              });
                        } else {
                          if (widget.kakakoMapChange == true) {
                            widget.kakaoMapPop!();
                          } else if (widget.saveData != null) {
                            widget.saveData!();
                          } else if (widget.type == 'requestChange') {
                            Navigator.pop(context, true);
                          } else {
                            pageRoutesStatus.setclearPageController;
                            Navigator.pop(context);
                          }
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xff111111),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.backButton == true && widget.isNaverMap != true,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/setting.png')),
                ),
              ),
              widget.isEditing == true || widget.edit == true
                  ? Visibility(
                      visible: widget.edit == true,
                      child: GestureDetector(
                        onTap: widget.onEditPressed,
                        child: Text(
                          widget.isEditing! ? '완료' : '편집',
                          style: !widget.isEditing!
                              ? const TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                )
                              : const TextStyle(
                                  color: Color(0xff6fbf8a),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ),
                    )
                  : widget.backButton != true || widget.isNaverMap == true
                      ? (const Opacity(
                          opacity: 0,
                          child: SizedBox(
                            height: 24,
                            width: 24,
                          ),
                        ))
                      : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
