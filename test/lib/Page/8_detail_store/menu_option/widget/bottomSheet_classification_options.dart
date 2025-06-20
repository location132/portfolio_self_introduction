import 'package:flutter/material.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/model/menus_option.dart';
import 'package:provider/provider.dart';

class DetailBottomsheetClassificationOptions extends StatefulWidget {
  final MenuOptionsModel? menuOptions;
  final int index;
  final int? menuIndex;
  final CartModel? cartModel;

  const DetailBottomsheetClassificationOptions(
      {super.key,
      required this.menuOptions,
      required this.index,
      this.menuIndex,
      this.cartModel});

  @override
  State<DetailBottomsheetClassificationOptions> createState() =>
      _DetailBottomsheetClassificationOptionsState();
}

class _DetailBottomsheetClassificationOptionsState
    extends State<DetailBottomsheetClassificationOptions> {
  Map<int, int> selectedOption = {};
  Map<int, int> selectedOptionPrice = {}; // 선택된 옵션의 가격을 저장
  Map<int, Map<int, bool>> selectedMultipleOptions = {};
  int addPrice = 0; // 최종 가격

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.cartModel?.menu[0].options == null) {
        if (widget.menuOptions!.categories[widget.index].options
            .any((option) => option.defaultOption == true)) {
          for (int j = 0;
              j < widget.menuOptions!.categories[widget.index].options.length;
              j++) {
            if (widget.menuOptions!.categories[widget.index].options[j]
                    .defaultOption ==
                true) {
              selectedOption[widget.index] = j;
              addOption(
                  widget.index,
                  j,
                  widget.menuOptions!.categories[widget.index].options[j]
                      .optionPrice);
              break;
            }
          }
        }
      } else {
        Set<int> processedOptions = {};

        for (int j = 0;
            j < widget.menuOptions!.categories[widget.index].options.length;
            j++) {
          int optionId = widget
              .menuOptions!.categories[widget.index].options[j].menuOptionId;

          if (widget.cartModel!.menu[widget.menuIndex!].options.any((option) =>
                  option.optionDescription ==
                  widget.menuOptions!.categories[widget.index].options[j]
                      .description) &&
              !processedOptions.contains(optionId)) {
            processedOptions.add(optionId);

            if (widget
                .menuOptions!.categories[widget.index].multipleSelection) {
              if (selectedMultipleOptions[widget.index] == null) {
                selectedMultipleOptions[widget.index] = {};
              }
              selectedMultipleOptions[widget.index]![j] = true;
              checkBox(widget.index, j, true);
            } else {
              selectedOption[widget.index] = j;
              addOption(
                  widget.index,
                  j,
                  widget.menuOptions!.categories[widget.index].options[j]
                      .optionPrice);
            }
          }
        }
      }
    });
  }

  // 메인 메뉴 가격 계산
  void addOption(int index, int index2, int price) {
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);
    final int finaloptionPrice = menuPriceStatus.mainMenuPrice;
    int priceDifference = 0;
    setState(() {
      // 이전에 선택된 옵션이 있다면 그 가격을 빼고 옵션 ID 제거
      if (selectedOptionPrice.containsKey(index)) {
        priceDifference -= selectedOptionPrice[index]!;
      }

      // 새로운 옵션 선택
      selectedOption[index] = index2;
      selectedOptionPrice[index] = price;
      // 새로운 옵션 가격 더하기
      priceDifference += price;

      // 새로운 옵션 ID 설정 (단일 선택)
      int newOptionId =
          widget.menuOptions!.categories[index].options[index2].menuOptionId;
      menuPriceStatus.setOptionId(index, newOptionId);
    });

    // 최종 계산
    menuPriceStatus.setFinalPrice(finaloptionPrice + priceDifference);
  }

  // 사이드 메뉴 가격 계산
  void checkBox(int index, int index2, bool value) {
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);
    final int finaloptionPrice = menuPriceStatus.optionPrice;

    if (selectedMultipleOptions[index] == null) {
      selectedMultipleOptions[index] = {};
    }
    selectedMultipleOptions[index]![index2] = value;

    int optionPrice =
        widget.menuOptions!.categories[index].options[index2].optionPrice;
    int optionId =
        widget.menuOptions!.categories[index].options[index2].menuOptionId;

    if (value) {
      addPrice = optionPrice;
      menuPriceStatus.addOptionId(index, optionId);
    } else {
      addPrice = -optionPrice;
      menuPriceStatus.removeOptionId(index, optionId);
    }
    // 최종
    menuPriceStatus.setOptionPrice(finaloptionPrice + addPrice);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.menuOptions!.categories[widget.index].options.length,
      itemBuilder: (context, index2) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (!widget
                .menuOptions!.categories[widget.index].multipleSelection) {
              addOption(
                widget.index,
                index2,
                widget.menuOptions!.categories[widget.index].options[index2]
                    .optionPrice,
              );
            }
            //---------------------------------------------------------------
            if (widget
                .menuOptions!.categories[widget.index].multipleSelection) {
              bool currentValue =
                  selectedMultipleOptions[widget.index]?[index2] ?? false;
              setState(() {
                checkBox(widget.index, index2, !currentValue);
              });
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 15,
                    right: screenWidth * 0.041,
                    left: screenWidth * 0.041),
                child: Row(
                  children: [
                    if (!widget.menuOptions!.categories[widget.index]
                        .multipleSelection)
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio<int>(
                          value: index2,
                          groupValue: selectedOption[widget.index],
                          onChanged: (value) {
                            addOption(
                              widget.index,
                              index2,
                              widget.menuOptions!.categories[widget.index]
                                  .options[index2].optionPrice,
                            );
                          },
                          activeColor: const Color(0xff6fbf8a),
                        ),
                      ),
                    if (widget.menuOptions!.categories[widget.index]
                        .multipleSelection)
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          value: selectedMultipleOptions[widget.index]
                                  ?[index2] ??
                              false,
                          onChanged: (bool? value) {
                            setState(() {
                              checkBox(widget.index, index2, value!);
                            });
                          },
                          activeColor: const Color(0xff6fbf8a),
                        ),
                      ),
                    const SizedBox(width: 17),
                    SizedBox(
                      width: screenWidth * 0.75,
                      child: Text(
                        widget.menuOptions!.categories[widget.index]
                            .options[index2].description,
                        style: const TextStyle(
                          color: Color(0xff111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (widget.menuOptions!.categories[widget.index]
                        .options[index2].adultMenu)
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red),
                        ),
                        child: const Center(
                          child: Text(
                            '19',
                            style: TextStyle(
                              color: Color(0xfff64f4f),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Color(0xfff5f5f5),
              ),
            ],
          ),
        );
      },
    );
  }
}
