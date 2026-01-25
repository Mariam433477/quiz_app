import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  final bool loadingState;
  final bool? errorState;
  final bool? emptyState;

  final WidgetBuilder successBuilder;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? emptyBuilder;

  const ConditionalBuilder({
    super.key,
    required this.loadingState,
    this.errorState,
    this.emptyState,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (loadingState) {
      return loadingBuilder?.call(context) ??
          const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          );
    }

    if (errorState == true) {
      return errorBuilder?.call(context) ?? const SizedBox.shrink();
    }

    if (emptyState == true) {
      return emptyBuilder?.call(context) ?? const SizedBox.shrink();
    }

    return successBuilder(context);
  }
}
