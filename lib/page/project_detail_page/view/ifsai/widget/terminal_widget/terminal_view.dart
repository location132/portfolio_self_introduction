import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'terminal_widget.dart';
import 'clipboard_widget.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TerminalTextConstants.terminalTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          SizedBox(height: 60),
          Column(
            children: [
              ClipboardWidget(),
              SizedBox(height: 20),
              TerminalWidget(state: widget.state, cubit: widget.cubit),
            ],
          ),
        ],
      ),
    );
  }
}
