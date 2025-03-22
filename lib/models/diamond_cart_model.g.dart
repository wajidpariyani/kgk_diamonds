// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiamondAdapter extends TypeAdapter<Diamond> {
  @override
  final int typeId = 0;

  @override
  Diamond read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diamond(
      id: fields[0] as String,
      carat: fields[1] as double,
      price: fields[2] as double,
      discount: fields[3] as double,
      lotId: fields[4] as String,
      size: fields[5] as String,
      lab: fields[6] as String,
      shape: fields[7] as String,
      color: fields[8] as String,
      clarity: fields[9] as String,
      cut: fields[10] as String,
      polish: fields[11] as String,
      symmetry: fields[12] as String,
      fluorescence: fields[13] as String,
      perCaratRate: fields[14] as double,
      finalAmount: fields[15] as double,
      keyToSymbol: fields[16] as String,
      labComment: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Diamond obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.carat)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.lotId)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.lab)
      ..writeByte(7)
      ..write(obj.shape)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.clarity)
      ..writeByte(10)
      ..write(obj.cut)
      ..writeByte(11)
      ..write(obj.polish)
      ..writeByte(12)
      ..write(obj.symmetry)
      ..writeByte(13)
      ..write(obj.fluorescence)
      ..writeByte(14)
      ..write(obj.perCaratRate)
      ..writeByte(15)
      ..write(obj.finalAmount)
      ..writeByte(16)
      ..write(obj.keyToSymbol)
      ..writeByte(17)
      ..write(obj.labComment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiamondAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
