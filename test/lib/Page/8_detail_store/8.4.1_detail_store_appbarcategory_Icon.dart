import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_bloc.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_event.dart';
import 'package:my_dream/coreService/bloc/page_navigation/page_state.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class DetailStoreAppbarcategoryIcon extends StatefulWidget {
  final bool isAppIconsColor;
  final Map<String, dynamic> detailStoreInformation;

  const DetailStoreAppbarcategoryIcon(
      {super.key,
      required this.isAppIconsColor,
      required this.detailStoreInformation});

  @override
  State<DetailStoreAppbarcategoryIcon> createState() =>
      _DetailStoreAppbarcategoryIconState();
}

class _DetailStoreAppbarcategoryIconState
    extends State<DetailStoreAppbarcategoryIcon> {
  @override
  void initState() {
    context.read<ReviewPageNavigatorBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    final loginStatus = Provider.of<LoginModel>(context);

    return BlocBuilder<ReviewPageNavigatorBloc, ReviewPageNavigatorState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: !widget.isAppIconsColor
                          ? Colors.white
                          : Colors.black),
                  onPressed: () {
                    if (state.currentPage) {
                      Navigator.pushNamedAndRemoveUntil(context, '/MainScreen',
                          (Route<dynamic> route) => false);
                      context
                          .read<ReviewPageNavigatorBloc>()
                          .add(PreviousPage());
                    } else {
                      pageRoutesStatus.setPageController('');
                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              AnimatedOpacity(
                opacity: widget.isAppIconsColor ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 170),
                child: Text(
                  '${widget.detailStoreInformation['marketName']}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff111111),
                    fontSize: 21,
                    fontFamily: 'PretendardSemiBold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (loginStatus.loginStatus && loginStatus.isStudent) {
                    Navigator.pushNamed(context, '/MyShoppingCart');
                  } else if (!loginStatus.loginStatus) {
                    pageRoutesStatus.setPageController('/StoreReviewContainer');
                    showLoginDialog(context, LoginDialogType.login);
                  } else {
                    pageRoutesStatus.setPageController('/StoreReviewContainer');
                    showLoginDialog(context, LoginDialogType.studentAuth);
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color:
                          !widget.isAppIconsColor ? Colors.white : Colors.black,
                      size: 30,
                    ),
                    loginStatus.basketCount != 0
                        ? Positioned(
                            right: loginStatus.basketCount <= 10 ? -7 : -5,
                            top: loginStatus.basketCount <= 10 ? -12 : -10,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    '${loginStatus.basketCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
