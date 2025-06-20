import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/9_store_review/store_review_dio/store_review_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_bloc.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_event.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_state.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:provider/provider.dart';

class BestReview3 extends StatefulWidget {
  final Map<String, dynamic> reviewsData;
  const BestReview3({super.key, required this.reviewsData});

  @override
  State<BestReview3> createState() => _BestReview3State();
}

class _BestReview3State extends State<BestReview3> {
  String givenTimeStr = '';
  String newText = '';
  //좋아요
  Map<String, dynamic> result = {};
  bool _toggleValue = false;
  bool _toggleSuccess = false;
  late int recommendCount;

  @override
  void initState() {
    super.initState();
    editText();
    recommendCount = widget.reviewsData['market4'];
    _toggleValue = widget.reviewsData['market5'];
  }

  void editText() {
    setState(() {
      givenTimeStr = widget.reviewsData['market0'];
      newText = formatTimeDifference(givenTimeStr);
    });
  }

  void togglIcon() async {
    result = await recommendReviewDio(widget.reviewsData['market7']);
    if (result['success']) {
      setState(() {
        _toggleValue = true;
        _toggleSuccess = !_toggleSuccess;
      });
    } else {
      setState(() {
        _toggleValue = false;
        _toggleSuccess = !_toggleSuccess;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final loginStatus = Provider.of<LoginModel>(context, listen: false);

    return BlocBuilder<ReviewPageNavigatorBloc, ReviewPageNavigatorState>(
      builder: (context, state) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.pushNamed(context, '/StoreReviewContainer',
                arguments: widget.reviewsData['market8']);
            context
                .read<ReviewPageNavigatorBloc>()
                .add(NextPage(widget.reviewsData['market8']));
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                child: SizedBox(
                  width: screenWidth * 0.331,
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.reviewsData['market2'],
                    fit: BoxFit.cover,
                    memCacheWidth: ((screenWidth * 0.331) *
                            MediaQuery.of(context).devicePixelRatio)
                        .round(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xffd9d9d9),
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.reviewsData['market6'].toString(),
                                fit: BoxFit.cover,
                                memCacheHeight: (30 *
                                        MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                                memCacheWidth: (30 *
                                        MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              widget.reviewsData['market3'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xff282828),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              newText,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Color(0xff8e8e8e),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        height: 1,
                        color: Color(0xfff5f5f5),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Text(
                          widget.reviewsData['market1'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (loginStatus.loginStatus &&
                              loginStatus.isStudent) {
                            togglIcon();
                          } else if (loginStatus.loginStatus &&
                              !loginStatus.isStudent) {
                            showLoginDialog(
                                context, LoginDialogType.studentAuth);
                          } else {
                            showLoginDialog(context, LoginDialogType.login);
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up_off_alt_outlined,
                              size: 20,
                              color: !_toggleValue
                                  ? const Color(0xffc1c1c1)
                                  : const Color(0xff6fbf8a),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              (_toggleValue && _toggleSuccess
                                      ? recommendCount + 1
                                      : !_toggleSuccess
                                          ? recommendCount
                                          : recommendCount - 1)
                                  .toString(),
                              style: const TextStyle(
                                color: Color(0xff8e8e8e),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 7),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
