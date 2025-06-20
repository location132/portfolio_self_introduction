import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/data_flow_chart.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/subtitle_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/title_text_tech.dart';

class RepositoryPattern extends StatelessWidget {
  final bool isBackgroundColorWhite;
  final GlobalKey codeExampleSectionKey;

  const RepositoryPattern({
    super.key,
    required this.isBackgroundColorWhite,
    required this.codeExampleSectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        MyStoryStart(
          isBackgroundColorWhite: isBackgroundColorWhite,
          codeExampleSectionKey: codeExampleSectionKey,
          textTitle: 'ICT 인턴에서 배운 현업 Clean Architecture',
          textSubTitle: '프로젝트 구조를 개선하는 저만의 방법을 소개합니다.',
          textSubTitle2: '\n\n\n\n소개하는 코드는 제 잎사이 프로젝트에서 실제 구현한 코드입니다.',
        ),
        const SizedBox(height: 30),
        TitleTextTechBlog(
          title: '데이터 계층 (Data Layer)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        SubtitleTextTechBlog(
          title: '바로 핵심부터\n    데이터 계층, 저는 이렇게 사용하고 있어요',
          isBackgroundColor: isBackgroundColorWhite,
        ),

        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: DataFlowChart(
            isLastStep: false,
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
              'RemoteResponse',
              'RemoteDTO',
              'Model',
              'State Cubit',
            ],
          ),
        ),
        const SizedBox(height: 80),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '다음으로 제가 데이터 계층에서 어떻게 사용하는지 기술해보겠습니다!\n데이터 계층은 아래 아래의 내용을 포함해 설명하겠습니다.',
        ),
        const SizedBox(height: 80),

        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '• Repository: 도메인 계층에 필요한 데이터 접근 로직을 추상화\n'
              '• DTO: 외부 API/DB 통신용 데이터 구조 정의 및 캡슐화\n'
              '• Mapper: DTO ↔ 도메인 모델 간 변환 책임\n'
              '• Data Source: API 호출, 로컬 DB(Isar) 쿼리 처리\n\n',
        ),
        const SizedBox(height: 100),
        SubtitleTextTechBlog(
          title: '이제 시작합니다!.',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        SizedBox(height: 50),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DataFlowChart(
                  isBackgroundColor: isBackgroundColorWhite,
                  flowSteps: const ['Cubit'],
                ),
              ),
            ],
          ),
        ),
        // 큐빅코드와 큐빅이 Service 파일에 넘겨주는 방법
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Cubit은 Clean Architecture에서 Presentation 계층의 핵심입니다.\n'
              'UI와 비즈니스 로직을 연결하는 시작점 역할을 하며,\n'
              'Service를 통해서만 데이터에 접근합니다.\n\n'
              'ShoppingCartCubit의 구현을 살펴보겠습니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''ShoppingCartCubit - Clean Architecture의 시작점''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@injectable
class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  final CartRemoteService _cartRemoteService;

  ShoppingCartCubit(this._cartRemoteService)
      : super(const ShoppingCartState(screenState: ScreenState.loading));

  // 장바구니 조회 - Service를 통해서만 데이터 접근
  Future<void> getMycart({
    int cacheMemory = 0,
    required LoginModel loginStatus,
    required CartProvider cartProvider,
  }) async {
    if (state.screenState != ScreenState.loading) {
      emit(state.copyWith(screenState: ScreenState.loading));
    }

    try {
      // Service를 통해 데이터 가져오기
      final List<CartModel> cartData =
          await _cartRemoteService.getMyCartWithDio(cacheMemory: cacheMemory);

      // UI 상태 관리 로직
      if (cartData.isNotEmpty) {
        final int totalMenuItems = cartData[0].menu.length;

        // 비즈니스 로직: 캐시 불일치 시 재요청
        if (totalMenuItems != loginStatus.basketCount && cacheMemory == 0) {
          return getMycart(
              cacheMemory: 1,
              loginStatus: loginStatus,
              cartProvider: cartProvider);
        }

        await getRecommendedSideMenu(cartData[0].marketId);
        _updateUI(loginStatus, cartProvider, cartData, totalMenuItems);
      }

      emit(state.copyWith(
        cartModel: cartData,
        screenState: ScreenState.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(screenState: ScreenState.loaded));
    }
  }

  // 사장 추천 사이드 메뉴 추천
  Future<void> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteService.getRecommendedSideMenu(marketId);

    emit(state.copyWith(recommendedSideMenu: response));
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Cubit에서 중요한 원칙들:\n\n'
              '✅ 오직 Service만 의존성으로 주입받습니다\n'
              '✅ Repository나 Data Source를 직접 호출하지 않습니다\n'
              '✅ UI 상태 관리와 간단한 비즈니스 로직에만 집중합니다\n'
              '✅ 복잡한 데이터 처리는 Service에 위임합니다\n\n'
              '이런 구조로 Cubit은 깔끔하고 테스트하기 쉬워집니다.',
        ),
        const SizedBox(height: 80),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DataFlowChart(
                  isBackgroundColor: isBackgroundColorWhite,
                  flowSteps: const ['Cubit', 'Service File'],
                ),
              ),
            ],
          ),
        ),
        // Service코드와 Service  파일이 Remote Repository 넘겨주는 방법
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Service는 Repository를 조합해서 복잡한 비즈니스 로직을 처리합니다.\n'
              'Cubit과 Repository 사이에서 중재자 역할을 하며,\n'
              '여러 Repository의 결과를 조합하거나 데이터를 가공할 때 사용합니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''CartRemoteService - 비즈니스 로직 조합''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@singleton
class CartRemoteService {
  final CartRemoteRepository _cartRemoteRepository;

  CartRemoteService(this._cartRemoteRepository);

  // 단순한 경우: Repository를 그대로 전달
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    return await _cartRemoteRepository.getMyCartWithDio(
        cacheMemory: cacheMemory);
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    return await _cartRemoteRepository.getRecommendedSideMenu(marketId);
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Service 계층의 역할:\n\n'
              '✅ 여러 Repository 결과를 조합합니다\n'
              '✅ 복잡한 비즈니스 규칙을 적용합니다\n'
              '✅ 데이터 검증과 전처리를 담당합니다\n'
              '✅ Cubit이 단순하게 유지되도록 도와줍니다\n\n'
              '단순한 CRUD라면 Repository를 그대로 전달하고,\n'
              '복잡한 로직이 필요하면 Service에서 처리합니다.',
        ),
        const SizedBox(height: 80),

        // Service => Remote Repository
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DataFlowChart(
                  isBackgroundColor: isBackgroundColorWhite,
                  flowSteps: const [
                    'Cubit',
                    'Service File',
                    'Remote Repository',
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Repository는 도메인 계층과 데이터 계층 사이의 경계입니다.\n'
              '데이터 소스(API, DB)를 추상화하여\n'
              '상위 계층이 데이터 접근 방식에 의존하지 않도록 만들어줍니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''CartRemoteRepository - 데이터 접근 추상화''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@singleton
class CartRemoteRepository {
  final CartRemoteSource _cartRemoteSource;
  
  CartRemoteRepository(this._cartRemoteSource);

  // 내 장바구니 조회 - Data Source를 추상화
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    List<CartModel> cartData =
        await _cartRemoteSource.getMyCartWithDio(cacheMemory: cacheMemory);
    return cartData;
  }

  // 사이드 메뉴 추천 - 단순한 전달 역할
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteSource.getRecommendedSideMenu(marketId);
    return response;
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Repository가 중요한 이유:\n\n'
              '✅ 의존성 역전 원칙 구현 - 상위 계층이 하위 계층에 의존하지 않음\n'
              '✅ 데이터 소스 교체 용이 - API에서 로컬 DB로 변경해도 상위 계층 영향 없음\n'
              '✅ 테스트 격리 - Repository를 Mock으로 대체해서 독립적 테스트 가능\n'
              '✅ 단일 책임 원칙 - 데이터 접근 로직만 담당\n\n'
              'Repository는 "무엇을"에 집중하고, Data Source는 "어떻게"에 집중합니다.',
        ),
        const SizedBox(height: 80),

        // Remote Repository => Remote Source
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DataFlowChart(
                  isBackgroundColor: isBackgroundColorWhite,
                  flowSteps: const [
                    'Cubit',
                    'Service File',
                    'Remote Repository',
                    'Remote Source',
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Remote Source는 외부 API를 호출하거나 로컬 DB에 접근하는 계층입니다.\n'
              'DIO 요청, 응답 처리, 에러 핸들링 등 구체적인 데이터 접근 로직을 담당합니다.\n\n'
              '여기서 DTO → Model 변환이 일어납니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''CartRemoteSource - API 호출과 변환''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@singleton
class CartRemoteSource {
  // 내 장바구니 조회 - API 호출 + DTO 변환
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    // 1. DIO API 호출
    CartResponse response =
        await getMyCartWithDioRequest(cacheMemory: cacheMemory);
    
    // 2. DTO를 도메인 Model로 변환
    return response.toModel();
  }

  // 사이드 메뉴 추천 - 마찬가지로 API 호출 + 변환
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    RecommendedSideMenuResponse response =
        await getRecommendedSideMenuRequest(marketId);
    return response.toModel();
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Remote Source의 핵심 역할:\n\n'
              '✅ 외부 통신 담당 (DIO, HTTP, GraphQL 등)\n'
              '✅ DTO를 도메인 Model로 변환 (response.toModel())\n'
              '✅ 네트워크 에러, 타임아웃 등 기술적 예외 처리\n'
              '✅ 캐시, 로컬 스토리지 등 구체적 구현\n\n'
              '이 계층에서 기술적 세부사항이 모두 처리되어\n'
              '상위 계층은 깔끔한 도메인 모델만 받게 됩니다.',
        ),
        const SizedBox(height: 80),

        // Remote Source => Remote Dio Request
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: DataFlowChart(
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service File',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Remote Dio Request는  HTTP,DIO 통신을 담당하는 가장 하위 계층입니다.\n'
              'DIO 라이브러리를 사용해서 서버와 직접 통신하며,\n'
              '네트워크 설정, 헤더, 인증 등을 처리합니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''DIO Request 함수들''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 내 장바구니 조회 DIO 요청
Future<CartResponse> getMyCartWithDioRequest({int cacheMemory = 0}) async {
  try {
    final response = await dio.get(
      '/api/cart/my-cart',
      queryParameters: {
        'cacheMemory': cacheMemory,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${await getAccessToken()}',
          'Content-Type': 'application/json',
        },
      ),
    );
    
    return CartResponse.fromJson(response.data);
  } on DioException catch (e) {
    throw _handleDioError(e);
  }
}

// 사이드 메뉴 추천 DIO 요청
Future<RecommendedSideMenuResponse> getRecommendedSideMenuRequest(int marketId) async {
  try {
    final response = await dio.get(
      '/api/menu/recommended-side/$marketId',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${await getAccessToken()}',
        },
      ),
    );
    
    return RecommendedSideMenuResponse.fromJson(response.data);
  } on DioException catch (e) {
    throw _handleDioError(e);
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'DIO Request 계층의 책임:\n\n'
              '✅ HTTP 통신 (GET, POST, PUT, DELETE)\n'
              '✅ 인증 토큰 관리 및 헤더 설정\n'
              '✅ 네트워크 에러 처리 및 재시도 로직\n'
              '✅ 타임아웃, 인터셉터 등 네트워크 설정\n\n'
              '이 계층에서 순수한 HTTP 통신만 담당합니다.',
        ),
        const SizedBox(height: 80),

        // Remote Dio Request => RemoteResponse
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: DataFlowChart(
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service File',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
              'RemoteResponse',
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'RemoteResponse는 서버에서 받은 원시 JSON 응답입니다.\n'
              '이 응답을 DTO 객체로 변환하여 타입 안전성을 확보하고\n'
              '구조화된 데이터로 만들어줍니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''서버 응답 (JSON)''',
          language: 'json',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 장바구니 조회 API 응답
{
  "carts": [
    {
      "basketId": 123,
      "marketId": 456,
      "marketName": "맛있는 치킨집",
      "menu": [
        {
          "basketMenuId": 789,
          "menuId": 101,
          "menuName": "후라이드 치킨",
          "menuImageUrl": "주소는 서버의 주소가 있기때문에 생략하겠습니다!!",
          "menuPrice": 18000,
          "amount": 2,
          "optionTotalPrice": 2000,
          "totalPrice": 38000,
          "options": [
            {
              "optionDescription": "콜라 추가",
              "optionPrice": 2000
            }
          ],
          "discountAmount": 0,
          "discountRate": 0,
          "discountAvailability": false
        }
      ],
      "totalPrice": 38000
    }
  ]
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'JSON 응답의 특징:\n\n'
              '✅ 서버에서 정의한 원시 데이터 구조\n'
              '✅ 네트워크를 통해 전송되는 데이터\n'
              '✅ 문자열 형태로 전달되어 파싱이 필요\n'
              '✅ 서버 스펙 변경 시 구조가 바뀔 수 있음\n\n'
              '이 응답을 다음 단계에서 DTO로 변환합니다.',
        ),
        const SizedBox(height: 80),

        // RemoteResponse => RemoteDTO
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: DataFlowChart(
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service File',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
              'RemoteResponse',
              'RemoteDTO',
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'RemoteDTO(Data Transfer Object)는 서버 응답을 구조화된 객체로 변환하는 계층입니다.\n'
              'JSON 응답을 타입 안전한 Dart 객체로 변환하고,\n'
              '도메인 Model로 변환하는 Mapper 기능도 포함합니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''CartResponse - 서버 응답을 위한 DTO''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 장바구니 조회 응답 DTO
@freezed
class CartResponse with _$CartResponse {
  const CartResponse._();
  const factory CartResponse({
    @Default([]) List<Cart>? carts,
  }) = _CartResponse;

  // JSON → DTO 변환
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  // DTO → Domain Model 변환 (Mapper)
  List<CartModel> toModel() {
    return carts!
        .map((cart) => CartModel(
              basketId: cart.basketId,
              marketId: cart.marketId,
              marketName: cart.marketName,
              menu: cart.menu
                  .map((menuResponse) => Menu(
                        basketMenuId: menuResponse.basketMenuId,
                        menuId: menuResponse.menuId,
                        menuName: menuResponse.menuName,
                        // ... 기타 필드들
                      ))
                  .toList(),
              totalPrice: cart.totalPrice,
            ))
        .toList();
  }
}

// DTO 내부 구조체들
@freezed
class Cart with _$Cart {
  const factory Cart({
    required int basketId,
    required int marketId,
    required String marketName,
    required List<MenuResponse> menu,
    required int totalPrice,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    required int basketMenuId,
    required int menuId,
    required String menuName,
    required String menuImageUrl,
    required int menuPrice,
    required int amount,
    required int optionTotalPrice,
    required int totalPrice,
    required List<OptionResponse> options,
    required int discountAmount,
    required int discountRate,
    required bool discountAvailability,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'RemoteDTO의 핵심 역할:\n\n'
              '✅ JSON 직렬화/역직렬화 담당 (fromJson, toJson)\n'
              '✅ 서버 스펙에 맞는 데이터 구조 정의\n'
              '✅ 도메인 Model로 변환하는 Mapper 기능 (toModel)\n'
              '✅ 서버 응답 변경 시 영향 범위를 DTO 계층으로 제한\n\n'
              'DTO는 "서버가 보내주는 형태"를 그대로 반영하고,\n'
              'Model은 "앱에서 사용하기 편한 형태"로 변환합니다.',
        ),
        const SizedBox(height: 80),

        // RemoteDTO => Model
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: DataFlowChart(
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service File',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
              'RemoteResponse',
              'RemoteDTO',
              'Model',
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Model은 앱의 도메인 계층에서 사용하는 핵심 데이터 구조입니다.\n'
              'DTO와 달리 비즈니스 로직에 최적화된 형태로 설계되며,\n'
              'UI와 비즈니스 로직에서 직접 사용됩니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''CartModel - 도메인을 위한 Model''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 장바구니 도메인 모델
@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    int? basketId,
    required int marketId,
    required String marketName,
    required List<Menu> menu,
    int? totalPrice,
  }) = _CartModel;
}

@freezed
class Menu with _$Menu {
  const factory Menu({
    required int basketMenuId,
    required int menuId,
    required String menuName,
    required String menuImageUrl,
    required int menuPrice,
    required int amount,
    required int optionTotalPrice,
    required int totalPrice,
    required List<Option> options,
    required int discountAmount,
    required int discountRate,
    required bool discountAvailability,
  }) = _Menu;
}

@freezed
class Option with _$Option {
  const factory Option({
    required String optionDescription,
    required int optionPrice,
  }) = _Option;
}

// 사이드 메뉴 추천 모델
@freezed
class SideMenuModel with _$SideMenuModel {
  const factory SideMenuModel({
    required int menuId,
    required int price,
    required String imageUrl,
    required String menuName,
    required bool bestMenu,
  }) = _SideMenuModel;
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Model과 DTO의 차이점:\n\n'
              '✅ **Model**: 비즈니스 로직에 최적화된 구조\n'
              '  • UI에서 직접 사용하기 편한 형태\n'
              '  • 필수/선택 필드가 비즈니스 요구사항에 맞게 설계\n'
              '  • 도메인 규칙과 제약사항 반영\n\n'
              '✅ **DTO**: 서버 통신에 최적화된 구조\n'
              '  • 서버 API 스펙을 그대로 반영\n'
              '  • JSON 직렬화/역직렬화에 특화\n'
              '  • 서버 변경사항의 영향을 DTO에서 흡수\n\n'
              '이런 분리를 통해 서버 스펙 변경이 비즈니스 로직에\n'
              '직접적인 영향을 주지 않도록 보호합니다.',
        ),
        const SizedBox(height: 80),

        // Model => State Cubit (완전한 흐름)
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          child: DataFlowChart(
            isLastStep: true,
            isBackgroundColor: isBackgroundColorWhite,
            flowSteps: const [
              'Cubit',
              'Service',
              'Remote Repository',
              'Remote Source',
              'Remote Dio Request',
              'RemoteResponse',
              'RemoteDTO',
              'Model',
              'State Cubit',
            ],
          ),
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '마지막 단계입니다! JSON 응답을 DTO로 변환하고,\n'
              'DTO를 도메인 Model로 변환한 후,\n'
              '최종적으로 Cubit의 State로 전달됩니다.',
        ),
        const SizedBox(height: 30),
        CodeBlock(
          title: '''DTO와 Model 변환 과정''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// 1. JSON → DTO 변환 (CartResponse.fromJson)
@freezed
class CartResponse with _$CartResponse {
  const CartResponse._();
  const factory CartResponse({
    @Default([]) List<Cart>? carts,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  // 2. DTO → Domain Model 변환 (Mapper)
  List<CartModel> toModel() {
    return carts!
        .map((cart) => CartModel(
              basketId: cart.basketId,
              marketId: cart.marketId,
              marketName: cart.marketName,
              menu: cart.menu
                  .map((menuResponse) => Menu(
                        basketMenuId: menuResponse.basketMenuId,
                        menuId: menuResponse.menuId,
                        menuName: menuResponse.menuName,
                        menuImageUrl: menuResponse.menuImageUrl,
                        menuPrice: menuResponse.menuPrice,
                        amount: menuResponse.amount,
                        optionTotalPrice: menuResponse.optionTotalPrice,
                        totalPrice: menuResponse.totalPrice,
                      ))
                  .toList(),
              totalPrice: cart.totalPrice,
            ))
        .toList();
  }
}

// 3. Model → Cubit State 업데이트
emit(state.copyWith(
  cartModel: cartData,  
  screenState: ScreenState.loaded,
));
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '완전한 데이터 흐름의 완성:\n\n'
              '✅ JSON → DTO: 타입 안전성 확보\n'
              '✅ DTO → Model: 도메인 중심 데이터 구조로 변환\n'
              '✅ Model → State: UI에서 사용할 수 있는 상태로 전달\n'
              '✅ State → UI: 사용자에게 최종 화면 표시\n\n'
              '이렇게 Clean Architecture의 완전한 데이터 흐름이 완성됩니다!\n'
              '각 계층이 명확한 책임을 가지고 있어 유지보수와 테스트가 용이합니다.',
        ),
        const SizedBox(height: 180),
      ],
    );
  }
}
