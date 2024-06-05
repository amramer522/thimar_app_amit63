import 'package:app/features/add_to_cart/bloc.dart';
import 'package:app/features/products/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/design/app_shimmer.dart';

part '../item_product.dart';

part 'loading.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final bloc = GetIt.I<ProductsBloc>();
  final addToCartBloc = GetIt.instance<AddToCartBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetProductsFailedState) {
          return const Text("Failed");
        } else if (state is GetProductsSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "الأصناف",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                padding: const EdgeInsets.all(16),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 20,
                  childAspectRatio: 189 / 300,
                ),
                itemBuilder: (context, index) => _Item(
                  addToCartBloc: addToCartBloc,
                  model: state.list[index],
                ),
              ),
            ],
          );
        } else {
          return const _Loading();
        }
      },
    );
  }
}
