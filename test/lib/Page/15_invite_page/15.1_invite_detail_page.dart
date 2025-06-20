import 'package:flutter/material.dart';
import 'package:my_dream/Page/15_invite_page/15.2_invite_container.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/bottom_navigation.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class MyInvitePage extends StatefulWidget {
  const MyInvitePage({super.key});

  @override
  State<MyInvitePage> createState() => _MyInvitePageState();
}

class _MyInvitePageState extends State<MyInvitePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sw),
                  child: const CustomAppBar(title: '초대하기'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sw),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: const Color(0xFF282828),
                    unselectedLabelColor: const Color(0xFFC1C1C1),
                    indicatorColor: const Color(0xFF6FBF8A),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.sw,
                        color: const Color(0xFF6FBF8A),
                      ),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: '받은 초대장'),
                      Tab(text: '보낸 초대장'),
                    ],
                  ),
                ),
                SizedBox(height: 9.sh),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ////////////////받은 초대장/////////////////
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 60.sw,
                                  height: 31.sh,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF6FBF8A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '모집 중',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PretendardSemiBold',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 27.sh),
                                  child: const InviteContainer(
                                      condition: 'receivedInvitation',
                                      writer: '아몰랑',
                                      store: '두리상회',
                                      date: '2024.10.14(화) 오후 8시 4명'),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.sh),
                            const InviteContainer(
                                condition: 'end',
                                writer: '눈누난나',
                                store: '소랑,소랑',
                                date: '2024.10.12(토) 오후 7시 2명')
                          ],
                        ),
                      ),
                      //////////////보낸 초대장////////////////
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 60.sw,
                                  height: 31.sh,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF6FBF8A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '모집 중',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PretendardSemiBold',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 27.sh),
                                  child: const InviteContainer(
                                      condition: 'SendMyInvitation',
                                      writer: '먕먕',
                                      store: '목포집',
                                      date: '2024.10.16(목) 오후 6시 4명'),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.sh),
                            const InviteContainer(
                                condition: 'expireMyInvitation',
                                writer: '멀바',
                                store: '빵',
                                date: '2024.10.9(수) 오후 8시 2명')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: screenWidth,
                child: Column(
                  children: [
                    BottomNavigation(
                        toggleLoadAndScreenChange: () {}, forcedoutput: true),
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
