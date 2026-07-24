import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/game_room_entity.dart';

class LobbyScreen extends ConsumerStatefulWidget {
  final GameRoomEntity gameRoom;

  const LobbyScreen({
    super.key,
    required this.gameRoom,
  });

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  bool _isReady = false;

  @override
  Widget build(BuildContext context) {
    final room = widget.gameRoom;
    final isHost = room.host?.userId == 'current_user_id'; // TODO: Get from auth

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(room, isHost),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Room Info Card
                      _buildRoomInfoCard(room),
                      
                      const SizedBox(height: 20),
                      
                      // Players Grid
                      _buildPlayersSection(room),
                      
                      const SizedBox(height: 20),
                      
                      // Game Settings
                      _buildSettingsCard(room),
                      
                      const SizedBox(height: 100), // Space for bottom buttons
                    ],
                  ),
                ),
              ),
              
              // Bottom Action Buttons
              _buildBottomActions(room, isHost),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(GameRoomEntity room, bool isHost) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () => _showLeaveDialog(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          
          const SizedBox(width: 12),
          
          // Room Code
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Room Code',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      room.roomCode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => _copyRoomCode(room.roomCode),
                      icon: const Icon(Icons.copy, color: Colors.white, size: 20),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Mode Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getGameModeText(room.gameMode),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: -0.2);
  }

  Widget _buildRoomInfoCard(GameRoomEntity room) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _infoItem(
                  Icons.people,
                  '${room.playerCount}/${room.maxPlayers}',
                  'Players',
                ),
                _infoItem(
                  Icons.timer,
                  '${room.roundTimeLimit}s',
                  'Per Round',
                ),
                _infoItem(
                  Icons.repeat,
                  '${room.totalRounds}',
                  'Rounds',
                ),
                _infoItem(
                  Icons.trending_up,
                  room.difficulty,
                  'Difficulty',
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);
  }

  Widget _infoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayersSection(GameRoomEntity room) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Players',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Players Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: room.maxPlayers,
            itemBuilder: (context, index) {
              if (index < room.players.length) {
                return _buildPlayerCard(room.players[index]);
              } else {
                return _buildEmptySlot();
              }
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildPlayerCard(PlayerState player) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: player.isReady ? AppColors.success : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withOpacity(0.2),
                child: player.avatarUrl != null
                    ? ClipOval(
                        child: Image.network(
                          player.avatarUrl!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        player.username[0].toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
              if (player.isHost)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            player.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 4),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: player.isReady ? AppColors.success : AppColors.warning,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              player.isReady ? 'Ready' : 'Not Ready',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySlot() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add,
              color: Colors.white54,
              size: 32,
            ),
            SizedBox(height: 8),
            Text(
              'Waiting...',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(GameRoomEntity room) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Game Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _settingRow('Categories', room.categories.join(', ')),
            _settingRow('Hints Allowed', room.allowHints ? 'Yes' : 'No'),
            _settingRow('Hints Per Round', '${room.hintsPerRound}'),
            if (room.entryFee > 0)
              _settingRow(
                'Entry Fee',
                '${room.entryFee} ${room.entryCurrency}',
              ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _settingRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(GameRoomEntity room, bool isHost) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          if (!isHost) ...[
            // Ready Button (for non-hosts)
            Expanded(
              child: ElevatedButton(
                onPressed: () => _toggleReady(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isReady ? AppColors.warning : AppColors.success,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isReady ? 'Not Ready' : 'Ready',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ] else ...[
            // Start Game Button (for host)
            Expanded(
              child: ElevatedButton(
                onPressed: room.canStart ? () => _startGame(room) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Start Game',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3);
  }

  String _getGameModeText(GameMode mode) {
    switch (mode) {
      case GameMode.quickMatch:
        return 'Quick Match';
      case GameMode.privateRoom:
        return 'Private Room';
      case GameMode.publicRoom:
        return 'Public Room';
      case GameMode.battleRoyale:
        return 'Battle Royale';
      case GameMode.tournament:
        return 'Tournament';
      case GameMode.classroom:
        return 'Classroom';
      case GameMode.soloPractice:
        return 'Solo Practice';
    }
  }

  void _copyRoomCode(String roomCode) {
    Clipboard.setData(ClipboardData(text: roomCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Room code copied!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _toggleReady() {
    setState(() {
      _isReady = !_isReady;
    });
    // TODO: Call repository to update ready status
  }

  void _startGame(GameRoomEntity room) {
    // TODO: Call repository to start game
    Navigator.pushReplacementNamed(context, '/game');
  }

  void _showLeaveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Room?'),
        content: const Text('Are you sure you want to leave this room?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Leave lobby
            },
            child: const Text('Leave', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
