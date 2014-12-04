package body Pressure_Sensor is
   package body Constructor is
      function Initialize(size : in Natural; id : in Integer) return T_Pressure_Sensor is
      begin
         return T_Pressure_Sensor'(size => size,
                                   listener_array => (others =>null) ,
                                   id => id,
                                   nbListener => 0,
                                   max_pressure_value => Consts.p0);
      end;
   end Constructor;

   procedure Simule_Measure(this : access T_Pressure_Sensor; measure : Float ) is
      status : T_Status := OK;
   begin
      if measure > this.max_pressure_value or else measure <= 0.0 then
         status := KO;
      end if;

      for I in 0..this.nbListener loop
         this.listener_array(this.listener_array'First + I).Informe_Listener_Sensors(pressure => measure,
                                                                                     status   => status,
                                                                                     id       => this.id);
      end loop;

   end;

   procedure Record_Listener(this : access T_Pressure_Sensor; listener : in not null T_Listener_Sensors_Class_Access) is
   begin
      this.listener_array(this.listener_array'First + this.nbListener) := listener;
   end;

   function Is_Full(this : access T_Pressure_Sensor) return Boolean is
   begin
      if (this.nbListener >= this.size) then
         return True;
      else
         return False;
      end if;
   end;

end Pressure_Sensor;
