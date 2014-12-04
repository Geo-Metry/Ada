package body Air_Data_Module is

   package body Constructor is
      function Initialize(size: in Natural) return T_Air_Data_Module is
      begin
         return T_Air_Data_Module'(size =>  size,
                                   pressure_array => (others => 0.0),
                                   status_array => (others => KO));
      end;
   end Constructor;

   procedure Informe_Listener_Sensors(this : access T_Air_Data_Module;
                                      id : in Integer;
                                      pressure : in Float;
                                      status: in T_Status) is

      average_pressure : Float := 0.0;
      cpt : Float := 0.0;
      h : Float := -1.0;
      h_status : Consts.T_Status := OK;
   begin

      -- Update pressure and status arrays
      this.pressure_array (id) := pressure;
      this.status_array (id) := status;

      -- Compute the average of all non-KO pressures
      for I in this.pressure_array'Range loop
         if this.status_array (I) = OK then
            cpt := cpt + 1.0;
            average_pressure := average_pressure + this.pressure_array (I);
         end if;
      end loop;
      average_pressure := average_pressure / cpt;

      -- Compute the altitude from the average pressure if at least
      -- one pressure value is correct
      if cpt > 0.0 then
         h := (R*T0) / (M*g) * Math.Log(p0 / average_pressure);
      end if;

      -- Print the altitude and the status
      if h < 0.0 then
         h_status := KO;
      end if;

      Ada.Text_IO.Put("Altitude=" & Float'Image(h) & " with status " & T_Status'Image(h_status));

   end;
end Air_Data_Module;
