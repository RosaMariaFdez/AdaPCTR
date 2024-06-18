package body pkg_tarea is
   type tarea_t is new Ada.Task_Id;
   
   task body Tarea is
      Par_Consultados : Integer := 0;
      Impar_Consultados : Integer := 0;
   begin
      loop
         select
            accept Es_Par (Numero : Integer) do
               if Numero mod 2 = 0 then
                  Par_Consultados := Par_Consultados + 1;
                  Put_Line ("El número " & Integer'Image (Numero) & " es Par");
               else
                  Impar_Consultados := Impar_Consultados + 1;
                  Put_Line ("El número " & Integer'Image (Numero) & " es impar");
               end if;
            end Es_Par;
            
            accept Estado_Consultas do
               Put_Line ("El número de números pares consultados es " & Integer'Image (Par_Consultados));
               Put_Line ("El número de números impares consultados es " & Integer'Image (Impar_Consultados));
            end Estado_Consultas;
         end select;
      end loop;
   end Tarea;
   
   procedure Crear_Tarea (T : out tarea_t) is
   begin
      T := Ada.Task_Identification.Current_Task;
   end Crear_Tarea;
   
end pkg_tarea;
