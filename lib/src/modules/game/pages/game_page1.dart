import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:hod_makemypicture/src/modules/game/widgets/grid_item_widget.dart';

class GamePage1 extends StatelessWidget {
  List<DraggableGridItem> _listOfDraggableGridItem() {
    return <DraggableGridItem>[
      DraggableGridItem(child: GridItem(image: 'assets/images/1.png')),
      DraggableGridItem(child: GridItem(image: 'assets/images/2.png')),
      DraggableGridItem(child: GridItem(image: 'assets/images/3.png')),
      DraggableGridItem(child: GridItem(image: 'assets/images/4.png')),
    ];
  }

  const GamePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableGridViewBuilder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:
            MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3),
      ),
      children: _listOfDraggableGridItem(),
      isOnlyLongPress: false,
      dragCompletion: (
        List<DraggableGridItem> list,
        int beforeIndex,
        int afterIndex, 
      ) {
        print('onDragAccept: $beforeIndex -> $afterIndex');
      },
      dragFeedback: (List<DraggableGridItem> list, int index) {
        return list[index].child;
      },
      dragPlaceHolder: (List<DraggableGridItem> list, int index) {
        return PlaceHolderWidget(child: SizedBox(child: Placeholder()));
      },
    );
  }
}
