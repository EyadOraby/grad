import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';

void customListModalSheet(BuildContext context, Function onSelected,
    int selectedIndex, List<String> items, String title) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (builder) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Container(
                        height: 5,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < items.length; i++)
                            ModalSheetButton(
                              index: i,
                              title: items[i],
                              selected: i == selectedIndex,
                              isLast: i == items.length - 1,
                              onSelect: (val) {
                                onSelected(val);
                                Navigator.pop(context);
                              },
                            ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}

class ModalSheetButton extends StatelessWidget {
  const ModalSheetButton({
    super.key,
    required this.index,
    required this.title,
    required this.selected,
    required this.onSelect,
    this.isLast = false,
  });

  final int index;
  final String title;
  final bool selected;
  final bool isLast;
  final Function(int) onSelect;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onSelect(index);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: selected ? Colors.green.withValues(alpha: 0.15) : Colors.transparent,
          border: !isLast
              ? const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                )
              : null,
        ),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            if (selected)
              const Icon(
                Icons.check,
                color: SanadColors.primary,
              ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
}
