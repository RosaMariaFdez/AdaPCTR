with Ada.Text_IO;
with Ada.Real_Time;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Real_Time;
use Ada.Integer_Text_IO;

procedure Canibales_Comensales is
   N : constant Integer := 5;

   protected Olla is
      entry Servir_Comida;
      function Hay_Raciones return Boolean;
      entry Rellenar_Olla;
   private
      Cantidad_Raciones : Integer := 0;
   end Olla;

   protected body Olla is
      entry Servir_Comida when Cantidad_Raciones > 0 is
      begin
         Cantidad_Raciones := Cantidad_Raciones - 1;
         Put_Line("Se sirvió una ración. Raciones restantes: " & Integer'Image(Cantidad_Raciones));
      end Servir_Comida;

      function Hay_Raciones return Boolean is
      begin
         return Cantidad_Raciones > 0;
      end Hay_Raciones;

      entry Rellenar_Olla when Cantidad_Raciones = 0 is
      begin
         Cantidad_Raciones := N;
         Put_Line("Olla rellenada. Raciones disponibles: " & Integer'Image(Cantidad_Raciones));
      end Rellenar_Olla;
   end Olla;

   task type Canibal is
      entry Comer;
      entry Bailar;
   end Canibal;

   task body Canibal is
   begin
      loop
         accept Bailar do
            Put_Line("El caníbal está bailando");
            delay 2.0; -- Delay de 2 segundos (convertido a milisegundos por defecto)
         end Bailar;

         accept Comer do
            Put_Line("El caníbal pide de comer");

            if Olla.Hay_Raciones then
               Olla.Servir_Comida;
               Put_Line("El caníbal está comiendo");
               delay 1.0; -- Delay de 1 segundo (convertido a milisegundos por defecto)
            else
               Put_Line("El caníbal avisa de que no queda comida");
               Olla.Rellenar_Olla;
            end if;
         end Comer;
      end loop;
   end Canibal;

   task type Cocinero is
      entry Rellenar_Olla;
   end Cocinero;

   task body Cocinero is
   begin
      loop
         delay 5.0; -- Delay de 5 segundos (convertido a milisegundos por defecto)
         Put_Line("El cocinero va a rellenar la olla");
         Olla.Rellenar_Olla;
      end loop;
   end Cocinero;

   Canibal1 : Canibal;
   Canibal2 : Canibal;
   Cocinero1 : Cocinero;

begin
   Canibal1.Bailar;
   Canibal1.Comer;
   Canibal2.Bailar;
   Canibal2.Comer;
   Cocinero1.Rellenar_Olla;
end Canibales_Comensales;
