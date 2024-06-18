with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

package Cuenta_Bancaria is

   protected type Cuenta is
      entry Consultar_Saldo;
      entry Extraer_Dinero(Cantidad: in Integer);
      entry Realizar_Ingreso(Cantidad: in Integer);
      entry Transferir(Cuenta_Destino: access Cuenta; Cantidad: in Integer);
   private
      Saldo: Integer := 0;
   end Cuenta;

end Cuenta_Bancaria;
