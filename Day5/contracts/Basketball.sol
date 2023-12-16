//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Basketball {
    struct Player {
        address payable author_address;
        string player_name;
        string position;
        uint player_age;
        string team_name;
        uint height;
    }

    uint numPlayers;
    mapping(uint => Player) players;

    function addPlayer(
        string memory _player_name,
        string memory _position,
        uint _player_age,
        string memory _team_name,
        uint _height
    ) public returns (Player memory) {
        Player memory new_player = Player(
            payable(msg.sender),
            _player_name,
            _position,
            _player_age,
            _team_name,
            _height
        );
        players[numPlayers++] = new_player;
        return new_player;
    }

    function getAllPlayers() public view returns (Player[] memory) {
        Player[] memory allPlayers = new Player[](numPlayers);

        for (uint i = 0; i < numPlayers; i++) {
            allPlayers[i] = players[i];
        }

        return allPlayers;
    }

    function getPlayersOfAddresses(
        address _author_address
    ) public view returns (Player[] memory) {
        uint count = 0;
        // Count the number of players associated with the given address
        for (uint i = 0; i < numPlayers; i++) {
            if (players[i].author_address == _author_address) {
                count++;
            }
        }
        // Create an array to store players associated with the given address
        Player[] memory playersOfAddress = new Player[](count);
        uint index = 0;
        // Populate the array with players associated with the given address
        for (uint i = 0; i < numPlayers; i++) {
            if (players[i].author_address == _author_address) {
                playersOfAddress[index++] = players[i];
            }
        }

        return playersOfAddress;
    }
}