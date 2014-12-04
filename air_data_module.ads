with Listener_Sensors; use Listener_Sensors;
with Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Consts; use Consts;

package Air_Data_Module is
   type T_Air_Data_Module(size : Natural) is new T_Listener_Sensors with private;
   type T_Air_Data_Module_Class_Access is access all T_Air_Data_Module'Class;

   package Constructor is
      function Initialize(size: in Natural) return T_Air_Data_Module;
   end Constructor;

   package Math is new Ada.Numerics.Generic_Elementary_Functions(Float);

   procedure Informe_Listener_Sensors(this : access T_Air_Data_Module;
                                      id : in Integer;
                                      pressure : in Float;
                                      status: in T_Status);
private
   type T_Pressure_Array is array(Integer range <>) of Float;
   type T_Status_Array is array(Integer range <>) of T_Status;

   type T_Air_Data_Module(size : Natural) is new T_Listener_Sensors with record
      pressure_array : T_Pressure_Array(1..size);
      status_array : T_Status_Array (1..size);
   end record;

end Air_Data_Module;
