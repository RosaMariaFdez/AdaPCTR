with Ada.Text_IO;
with pkg_procedure;
with pkg_tarea;

procedure Main is
   use Ada.Text_IO;
   use pkg_procedure;
   use pkg_tarea;
   
   T : tarea_t;
   Numero : Integer;
   
begin
   Crear_Tarea (T);
   
   loop
      Estado_Consultas (T);
      Put ("Escriba un numero entero y pulsa ENTER --> ");
      Leer_Entero (Numero);
      if Numero /= 0 then
         Es_Par (T, Numero);
      else
         exit; --salir
      end if;
   end loop;
   
   abort T;
end Main;