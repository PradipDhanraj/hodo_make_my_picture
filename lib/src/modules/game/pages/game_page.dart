import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:hod_makemypicture/src/modules/game/widgets/grid_item_widget.dart';
import 'package:hod_makemypicture/src/utils/popups.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});

  final String title;

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final List<DraggableGridItem> _listOfDraggableGridItem = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  final List<int> _actualIndexes = <int>[0, 1, 2, 3];

  @override
  void initState() {
    _generateImageData();
    _listOfDraggableGridItem.shuffle();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  void _randomizeGridItems() {
    _listOfDraggableGridItem.shuffle();
    if (_checkIfItemsAreInOrder) {
      _randomizeGridItems();
    }
  }

  bool get _checkIfItemsAreInOrder => _listOfDraggableGridItem
      .asMap()
      .entries
      .every((element) => _actualIndexes[element.key] == element.value.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            _randomizeGridItems();
          });
        },
        child: const Icon(Icons.shuffle_on_outlined, size: 50),
      ),
      body: SafeArea(
        child: DraggableGridViewBuilder(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio:
            //     MediaQuery.of(context).size.width /
            //     (MediaQuery.of(context).size.height / 3),
          ),
          children: _listOfDraggableGridItem,
          dragCompletion: onDragAccept,
          dragStarted: () {
            log('dragStarted...');
          },
          isOnlyLongPress: false,
          dragFeedback: feedback,
          dragPlaceHolder: placeHolder,
        ),
      ),
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return SizedBox(width: 200, height: 150, child: list[index].child);
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(child: Container(color: Colors.white));
  }

  void onDragAccept(
    List<DraggableGridItem> list,
    int beforeIndex,
    int afterIndex,
  ) {
    log('onDragAccept: $beforeIndex -> $afterIndex');
    setState(() {
      _listOfDraggableGridItem.clear();
      _listOfDraggableGridItem.addAll(list);
      if (_checkIfItemsAreInOrder) {
        AppPopups.showPopup(
          context,
          callback:
              () => setState(() {
                _randomizeGridItems();
              }),
        );
      }
    });
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll([
      DraggableGridItem(
        index: 0,
        child: const GridItem(image: 'assets/images/1.png'),
        isDraggable: true,
        dragCallback: (context, isDragging) {
          log('isDragging: $isDragging');
        },
      ),
      DraggableGridItem(
        index: 1,
        child: const GridItem(image: 'assets/images/2.png'),
        isDraggable: true,
        dragCallback: (context, isDragging) {
          log('isDragging: $isDragging');
        },
      ),
      DraggableGridItem(
        index: 2,
        child: const GridItem(image: 'assets/images/3.png'),
        isDraggable: true,
        dragCallback: (context, isDragging) {
          log('isDragging: $isDragging');
        },
      ),
      DraggableGridItem(
        index: 3,
        child: const GridItem(image: 'assets/images/4.png'),
        isDraggable: true,
        dragCallback: (context, isDragging) {
          log('isDragging: $isDragging');
        },
      ),
    ]);
  }
}
