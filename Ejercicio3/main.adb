with Ada.Text_IO;
with Ada.Real_Time;
with pkg_tarea;

procedure Main is
   use Ada.Text_IO;
   use Ada.Real_Time;
   use pkg_tarea;
   
   T1, T2 : Tarea;
   Tiempo_Activacion : Tarea_Periodica := Milliseconds (1000);
   
begin
   Crear_Tarea (T1, Tiempo_Activacion);
   Crear_Tarea (T2, Tiempo_Activacion);
   
   T1.Start;
   T2.Start;
   delay 8.0; --primera espera de 8
   
   -- Aborts
   abort T1;
   abort T2;
   
   delay 2.0; --segunda espera de 2, final
   Put_Line("Fin del procedimiento main");
   
end Main;
