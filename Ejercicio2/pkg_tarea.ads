package pkg_tarea is
   type tarea_t is new Ada.Task_Id;
   
   procedure Crear_Tarea (T : out tarea_t);
   
   procedure Es_Par (T : tarea_t; Numero : Integer);
   -- Punto de entrada para comprobar si un número es par o impar
   
   procedure Estado_Consultas (T : tarea_t);
   -- Punto de entrada para obtener el estado de las consultas realizadas
   
private
   pragma Priority (System.Default_Priority - 1);
   -- Prioridad de la tarea
end pkg_tarea;
