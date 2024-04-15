import 'package:flutter/material.dart';
import 'package:teach_me/core/utils/media_query_values.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/hex_color.dart';

class ListHeader extends StatelessWidget {
  final String name;
  final String? moreName;
  final bool isLibraryItem;
  final Function()? onMorePressed;

  final bool isShowMore;
  final bool haveShowMoreIcon;

  const ListHeader({
    super.key,
    required this.name,
    this.isLibraryItem = false,
    this.onMorePressed,
    this.moreName,
    this.isShowMore = false,
    this.haveShowMoreIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SizedBox(
        height: context.height * 0.02,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: !isLibraryItem
                    ? Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 0.2638,
                        )
                    : TextStyle(
                        color: HexColor('#2B3D5F'),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0.2638,
                      )),
            (moreName != null)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      haveShowMoreIcon
                          ? isShowMore
                              ? const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                  size: 20,
                                )
                          : const SizedBox(),
                      InkWell(
                        onTap: onMorePressed,
                        child: Text(
                          moreName ??
                              AppLocalizations.of(context)!
                                  .translate('see_all')!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: HexColor('#008DCB')),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
