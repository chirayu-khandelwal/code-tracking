// Chapter 12: Putting It Together
// We're close to being done with our random Zombie generator! Let's create a public function that ties everything together.

// We're going to create a public function that takes an input, the zombie's name, and uses the name to create a zombie with random DNA.

// Put it to the test
// Create a public function named createRandomZombie. It will take one parameter named _name (a string with the data location set to memory). (Note: Declare this function public just as you declared previous functions private)

// The first line of the function should run the _generateRandomDna function on _name, and store it in a uint named randDna.

// The second line should run the _createZombie function and pass it _name and randDna.

// The solution should be 4 lines of code (including the closing } of the function).

// ------------------------------------------------------------------------------------------------------------------------------------------------------

pragma solidity  >=0.5.0 <0.6.0;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
