import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/faq_widget/faq_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/faq_widget/faq_item.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaqTitle(currentTitleIndex: state.currentFaqTitleIndex),
              const SizedBox(height: 150),
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
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
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
