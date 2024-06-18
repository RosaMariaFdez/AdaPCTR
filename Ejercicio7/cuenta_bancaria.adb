with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

package body Cuenta_Bancaria is

   protected body Cuenta is

      entry Consultar_Saldo when True is
      begin
         Put_Line("Saldo actual: " & Integer'Image(Saldo));
      end Consultar_Saldo;

      entry Extraer_Dinero(Cantidad: in Integer) when True is
      begin
         if Saldo >= Cantidad then
            Saldo := Saldo - Cantidad;
            Put_Line("Extracción exitosa. Nuevo saldo: " & Integer'Image(Saldo));
         else
            Put_Line("No hay saldo suficiente");
         end if;
      end Extraer_Dinero;

      entry Realizar_Ingreso(Cantidad: in Integer) when True is
      begin
         Saldo := Saldo + Cantidad;
         Put_Line("Ingreso exitoso. Nuevo saldo: " & Integer'Image(Saldo));
      end Realizar_Ingreso;

      entry Transferir(Cuenta_Destino: access Cuenta; Cantidad: in Integer) when True is
      begin
         if Saldo >= Cantidad then
            Saldo := Saldo - Cantidad;
            Cuenta_Destino.Realizar_Ingreso(Cantidad);
            Put_Line("Transferencia exitosa. Saldo restante: " & Integer'Image(Saldo));
         else
            Put_Line("Fondos insuficientes para la transferencia.");
         end if;
      end Transferir;

   end Cuenta;

end Cuenta_Bancaria;
