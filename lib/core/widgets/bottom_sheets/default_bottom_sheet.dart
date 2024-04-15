import 'package:flutter/material.dart';
import 'package:teach_me/core/utils/hex_color.dart';
import 'package:teach_me/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';

void showDefaultBottomSheet(
  BuildContext context, {
  String? title,
  required Widget child,
  final double? maxHeight,
  double? buttonWidth,
  double? buttonHeight,
  final double? maxContainerheight,
  String? buttonText,
  void Function()? onSaved,
  bool withoutSaveButton = false,
  bool isLoading = false,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? context.height * 0.9,
      // minHeight: MediaQuery.of(context).size.height * 0.5,
    ),
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => DefaultButtomSheet(
      title: title,
      maxContainerheight: maxContainerheight,
      child: child,
    ),
  );
}

class DefaultButtomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? maxContainerheight;
  final bool withCloseButton;

  const DefaultButtomSheet({
    Key? key,
    this.title,
    required this.child,
    this.maxContainerheight,
    this.withCloseButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        // to solve keyboard overlay over the textField
        padding: MediaQuery.of(context).viewInsets,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: HexColor('FEFEFE'),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                title != null
                    ? Padding(
                        padding: EdgeInsets.all(context.width * 0.05),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            title ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                withCloseButton
                    ? IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: AppColors.secondaryColor,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: maxContainerheight ?? double.infinity,
                minHeight: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // physics: const BouncingScrollPhysics(),
                child: child,
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            // if (!withoutSaveButton)
          ],
        ),
      ),
    );
  }
}
