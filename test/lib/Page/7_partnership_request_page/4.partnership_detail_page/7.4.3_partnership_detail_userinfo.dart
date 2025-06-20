// 파트너쉽 요청글 페이지 유저 이름, 삭제, 수정 부분 //
/*
1. 삭제 버튼을 통해서 내가 쓴 글 삭제 가능
2. 수정 버튼을 통해 내가 쓴 글 수정 가능
3. 내가 쓴 글이 아니라면 dialog로 알려줌
*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/7_partnership_request_page/7.5_parthership_request_change_form.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/Dialog/partnership_request_delete_diaglog.dart';
import 'package:my_dream/coreService/Dialog/partnership_request_email_different_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class PartnershipDetailUserinfo extends StatefulWidget {
  final String time;
  final Map<String, dynamic> serverDetailData;
  final String userEmail;
  const PartnershipDetailUserinfo(
      {super.key,
      required this.time,
      required this.serverDetailData,
      required this.userEmail});

  @override
  State<PartnershipDetailUserinfo> createState() =>
      _PartnershipDetailUserinfoState();
}

class _PartnershipDetailUserinfoState extends State<PartnershipDetailUserinfo> {
  void partnershipRequestDeleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return PartnershipRequestDeleteDiaglog(
          partnershipId: widget.serverDetailData['partnerRequestId'],
        );
      },
    );
  }

  void parthershipRequestDifferentWriterDeleteDialog(String keword) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return PartnershipRequestEmail(keword: keword);
      },
    );
  }

  String userName(String writer) {
    int index = writer.indexOf('@');
    String user = writer.substring(0, index);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    PartnershipRequestChangeModel partnershipRequestChangeModel =
        Provider.of<PartnershipRequestChangeModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final secondscreenWidth = screenWidth - screenWidth * 0.082;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: Color(0xffdbdbdb),
          ),
          right: BorderSide(
            width: 1,
            color: Color(0xffdbdbdb),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 9, right: 10, bottom: 9),
                child: Container(
                  height: secondscreenWidth * 0.12,
                  width: secondscreenWidth * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 0.1),
                  ),
                  child: ClipRRect(
                      child: widget.serverDetailData['requestUserImageUrl'] !=
                              null
                          ? CachedNetworkImage(
                              imageUrl: widget
                                  .serverDetailData['requestUserImageUrl'],
                              fit: BoxFit.cover,
                              memCacheHeight: ((secondscreenWidth * 0.12) *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error))
                          : const Icon(Icons.person)),
                ),
              ),
              Text(
                '${userName(widget.serverDetailData['requestUserEmail'])}/ LV.1',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                widget.time,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey[400]),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (loginStatus) {
                    if (widget.serverDetailData['requestUserEmail'] ==
                        widget.userEmail) {
                      partnershipRequestDeleteDialog();
                    } else {
                      parthershipRequestDifferentWriterDeleteDialog('삭제');
                    }
                  } else {
                    showLoginDialog(context, LoginDialogType.login);
                  }
                },
                child: const Text(
                  '삭제',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: secondscreenWidth * 0.045,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (loginStatus) {
                    if (widget.serverDetailData['requestUserEmail'] ==
                        widget.userEmail) {
                      var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PartnershipRequestChangeForm(
                                  serverDetailData: widget.serverDetailData,
                                )),
                      );
                      if (result == true) {
                        partnershipRequestChangeModel.clearSelectedBusiness();
                      }
                    } else {
                      parthershipRequestDifferentWriterDeleteDialog('수정');
                    }
                  } else {
                    showLoginDialog(context, LoginDialogType.login);
                  }
                },
                child: const Text(
                  '수정',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.04,
              )
            ],
          ),
        ],
      ),
    );
  }
}
