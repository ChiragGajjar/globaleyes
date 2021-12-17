import 'package:globaleyes/common_imports.dart';

class BottomSheetList {
  static void showBottomSheet<T>(
      {required BaseStatefulWidgetState state,
      List<T>? list,
      required GetTextFromModel<T> getTextFromModel,
      Function? onSelect}) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top:Radius.circular(15.w)),
        ),
        context: state.context,
        builder: (builder) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: state.screenSize(state.context).height.h / 2,
            ),
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: list!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onSelect!(index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              getTextFromModel.call(list[index]),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16,fontFamily: FontsFamily.GilroyRegular),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          );
        });
  }
}

typedef String GetTextFromModel<T>(T model);
