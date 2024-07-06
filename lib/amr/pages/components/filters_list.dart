part of '../home.dart';
class _FiltersList extends StatefulWidget {
  final DeepArController controller;
  const _FiltersList({super.key, required this.controller});

  @override
  State<_FiltersList> createState() => _FiltersListState();
}

class _FiltersListState extends State<_FiltersList> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              widget.controller.switchEffect("assets/filters/${filter.filterPath}");
              setState(() {

              });
            },
            child: Container(
              width: 40,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: selectedIndex==index?Border.all(color: Theme.of(context).primaryColor,width: 3):null,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/previews/${filter.imagePath}",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
        itemCount: filters.length,
      ),
    );
  }
}
