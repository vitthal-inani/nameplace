// class RoomId {
//   final String id;
//   final int currentRound;
//   final int totalRound;
//   final int players;
//   final List<dynamic> letters;
//   final List<PlayerDatum> playerData;
//   final String state;
//
//   RoomId({
//     required this.id,
//     required this.currentRound,
//     required this.totalRound,
//     required this.players,
//     required this.letters,
//     required this.playerData,
//     required this.state,
//   });
//
//   factory RoomId.fromJson(Map<String, dynamic> json) {
//     return RoomId(
//       id: json['id'],
//       currentRound: json['currentRound'],
//       totalRound: json['totalRound'],
//       players: json['players'],
//       letters: json['letters'],
//       playerData: (json['playerData'] as List<dynamic>)
//           .map((data) => PlayerDatum.fromJson(data))
//           .toList(),
//       state: json['state'],
//     );
//   }
//
//   RoomId copyWith({
//     String? id,
//     int? currentRound,
//     int? totalRound,
//     int? players,
//     List<dynamic>? letters,
//     List<PlayerDatum>? playerData,
//     String? state,
//   }) =>
//       RoomId(
//         id: id ?? this.id,
//         currentRound: currentRound ?? this.currentRound,
//         totalRound: totalRound ?? this.totalRound,
//         players: players ?? this.players,
//         letters: letters ?? this.letters,
//         playerData: playerData ?? this.playerData,
//         state: state ?? this.state,
//       );
// }
//
// class PlayerDatum {
//   final int id;
//   final String playerName;
//
//   PlayerDatum({
//     required this.id,
//     required this.playerName,
//   });
//
//   factory PlayerDatum.fromJson(Map<String, dynamic> json) {
//     return PlayerDatum(
//       id: json['id'],
//       playerName: json['playerName'],
//     );
//   }
// }
