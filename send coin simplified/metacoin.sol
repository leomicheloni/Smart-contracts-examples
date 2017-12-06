pragma solidity ^0.4.4;

contract MetaCoin {
	mapping (address => uint) balances;

	// Constructor del contrato, se ejecuta solo cuando el contrato es desplegado
	// en la Blockchain por primera vez
	function MetaCoin() {
		// tx.origin retorna el address de quien generó la transacción
		balances[tx.origin] = 10000;
	}

	// Ejecuta una transferencia, modifica los valores del mapping del contrato
	// por lo tanto modifica su estado, requiere una transacción y consumen GAS
	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		// msg.sender da información de contexto sobre el address que generó el mensaje actual
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		return true;
	}

	// Retorno el valor del mapping en una posición particular
	// no ejecuta ninguna transacción, es inmediato
	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}
}
