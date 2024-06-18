package body pkg_tarea is
   task body Tarea is
      Tiempo_Activacion : Tarea_Periodica;
      Tiempo_Computo : Tarea_Periodica := Ada.Real_Time.Milliseconds (1000);
      Variable_Entera : Integer := 0;
      Inicio_Ejecucion : Ada.Real_Time.Time;
      
   begin
      loop
         select
            accept Start do
               loop
                  -- Espera hasta el tiempo de activación
                  delay Tiempo_Activacion;
                  
                  -- Inicia el tiempo de ejecución
                  Inicio_Ejecucion := Ada.Real_Time.Clock;
                  
                  -- Incrementa la variable entera durante el tiempo de cómputo
                  while Ada.Real_Time.Clock - Inicio_Ejecucion < Tiempo_Computo loop
                     Variable_Entera := Variable_Entera + 1;
                  end loop;
                  
                  -- Muestra el mensaje con el valor de la variable entera y la tarea actual
                  Put_Line ("Tarea (" & Ada.Task_Identification.Image (Ada.Task_Identification.Current_Task) & 
                            "): Variable interna: " & Integer'Image (Variable_Entera));
               end loop;
            end Start;
         end select;
      end loop;
   end Tarea;
   
   procedure Crear_Tarea (T : out Tarea; Tiempo_Activacion : Tarea_Periodica) is
   begin
      T := new Tarea;
      T.Tiempo_Activacion := Tiempo_Activacion;
   end Crear_Tarea;
   
end pkg_tarea;
