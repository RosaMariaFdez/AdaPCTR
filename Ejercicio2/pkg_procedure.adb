package body pkg_procedure is
   procedure Leer_Entero (Num : out Integer) is
   begin
      Get_Line (Num'Image);
      Num := Integer'Value (Num);
   end Leer_Entero;
   
end pkg_procedure;
