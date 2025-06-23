import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../gsshop_cubit.dart';
import '../gsshop_state.dart';

class GsShopDetailView extends StatelessWidget {
  const GsShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GsShopCubit(),
      child: BlocBuilder<GsShopCubit, GsShopState>(
        builder: (context, state) {
          return const Scaffold(body: Center(child: Text('데스크탑')));
        },
      ),
    );
  }
}
