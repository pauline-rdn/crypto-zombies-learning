pragma solidity ^0.4.19;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }

  function getZombiesByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerZombieCount[_owner]);
    // Commencez ici
    uint counter = 0;
  // On itère de 1 à 19 avec une boucle `for` :
  for (uint i = 0; i < zombies.length; i++) {
    // Si `i` est pair...
    if (zombieToOwner[i] == _owner) {
      // On l'ajoute au tableau
      result[counter] = i;
      // On incrémente le `counter` de 1 :
      counter++;
    }
  }
    return result;
  }

}