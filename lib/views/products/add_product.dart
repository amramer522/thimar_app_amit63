import 'package:app/core/design/app_button.dart';
import 'package:app/core/design/app_input.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/core/logic/sql_helper.dart';
import 'package:app/views/products/model.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatefulWidget {
  final ProductModel? model;

  const AddProductView({super.key, this.model});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.model!=null)
      {
        nameController.text= widget.model!.name;
        descController.text= widget.model!.desc;
        priceController.text= widget.model!.price.toString();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model != null ? "Edit Product" : "Add New Product"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppInput(
                label: "Name",
                controller: nameController,
              ),
              AppInput(
                label: "Description",
                controller: descController,
              ),
              AppInput(
                label: "Price",
                controller: priceController,
              ),
              AppButton(
                onPressed: () async {
                  final model = ProductModel(
                    name: nameController.text,
                    desc: descController.text,
                    price: num.tryParse(priceController.text) ?? 0,
                  );
                  if (widget.model != null) {
                    await SqlHelper.updateProduct(widget.model!.id,model);
                  } else {
                    await SqlHelper.insertProduct(model);
                  }
                },
                text: widget.model != null?"Edit":"Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
