import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:technoprise_test/imports.dart';

class TextButtonWidget extends HookWidget {
  const TextButtonWidget({
    super.key,
    required this.title,
    required this.foregroundColor,
    this.backgroundColor,
    required this.onPressed,
    this.hasMinimumSize = false,
    this.hasIcon = false,
    this.isOutLine = false,
    this.icon,
  });

  final String title;
  final Color foregroundColor;
  final Color? backgroundColor;
  final Function() onPressed;
  final bool hasMinimumSize;
  final bool hasIcon;
  final bool isOutLine;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return isOutLine
            ? OutlinedButton(
                onPressed: onPressed,
                child: Text(title),
                style: OutlinedButton.styleFrom(
                  foregroundColor: foregroundColor,

                  side: BorderSide(
                    color: foregroundColor,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.appRadius(
                        32,
                      ),
                    ),
                  ),
                  minimumSize: hasMinimumSize
                      ? Size(constraints.maxWidth, 50)
                      : null, // Make it responsive
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  textStyle: fontSize14500,
                ),
              )
            : hasIcon
                ? TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: foregroundColor,
                      backgroundColor: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.appRadius(32),
                        ),
                      ),
                      minimumSize: hasMinimumSize
                          ? Size(constraints.maxWidth, 50)
                          : null,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      textStyle: fontSize14500,
                    ),
                    onPressed: onPressed,
                    icon: Icon(
                      icon,
                      size: AppSizes.appCustomSize(16),
                    ),
                    label: Text(title),
                  )
                : TextButton(
                    onPressed: onPressed,
                    child: Text(title),
                    style: TextButton.styleFrom(
                      foregroundColor: foregroundColor,
                      backgroundColor: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.appRadius(
                            32,
                          ),
                        ),
                      ),
                      minimumSize: hasMinimumSize
                          ? Size(constraints.maxWidth, 50)
                          : null, // Make it responsive
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      textStyle: fontSize14500,
                    ),
                  );
      },
    );
  }
}
