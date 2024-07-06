import 'package:app/core/design/app_image.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/core/logic/sql_helper.dart';
import 'package:app/views/products/add_product.dart';
import 'package:app/views/products/model.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  // todo: get from database
  List<ProductModel>? list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    list = null;
    await SqlHelper.open();
    list = await SqlHelper.getProducts();
    setState(() {});
  }

  double  get total {
    double result = 0;
    list!.forEach(
      (element) {
        result += element.price;
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(AddProductView()).then(
            (value) {
              getData();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: list != null
          ? Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
                "Total $total",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
          )
          : null,
      body: list == null
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => _Item(
                onEdit: () {
                  navigateTo(AddProductView(
                    model: list![index],
                  )).then(
                    (value) {
                      getData();
                    },
                  );
                },
                model: list![index],
                onDelete: () async {
                  await SqlHelper.deleteProduct(list![index].id);
                  getData();
                },
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: list!.length,
            ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel model;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const _Item(
      {super.key,
      required this.model,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onEdit,
      title: Text(
        model.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        model.desc,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model.price.toString() + " \$",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: 16),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
