package pkg_semaforo is
   type Semaforo is new Ada.Finalization.Controlled with private;

   procedure Inicializar (S : in out Semaforo);
   procedure Adquirir (S : in out Semaforo);
   procedure Liberar (S : in out Semaforo);
   
private
   type Semaforo is new Ada.Finalization.Controlled with null record;
   
   overriding procedure Initialize (S : in out Semaforo);
   overriding procedure Finalize (S : in out Semaforo);
   
end pkg_semaforo;