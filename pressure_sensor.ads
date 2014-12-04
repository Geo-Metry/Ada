with Listener_Sensors; use Listener_Sensors;
with Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Consts; use Consts;

package Pressure_Sensor is
   type T_Pressure_Sensor(size : Natural; id : Integer) is tagged private;
   type T_Pressure_Sensor_Class_Access is access all T_Pressure_Sensor'Class;

   package Constructor is
      function Initialize(size : in Natural; id : in Integer) return T_Pressure_Sensor;
   end Constructor;

   procedure Simule_Measure(this : access T_Pressure_Sensor; measure : Float);

   procedure Record_Listener(this : access T_Pressure_Sensor;listener : in not null T_Listener_Sensors_Class_Access)
   with pre => (not this.Is_Full);

   function Is_Full(this : access T_Pressure_Sensor) return Boolean;

private
   type T_Listener_Array is array (Integer range <>) of T_Listener_Sensors_Class_Access;

   type T_Pressure_Sensor(size : Natural; id : Integer) is tagged record
      listener_array  : T_Listener_Array(1..size);
      nbListener : Integer;
      max_pressure_value : Float;
   end record;

end Pressure_Sensor;
