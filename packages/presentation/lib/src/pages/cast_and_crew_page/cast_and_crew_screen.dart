import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/args/cast_args.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/cast_and_crew_page/adapt_crew_widgets.dart';
import 'package:presentation/src/pages/cast_and_crew_page/bloc/crew_and_cast_bloc.dart';
import 'package:presentation/src/pages/cast_and_crew_page/bloc/crew_and_cast_data.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/cast_and_crew.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/widget_display_helper.dart';

class CastAndCrewScreen extends StatefulWidget {
  const CastAndCrewScreen({super.key});

  static const _routeName = '/TicketsScreen';

  static page({CastAndCrewArgs? args}) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const CastAndCrewScreen(),
        isShowNavBar: false,
        arguments: args,
      );

  @override
  State<CastAndCrewScreen> createState() => _CastAndCrewScreenState();
}

class _CastAndCrewScreenState
    extends BlocScreenState<CastAndCrewScreen, CrewAndCastBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).castAndCrewTitle,
          style: sfProSemiBold24px,
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: Dimens.size0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size18),
        child: Center(
          child: StreamBuilder<BaseTile<CrewAndCastData>>(
            stream: bloc.dataStream,
            builder: (context, snapShot) {
              if (snapShot.data == null) return SizedBox.shrink();
              final tile = snapShot.data?.tile;
              if (tile != null) return CastAndCrewListFull(list: tile.crew);
              return Center(child: Text(S.of(context).emptyData));
            },
          ),
        ),
      ),
    );
  }
}

class CastAndCrewListFull extends StatelessWidget {
  const CastAndCrewListFull({
    required this.list,
    super.key,
  });

  final List<CrewAndCastUi> list;

  @override
  Widget build(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) => CastAndCrewItem(item: list[index]),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AdaptCrewWidgets.columnsAccordingWithWidth(
                context,
              ),
              crossAxisSpacing: Dimens.size8,
              mainAxisSpacing: Dimens.size8,
              childAspectRatio: Dimens.aspectRatio5to1,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) => CastAndCrewItem(item: list[index]),
          );
  }
}
