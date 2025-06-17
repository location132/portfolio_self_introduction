import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'terminal_manager.dart';

class TerminalView extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;
  const TerminalView({super.key, required this.state, required this.cubit});

  @override
  State<TerminalView> createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IfsaiCubit>().initializeTerminal();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TerminalTextConstants.terminalTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 30 : 24,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          SizedBox(height: isDesktop ? 60 : 40),
          TerminalManager(state: widget.state, cubit: widget.cubit),
        ],
      ),
    );
  }
}
