import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/cost_collect_bloc/cost_collect_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/cost_collect_bloc/cost_collect_event.dart';
import 'package:quan_ly_chi_tieu/bloc/cost_collect_bloc/cost_collect_state.dart';
import 'package:quan_ly_chi_tieu/configs/colors.dart';
import 'package:quan_ly_chi_tieu/configs/constants.dart';
import 'package:quan_ly_chi_tieu/configs/themes.dart';
import 'package:quan_ly_chi_tieu/models/cost_collect.dart';
import 'package:quan_ly_chi_tieu/utils/function_helper.dart';
import 'package:quan_ly_chi_tieu/utils/loading_helper.dart';

class CostCollectCard extends StatefulWidget {
  CostCollect costCollect;
  int index;
  CostCollectCard(this.costCollect, this.index, {Key? key}) : super(key: key);
  @override
  _CostCollectCardState createState() => _CostCollectCardState();
}

class _CostCollectCardState extends State<CostCollectCard> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CostCollectBloc, CostCollectState>(
      listener: (context, state) {
        if (state is DeleteCostCollectLoadingState) {
          LoadingHelper.showLoading(context);
        } else if (state is DeleteCostCollectSuccessState) {
          LoadingHelper.hideLoading(context);
          // FunctionHelper.showSnackBar(
          //   context: context,
          //   title: "Xóa khoản thu thành công !",
          // );
          BlocProvider.of<CostCollectBloc>(context).add(GetCostCollectsEvent());
        } else if (state is DeleteCostCollectErrorState) {
          LoadingHelper.hideLoading(context);
          FunctionHelper.showSnackBar(context: context, title: state.error);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:  Color(0xFFFAF5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        child: InkWell(
          onTap: () async {
            var result = await Navigator.pushNamed(
              context,
              Constants.addCostCollectScreen,
              arguments: widget.costCollect,
            );
            if (result != null) {
              setState(
                () {
                  widget.costCollect = result as CostCollect;
                },
              );
            }
          },
          onLongPress: () async {
            var result = await showOkCancelAlertDialog(
                context: context,
                title: "Thông báo ",
                okLabel: "Đồng ý",
                cancelLabel: "Hủy",
                message:
                    'Bạn có muốn xóa khoản thu ${widget.costCollect.nameCategoryCollect} !');
            if (result == OkCancelResult.ok) {
              BlocProvider.of<CostCollectBloc>(context).add(
                DeleteCostCollectEvent(costCollect: widget.costCollect),
              );
            }
          },
          child: Row(
            children: [
              const Icon(
                Icons.account_balance_wallet_outlined,
                size: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                width: 120,
                child: Text(
                  widget.costCollect.nameCategoryCollect,
                  style: AppThemes.lightText.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 90,
                child: Text(
                  widget.costCollect.money.toString().split(' ')[0],
                  style: AppThemes.lightText.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Container(

                  margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    widget.costCollect.dateTime.toString().split(' ')[0],
                    style: AppThemes.lightText.copyWith(color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
