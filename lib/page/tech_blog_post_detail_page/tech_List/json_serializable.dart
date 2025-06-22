import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';

class JsonSerializablePage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;

  const JsonSerializablePage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<JsonSerializablePage> createState() => _JsonSerializablePageState();
}

class _JsonSerializablePageState extends State<JsonSerializablePage> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateScrollOffset();
    });
  }

  void _calculateScrollOffset() {
    if (_codeExampleSectionKey.currentContext != null) {
      final RenderBox renderBox =
          _codeExampleSectionKey.currentContext!.findRenderObject()
              as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final cubit = context.read<TechBlogPostDetailCubit>();
      if (widget.isMobile) {
        cubit.setScrollTargetOffset(position.dy - 0);
      } else {
        cubit.setScrollTargetOffset(position.dy - 250);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: widget.scrollController,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: EdgeInsets.all(widget.isMobile ? 24.0.w : 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.isMobile ? 100.h : 100),
                  PostHeader(
                    title: 'JSON Serializable',
                    tags: const [
                      '#JSON Serializable',
                      '#JSON',
                      '#Serialization',
                      '#DTO',
                      '#API Response',
                      '#Code Generation',
                      '#JSON 직렬화',
                      '#데이터 변환',
                    ],
                    content:
                        '서버와의 DIO를 사용해 받아온 응답을 Dart의 모델로 변환해 State로 넘겨주는 과정을 수동으로 작성하는 경우, '
                        '서버에서 값이 누락되거나 프론트엔드 개발자가 실수로 일부 입력을 빠뜨리는 상황이 발생할 수 있습니다.\n\n'
                        '저는 이 과정을 1대1 맞춤으로 대응하고, 누락된 값이 있을 시 error-32: 해당 값 누락 에러 코드를 서버에 '
                        '다시 전송하여, 서버와 협업해 문제를 해결했습니다.\n\n'
                        '이번 포스트에서는 JSON Serializable을 어떻게 활용하는지, 그리고 보조인 Freezed와 함께 사용할 때의 '
                        '시너지 효과를 소개합니다.\n\n'
                        'Freezed는 다른 기술 블로그에서 상세하게 다뤄지고 있습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'JSON Serializable이란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'JSON Serializable은 JSON 데이터와 Dart 객체 간의 변환 코드를\n'
                            '자동으로 생성해 주는 라이브러리입니다.\n\n'
                            '직접 파싱 로직을 작성하지 않아도, `fromJson`과 `toJson` 메서드를\n'
                            '자동 생성해 주기 때문에 실수 없이 안정적으로 사용 가능합니다.',
                        detailContent:
                            '🔸 자동 코드 생성\n'
                            '  - `build_runner` 실행만으로 변환 로직을 만들어 줍니다.\n\n'
                            '🔸 타입 안전성 보장\n'
                            '  - Map<String, dynamic>보다 명확한 필드 타입을 지원해\n'
                            '    잘못된 타입으로 인한 런타임 오류를 줄여줍니다.\n\n'
                            '🔸 Freezed와의 결합\n'
                            '  - 불변(immutable) 모델 생성, `copyWith` 등의 추가 메서드를\n'
                            '    Freezed가 자동으로 제공해 줍니다.\n\n'
                            '🔸 복잡한 JSON 구조 처리\n'
                            '  - 중첩된 객체나 리스트를 포함한 JSON도 간단한 어노테이션만으로\n'
                            '    변환 로직을 관리할 수 있습니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '그냥 Map<String, dynamic>으로 사용하면 안 되나요?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '저도 처음에는 Map<String, dynamic>으로 받아서\n'
                            '필요할 때마다 키로 받아서 사용했습니다.\n\n'
                            '그러나 막상 써보니까…',
                        toggleText: '개발하면서 겪었던 문제들이 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '❌ 타입 안전성 부족 (중요)\n'
                            '  - 잘못된 키 이름이나 타입이 바뀌면\n'
                            '    런타임 오류가 발생하기 쉽습니다.\n\n'
                            '❌ 런타임 에러 발생\n'
                            '  - 값이 없거나 null인 경우를 일일이 검사해야 해\n'
                            '    번거롭고, 누락 시 앱이 크래시될 수 있습니다.\n\n'
                            '❌ 코드 가독성 저하 (중요)\n'
                            '  - 비즈니스 로직과 파싱 로직이 섞여\n'
                            '    복잡도가 증가합니다.\n\n'
                            '❌ 리팩토링 어려움 (중요)\n'
                            '  - JSON 구조가 변경되면\n'
                            '    파싱 코드를 일일이 찾아 수정해야 합니다.\n\n'
                            '✅ 도입 후 개선\n'
                            '  - 어노테이션 기반 자동 생성으로 파싱 코드를 제거하고\n'
                            '    타입 변경, 필드 추가 시에도 안전하게 대응할 수 있었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle:
                            ' 제 프로젝트에서 사용하는\n'
                            'JSON Serializable 활용 방법\n\n'
                            '\n\n1. 기본 DTO 클래스 만들기\n'
                            '2. Freezed와 함께 사용하기\n'
                            '3. Repository 패턴에서 활용하기\n',
                        textSubTitle: '',

                        textSubTitle2: '\n\n아래 소개하는 코드는 제 프로젝트에서 직접 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'DTO 클래스 만들기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 처음 프로젝트에서 서버와 협업할 때 항상 API 응답을 Map<String, dynamic>같은 형식으로 받아서 사용했습니다.\n\n'
                            '처음에는 "그냥 키로 접근하면 되는데 왜이리 복잡하게 가나.." 생각했거든요.\n\n'
                            '하지만 프로젝트가 커지면서 정말 많은 문제를 겪었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '잎사이 프로젝트 - 서버 응답 (가장 간단한 응답입니다.)',
                        language: 'json',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
{
  "isServerConnected": true,
  "appVersion": "1.0.0",
  "marketDataVersion": "2024.01"
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 간단한 JSON 응답을 처리하는데도 제가 겪은 문제들이 한두 개가 아니었습니다.\n'
                            '정말 기억에 남는 버그가 있었는데',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '3년전 코드?',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
final response = await dio.get("/api/start");
final data = response.data as Map<String, dynamic>;

final isConnected = data["isServerConnected"] as bool? ?? false;
final version = data["appVersion"] as String? ?? "";
final marketVersion = data["marketDataVersion"] as String? ?? "";
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '언뜻 보면 문제없이?(물론 저런 형식 사용하면 안되는 걸 알고 있습니다.!) 하지만 막상 써보니까\n\n'
                            '🔸 오타로 인한 런타임 에러: "isServerConneted" (오타!) 라고 쓴 적이 있었는데, 앱을 실행할 때 크래시가 났던 기억이 있습니다.\n\n'
                            '🔸 서버 응답 변경 시 대응 어려움: 서버에서 필드명을 바꾸거나 새 필드를 추가할 때마다 모든 관련 코드를 찾아서 수정해야 했습니다.\n\n'
                            '🔸 타입 안전성 부족: as String? 같은 캐스팅을 할 때 int가 와서 에러가 난 적도 있었습니다.\n\n'
                            '특히 서버 개발자분과 협업할 때 "error-32: 해당 값 누락" 같은 에러 코드를 주고받으며 디버깅하는 시간이 정말 많았습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '\n\n하지만 JSON Serializable을 도입한 후에는 이런 문제들이 완전히 사라졌습니다.\n'
                            '제가 적용한 코드를 소개하겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '개선된 StartResponse 클래스',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:json_annotation/json_annotation.dart';

part 'start_response.g.dart';

@JsonSerializable()
class StartResponse {
  final bool isServerConnected;
  final String? appVersion;
  final String? marketDataVersion;

  StartResponse({
    required this.isServerConnected,
    this.appVersion,
    this.marketDataVersion,
  });

  factory StartResponse.fromJson(Map<String, dynamic> json) =>
      _$StartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StartResponseToJson(this);
}
''',
                      ),

                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '더 이상 as bool? ?? false 같은 캐스팅도 필요 없고,\n'
                            '오타로 인한 런타임 에러도 완전히 사라졌습니다.\n\n'
                            '하지만 여기서 중요한 건 build_runner를 실행해야 한다는 점입니다.\n',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'build_runner 명령어',
                        language: 'bash',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dart run build_runner build

dart run build_runner watch
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'watch 명령어를 사용하면 파일이 변경될 때마다 자동으로 .g.dart 파일을 생성해줍니다.\n'
                            '개발할 때는 watch를 켜놓고 작업하면 실시간 코드 생성이 가능합니다. \n\n'
                            '마지막으로 서버 개발자와 협업할 때도 "필드명 오타 났습니다" 같은 말을 할 일이 없어졌습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Freezed와 함께 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '프로젝트에서는 Freezed와 함께 사용하는 경우가 많습니다.\n\n'
                            '저도 처음에는 "JSON Serializable만으로도 충분한데 왜 Freezed까지?" 생각했는데,\n'
                            'ICT 인턴에서 선배 개발자들과 사용해보니 정말 강력한 조합이였던 기억이 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '제 프로젝트 Cart Response - Freezed 조합',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const CartResponse._();
  
  const factory CartResponse({
    @Default([]) List<Cart>? carts,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  List<CartModel> toModel() {
    return carts!.map((cart) => CartModel(
      basketId: cart.basketId,
      marketId: cart.marketId,
      marketName: cart.marketName,
      totalPrice: cart.totalPrice,
    )).toList();
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '보시면 @freezed 어노테이션 하나로 불변 객체의 모든 기능을 얻으면서\n'
                            '동시에 JSON 직렬화도 자동으로 처리됩니다.\n\n'
                            '게다가 toModel() 메서드로 DTO를 Domain Model로 변환하는 로직까지 깔끔하게 넣을 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '복잡한 JSON 구조도 쉽게 처리',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    required int basketMenuId,
    required int menuId,
    required String menuName,
    required String menuImageUrl,
    required int menuPrice,
    required int amount,
    required List<OptionResponse> options,
    required bool discountAvailability,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);
}

@freezed
class OptionResponse with _$OptionResponse {
  const factory OptionResponse({
    required String optionDescription,
    required int optionPrice,
  }) = _OptionResponse;

  factory OptionResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionResponseFromJson(json);
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '중첩된 객체나 List까지 완벽하게 처리가능합니다.\n\n'
                            '이전에는 data["options"]을 List로 캐스팅하고, 다시 각 요소를 Map으로 캐스팅하고 정말 복잡했지만,\n'
                            '이제는 단순히 MenuResponse.fromJson(json)만 하면 모든 것이 해결됩니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 240.h : 240),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Repository 패턴에서 활용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 JSON Serializable를 Repository Pattern과 함께 사용하고있습니다.\n\n'
                            '아래의 코드는\n'
                            'API 응답 → DTO 변환 → Domain Model 변환까지의 계층 구조입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '1. Repository 인터페이스',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
abstract class StartRepository {
  Future<Either<String, Ifsai>> getStartData();
}

class StartRepositoryImpl implements StartRepository {
  final StartRemoteSource _remoteSource;
  final StartLocalSource _localSource;

  StartRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<Either<String, Ifsai>> getStartData() async {
    try {
      final response = await _remoteSource.getStartData();
      final model = response.toModel();
      await _localSource.saveStartData(model);
      return Right(model);
    } catch (e) {
      return Left('서버 연결 실패: ${e.toString()}');
    }
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Repository에서 핵심은 response.toModel() 부분입니다.\n'
                            'JSON Serializable로 만든 DTO에서 Domain Model로 안전하게 변환하는 과정이죠.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '2. Remote Source - API 호출',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class StartRemoteSource {
  final Dio _dio;

  StartRemoteSource(this._dio);

  Future<StartIfsaiResponse> getStartData() async {
    final response = await _dio.get('/api/start');
    
    // JSON Serializable의 fromJson 사용
    return StartIfsaiResponse.fromJson(response.data);
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '여기서 StartIfsaiResponse.fromJson(response.data) 한 줄로\n'
                            '복잡한 JSON 파싱이 모두 해결됩니다.\n\n'
                            '이전에는 이 부분에서 타입 캐스팅 에러가 자주 발생했었는데, 이제는 안전합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '3. DTO → Domain Model 변환',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@freezed
class StartIfsaiResponse with _$StartIfsaiResponse {
  const StartIfsaiResponse._();

  const factory StartIfsaiResponse({
    required bool isServerConnected,
    String? appVersion,
    String? marketDataVersion,
  }) = _StartIfsaiResponse;

  factory StartIfsaiResponse.fromJson(Map<String, dynamic> json) =>
      _$StartIfsaiResponseFromJson(json);

  // DTO → Domain Model 변환
  Ifsai toModel() {
    return Ifsai(
      isServerConnected: isServerConnected,
      appVersion: appVersion ?? '',
      marketDataVersion: marketDataVersion ?? '',
    );
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'toModel() 메서드에서 DTO를 Domain Model로 변환합니다.\n'
                            '여기서 null 체크나 기본값 설정 등의 비즈니스 로직을 처리할 수 있습니다.\n\n'
                            '이렇게 하면 Repository → Cubit → UI로 이어지는 전체 데이터 흐름이\n'
                            '타입 안전하게 보장됩니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '4. Cubit에서 사용',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class StartCubit extends Cubit<StartState> {
  final StartRepository _repository;

  StartCubit(this._repository) : super(StartState.initial());

  Future<void> loadStartData() async {
    emit(state.copyWith(isLoading: true));
    
    final result = await _repository.getStartData();
    
    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        errorMessage: error,
      )),
      (data) => emit(state.copyWith(
        isLoading: false,
        ifsaiData: data,
      )),
    );
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '최종적으로 Cubit에서는 깔끔하게 Repository만 호출하면 됩니다.\n'
                            'JSON 파싱, 타입 변환, 에러 처리 등은 모두 하위 레이어에서 처리되므로\n'
                            '비즈니스 로직에만 집중할 수 있습니다.\n\n',
                      ),
                      SizedBox(height: widget.isMobile ? 150.h : 150),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
