with Air_Data_Module; use Air_Data_Module;
with Pressure_Sensor; use Pressure_Sensor;
with Listener_Sensors; use Listener_Sensors;

procedure Main is
   adm : T_Air_Data_Module_Class_Access;
   sensor_1 : T_Pressure_Sensor_Class_Access;
   sensor_2 : T_Pressure_Sensor_Class_Access;
begin

   adm := new T_Air_Data_Module'(Air_Data_Module.Constructor.Initialize(size =>  3));

   sensor_1 := new T_Pressure_Sensor'(Pressure_Sensor.Constructor.Initialize(size => 1, id => 1));
   sensor_2 := new T_Pressure_Sensor'(Pressure_Sensor.Constructor.Initialize(size => 1, id => 2));

   sensor_1.Record_Listener(listener =>  T_Listener_Sensors_Class_Access (adm));
   sensor_2.Record_Listener(listener =>  T_Listener_Sensors_Class_Access (adm));

   sensor_1.Simule_Measure(51314.0);

end;
