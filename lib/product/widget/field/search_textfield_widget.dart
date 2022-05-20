// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotelist/core/extensions/context_extension.dart';
import 'package:mynotelist/core/extensions/string_extension.dart';

import '../../../feature/note/cubit/note_cubit.dart';
import '../../init/lang/locale_keys.g.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    //required this.controller,
  }) : super(key: key);

  //final controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return Padding(
          padding: context.paddingLeftHigh,
          child: TextFormField(
            onChanged: (value) {
              context.read<NoteCubit>().getSearchNotes(value);
            },
            decoration: InputDecoration(
              hintText: LocaleKeys.searchBar_searchInput.locale,
              hintStyle: context.textTheme.bodyText1,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
