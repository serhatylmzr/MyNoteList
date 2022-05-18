// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteThemeModelAdapter extends TypeAdapter<NoteThemeModel> {
  @override
  final int typeId = 2;

  @override
  NoteThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteThemeModel(
      textColor: fields[0] as int,
      background: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteThemeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.textColor)
      ..writeByte(1)
      ..write(obj.background);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
