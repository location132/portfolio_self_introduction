import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/faq_widget/faq_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/faq_widget/faq_item.dart';

class FaqView extends StatelessWidget {
  final IfsaiState? state;

  const FaqView({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, currentState) {
        final displayState = state ?? currentState;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaqTitle(
                currentTitleIndex: displayState.currentFaqTitleIndex,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenWidth > 1000 ? 150 : 100),
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth > 1000 ? 800 : screenWidth * 0.9,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 20 : 16,
                ),
                child: Column(
                  children:
                      TitleTextConstants.faqData.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> faq = entry.value;
                        return FaqItem(
                          question: faq['question']!,
                          answer: faq['answer']!,
                          isLast:
                              index == TitleTextConstants.faqData.length - 1,
                          screenWidth: screenWidth,
                        );
                      }).toList(),
                ),
              ),

              SizedBox(height: screenWidth > 600 ? 100 : 60),
            ],
          ),
        );
      },
    );
  }
}
