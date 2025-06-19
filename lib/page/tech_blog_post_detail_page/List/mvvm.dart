import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/expandable_content.dart';

class Mvvm extends StatelessWidget {
  const Mvvm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const PostHeader(
                title: 'MVVM',
                tags: [
                  '#MVVM',
                  '#ViewModel',
                  '#Model',
                  '#View',
                  '#Data Binding',
                ],
                content:
                    '코드가 커질수록, 구조는 선택이 아닌 필수가 된다는 것을\n'
                    '잎사이 프로젝트와 포트폴리오 웹을 개발하며 체감하였습니다.\n\n'
                    'Flutter는 자유도가 높은 만큼, 구조 없이도 빠르게 구현할 수 있습니다.\n'
                    '하지만 기능이 많아질수록, 코드의 복잡도는 내가 만든 코드마저.. 이해할 수 없게 만들었고\n'
                    '그때마다 "처음부터 구조를 잘 잡았더라면…" 하는 후회가 남았습니다.\n\n'
                    '저는 2024년 6월부터 MVVM 패턴을 도입했습니다.\n\n'
                    '물론, 지금 제가 사용하는 방식이 정답은 아닐 수 있습니다.\n'
                    '하지만 시행착오 속에서 저만의 방식으로 정리된 MVVM 구조는\n'
                    '프로젝트를 안정적으로 운영하고, 유지보수 가능한 코드의 기반이 되어주고 있습니다.',
              ),
              const SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextTechBlog(title: 'MVVM이란?'),
                  const SizedBox(height: 30),
                  const ExpandableContent(
                    summary:
                        'MVVM(Model - View - ViewModel)은\n'
                        '어플리케이션의 UI와 비즈니스 로직, 그리고 상태(State)를\n'
                        '명확히 분리하기 위해 설계된 아키텍처 패턴입니다.',
                    detailContent:
                        'MVVM은 마이크로소프트에서 개발한 아키텍처 패턴으로,\n'
                        'WPF와 Silverlight에서 처음 소개되었습니다.\n\n'
                        '각 레이어의 역할:\n\n'
                        '🔸 1. Model: 앱의 핵심 데이터 구조와 비즈니스 로직을 담당합니다.\n'
                        '  - DB, API, 상태 값 등 실제 데이터 소스에 대한 정의와 처리\n\n'
                        '🔸 2. View: 사용자가 실제로 보는 UI 요소\n'
                        '  - 상태에 따라 화면을 그리는 역할만 담당 (로직을 직접 다루지 않음)\n\n'
                        '🔸 3. ViewModel: View와 Model을 연결하는 다리\n'
                        '  - View의 동작(클릭, 스크롤 등)을 받아 로직을 처리하고,\n'
                        '  - 그 결과를 View에 전달하기 위한 상태를 가공해서 넘김\n'
                        '  - View는 ViewModel이 제공하는 상태만 읽음\n\n'
                        'Flutter에서는 Provider, BLoC, Riverpod 등의 상태 관리 도구를\n'
                        '통해 MVVM 패턴을 구현할 수 있습니다.',
                    toggleText: '개념을 자세히 정리했어요. 궁금하면 Click',
                  ),
                  const SizedBox(height: 80),
                  const TitleTextTechBlog(
                    title: '개념을 토글해서 읽어봤는데..\n  Flutter에서는 MVVM이 불가능한거 아니에요?',
                  ),
                  const SizedBox(height: 40),
                  const ExpandableContent(
                    summary:
                        '맞아요.\n'
                        '저도 대학동기들과 해당 내용으로 토론을 진행했지만 그 당시에는 지식이 부족해서 졌어요..\n\n'
                        '전통적인 의미의 MVVM은 Flutter에서 그대로 구현하기 어렵습니다.\n\n',

                    toggleText: '이제는 토론에서 이길 수 있는\n  뒷 내용이 궁금하면 Click',
                    toggleTextClose: '재미있는 사실 확인하셨나요? (닫기)',
                    detailContent:
                        'MVVM에서 흔히 말하는 자동 양방향 바인딩(View ↔ ViewModel)은\n'
                        'Android의 LiveData, DataBinding, Swift의 Combine, WPF의 INotifyPropertyChanged처럼\n'
                        '특정 프레임워크와 언어 기능에 의존합니다.\n'
                        '하지만 Flutter는?\n'
                        '"UI는 전부 코드로 쓰고, 상태는 직접 다뤄야 하는 선언형 프레임워크"입니다.\n\n'
                        '그래서 전통적인 MVVM을 Flutter에 적용하면 생기는 문제:\n\n'
                        '• ViewModel에서 상태를 자동으로 View에 바인딩할 수 없습니다.\n'
                        '  → @Binding이나 observable 같은 자동 바인딩 개념이 없습니다.\n\n'
                        '• View가 ViewModel을 직접 참조하기 어렵습니다.\n'
                        '  → Flutter에서는 StatefulWidget, BuildContext, setState, Provider, Bloc 등으로 View 갱신을 별도로 구성해야 합니다.\n\n'
                        '• UI의 선언형 의미와 충돌할 수 있습니다.\n'
                        '  → 상태를 숨기면 오히려 디버깅이 더 어려워질 수 있습니다.\n\n\n\n'
                        '그런데도, 왜 다들 MVVM을 쓴다고 하나요?\n\n'
                        '"MVVM을 Flutter에 맞게 해석해서 사용하는 것"입니다.\n\n'
                        '핵심은 구조입니다.\n'
                        '• View는 UI만 담당하고,\n'
                        '• ViewModel은 상태를 변경하며,\n'
                        '• Model은 실제 데이터를 관리하는 구조.\n\n'
                        '즉, 자동 바인딩은 없어도,\n'
                        '"책임 분리", "단방향 데이터 흐름", "상태 기반 UI"만 잘 갖추면\n'
                        'MVVM로 Flutter에서도 충분히 구현할 수 있습니다.',
                  ),
                  const SizedBox(height: 80),
                  const TitleTextTechBlog(title: 'MVVM 데이터 흐름도'),
                  const SizedBox(height: 30),
                  const Text(
                    '[사용자 행동] → [ViewModel에서 로직 처리] → [Model 상태 변경]\n'
                    '→ [ViewModel이 상태 가공] → [View가 상태를 받아 UI 렌더링]',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Divider(color: Colors.grey.shade700, thickness: 1),
                  const SizedBox(height: 150),
                  Center(
                    child: const Text(
                      '정답은 아닐 수 있지만, 나만의 MVVM으로 재해석한',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Center(
                    child: const Text(
                      '구조와 방법 지금부터 소개합니다.',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 150),

                  Divider(color: Colors.grey.shade700, thickness: 1),
                  const SizedBox(height: 30),
                  const TitleTextTechBlog(title: '먼저, M — Model'),
                  const SizedBox(height: 30),
                  StoryBlock(
                    story:
                        'Flutter에서는 저는 freezed를 사용해 모델을 선언합니다.\n'
                        'freezed는 불변성과 구조적인 상태 관리를 쉽게 해주기 때문에,\n'
                        'MVVM의 “예측 가능한 상태 관리” 의도와 잘 맞을 수 있도록 했습니다.\n\n'
                        '예를 들어, ChapterModel은 화면 내 챕터 섹션의 상태를 정의합니다',
                  ),
                  const SizedBox(height: 30),
                  CodeBlock(
                    title: '''@freezed를 사용한 Model''',
                    language: 'dart',
                    code: r'''
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isBlackBackgroundColor,
    @Default(false) bool isChapterActive,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isManuallyChanged,

    // 챕터 디테일 관련 필드
    @Default(false) bool isChapterDetailVisible,
    @Default(false) bool isChapterDetailAni,
    @Default(0) int selectedChapterIndex,
    @Default(false) bool isChapterDetailAniTitle,
    @Default(false) bool isChapterDetailAniContent,
    @Default(false) bool isChapterDetailAniText,
    @Default(false) bool isChapterDescriptionAni,
    @Default(false) bool isButtonVisible,
    @Default(false) bool isChapterContentVisible,
    @Default(ChapterDetailButton.none) ChapterDetailButton chapterDetailButton,
    @Default(false) bool isBackGroundAniStart,

    // 챕터2 섹션 관련 필드
    @Default(0) int currentChapter2Index,
    @Default([]) List<Map<String, String>> chapter2Sections,
  }) = _ChapterModel;
}

enum ChapterDetailButton { none, simple, detail }

''',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
