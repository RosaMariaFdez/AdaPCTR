with Ada.Text_IO;
with Ada.Real_Time;
use Ada.Text_IO;
use Ada.Real_Time;

package body pkg_tareas is
   task body Tarea is
   begin
      loop
         select
            accept Start do
               -- Ejecutar tarea
               Put_Line("Ejecutando tarea " & Character'Image(Character'Val(Self'Identity)));
               
               -- Esperar tiempo de cómputo
               delay Duration'Value(T'Compute_Time);
               
               -- Mostrar mensaje de finalización de tarea
               Put_Line("Finalizada tarea " & Character'Image(Character'Val(Self'Identity)));
            end Start;
         end select;
      end loop;
   end Tarea;
   
   procedure Ejecutivo_Ciclico is
      T_A, T_B, T_C, T_D, T_E : Tarea;
      Superperiodo : constant Time_Span := Milliseconds(200);
      Periodo_Secundario : constant Time_Span := Milliseconds(25);
      
   begin
      -- Crear tareas
      T_A := new Tarea;
      T_B := new Tarea;
      T_C := new Tarea;
      T_D := new Tarea;
      T_E := new Tarea;
      
      loop
         -- Iniciar nuevo marco
         Put_Line("Inicio de marco");
         
         -- Iniciar tareas en el orden deseado
         T_A.Start;
         T_B.Start;
         T_C.Start;
         T_D.Start;
         T_E.Start;
         
         -- Esperar periodo secundario
         delay Duration'Value(Periodo_Secundario);
         
         -- Mostrar finalización de marco
         Put_Line("Final de marco");
         
         -- Esperar hasta el próximo marco
         delay Duration'Value(Superperiodo - Periodo_Secundario);
      end loop;
      
   end Ejecutivo_Ciclico;
   
end pkg_tareas;
