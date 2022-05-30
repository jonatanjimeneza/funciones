// SPDX-License-Identifier: MIT

// Version del compilador
pragma solidity ^0.8.0;


//Smart Contract funciones
contract funciones{
        //Modificador PURE 
        function getName() public pure returns (string memory){
            return "Jonatan";
        }

        //Modificador VIEW
        uint256 x = 100;
        function getNumber() public view returns (uint256){
            return x*3;
        }

        //Modificado Payable

        struct wallet{
            string _name;
            address _address;
            uint256 _amount;
        }

        //Mapping de la asignación de la dirección con la estructura de la wallet
        mapping ( address => wallet) Wallet;

        //Creamos un evento para el pago.
        event payment(string, address, uint256);

        //Creamos la función para realizar el pago con ETH.
        function doPayment(string memory _name, uint256 _amount) public payable{

          wallet memory wallet1;
          wallet1 = wallet(_name, msg.sender, _amount);
          Wallet[msg.sender] = wallet1;

          payable(msg.sender).transfer(_amount);      
          emit payment (_name, msg.sender, _amount);

        }

        //Función para obtener el balance de nuestra wallet
        function getBalance() public view returns (wallet memory){
            return Wallet[msg.sender];
        }

}
