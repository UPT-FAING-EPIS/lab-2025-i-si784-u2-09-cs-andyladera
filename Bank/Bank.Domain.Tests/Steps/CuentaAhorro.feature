Feature: Como cliente quiero realizar depositos y retiros para modificar mi saldo de cuenta

Scenario: Cliente deposita en su cuenta un monto y es correcto
	Given la nueva cuenta numero 12345
	When deposito 10
	Then el saldo nuevo deberia ser 10

Scenario: Cliente retira en su cuenta un monto y es correcto
	Given la nueva cuenta numero 12345
    And con saldo 10
	When retiro 10
	Then el saldo nuevo deberia ser 0

Scenario: Cliente retira en su cuenta un monto negativo y es incorrecto
	Given la nueva cuenta numero 12345
    And con saldo 10
	When retiro -10
	Then deberia ser error

Scenario: Cliente cancela cuenta sin saldo y es correcto
	Given la nueva cuenta numero 12345
	When cancelo la cuenta
	Then la cuenta deberia estar cancelada

Scenario: Cliente cancela cuenta con saldo pendiente y es incorrecto
	Given la nueva cuenta numero 12345
    And con saldo 100
	When cancelo la cuenta
	Then deberia ser error
	And deberia mostrarse el error: No se puede cancelar la cuenta con saldo pendiente