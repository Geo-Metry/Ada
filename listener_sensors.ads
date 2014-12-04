with Consts; use Consts;

package Listener_Sensors is
   type T_Listener_Sensors is interface;
   type T_Listener_Sensors_Class_Access is access all T_Listener_Sensors'Class;

   procedure Informe_Listener_Sensors(this : access T_Listener_Sensors;
                                      id : in Integer;
                                      pressure : in Float;
                                      status: in T_Status) is abstract;

end Listener_Sensors;
