import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';

class ClipboardWidget extends StatefulWidget {
  const ClipboardWidget({super.key});

  @override
  State<ClipboardWidget> createState() => _ClipboardWidgetState();
}

class _ClipboardWidgetState extends State<ClipboardWidget> {
  final List<bool> _isCommandCopied = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    double containerWidth;
    if (isDesktop) {
      containerWidth = 1200;
    } else if (isTablet) {
      containerWidth = 800;
    } else {
      containerWidth = 360;
    }

    return SizedBox(
      width: containerWidth,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TerminalTextConstants.clipboardTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: isDesktop ? 20 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (isDesktop)
              _buildDesktopLayout()
            else if (isTablet)
              _buildTabletLayout()
            else
              _buildMobileLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children:
          TerminalTextConstants.clipboardCommands.asMap().entries.map((entry) {
            final index = entry.key;
            final cmd = entry.value;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < 2 ? 12 : 0),
                child: _buildCommandCard(cmd, index),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          children:
              TerminalTextConstants.clipboardCommands.take(2).map((cmd) {
                final index = TerminalTextConstants.clipboardCommands.indexOf(
                  cmd,
                );
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index == 0 ? 12 : 0),
                    child: _buildCommandCard(cmd, index),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 12),
        _buildCommandCard(TerminalTextConstants.clipboardCommands[2], 2),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children:
          TerminalTextConstants.clipboardCommands.asMap().entries.map((entry) {
            final index = entry.key;
            final cmd = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: index < 2 ? 12 : 0),
              child: _buildCommandCard(cmd, index),
            );
          }).toList(),
    );
  }

  Widget _buildCommandCard(Map<String, String> cmd, int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cmd['title']!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cmd['description']!,
            style: TextStyle(color: Colors.grey[400], fontSize: 15),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cmd['command']!,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.greenAccent,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  await context.read<IfsaiCubit>().copyToClipboard(
                    cmd['command']!,
                  );
                  setState(() {
                    _isCommandCopied[index] = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() {
                        _isCommandCopied[index] = false;
                      });
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _isCommandCopied[index]
                        ? TerminalTextConstants.copySuccessMessage
                        : TerminalTextConstants.copyButtonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
