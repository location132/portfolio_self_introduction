import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class PartnershipKakaoMap extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String placeName;
  final String address;
  final String phone;
  final String pageStatus;

  const PartnershipKakaoMap({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.placeName,
    required this.address,
    required this.phone,
    required this.pageStatus,
  });

  @override
  State<PartnershipKakaoMap> createState() => _PartnershipKakaoMapState();
}

class _PartnershipKakaoMapState extends State<PartnershipKakaoMap> {
  KakaoMapController? mapController;
  Set<Marker> markers = {};
  bool isMapLoaded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final partnershipRequestModel =
        Provider.of<PartnershipRequestModel>(context, listen: false);
    final partnershipRequestChangeModel =
        Provider.of<PartnershipRequestChangeModel>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          KakaoMap(
            currentLevel: 1,
            onMapCreated: ((controller) async {
              mapController = controller;
              await controller
                  .setCenter(LatLng(widget.latitude, widget.longitude));
              await controller.setLevel(1);
              await Future.delayed(const Duration(milliseconds: 200));
              setState(() {
                markers.add(Marker(
                  markerId: UniqueKey().toString(),
                  latLng: LatLng(widget.latitude, widget.longitude),
                ));
                isMapLoaded = true;
              });
            }),
            markers: markers.toList(),
            center: LatLng(widget.latitude, widget.longitude),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: isMapLoaded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 320),
              child: Container(
                height: screenHeight * 0.171,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDFDFD),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(0, -2),
                        blurRadius: 8)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: screenHeight * 0.171 * 0.137),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.066),
                      child: Row(
                        children: [
                          Text(
                            widget.placeName,
                            style: const TextStyle(
                              color: Color(0xff393939),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.066),
                      child: Row(
                        children: [
                          Text(
                            widget.address,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xff5b5b5b),
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        //pageStatus가 ChangePage면 수정 페이지에서 작동 중 아니라면 새로운 글 작성
                        if (widget.pageStatus == 'ChangePage') {
                          partnershipRequestChangeModel.setSelectedBusiness(
                            widget.placeName,
                            widget.address,
                            '',
                            widget.phone,
                            widget.latitude,
                            widget.longitude,
                          );
                        } else {
                          partnershipRequestModel.setSelectedBusiness(
                            widget.placeName,
                            widget.address,
                            '',
                            widget.phone,
                            widget.latitude,
                            widget.longitude,
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xff6fbf8a),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '선택',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
