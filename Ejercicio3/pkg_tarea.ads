package pkg_tarea is
   type Tarea_Periodica is new Ada.Real_Time.Relative_Time;
   
   task type Tarea is
      entry Start;
   end Tarea;
   
   procedure Crear_Tarea (T : out Tarea; Tiempo_Activacion : Tarea_Periodica);
   
private
   pragma Priority (System.Default_Priority - 1);
   -- Prioridad de la tarea
end pkg_tarea;
