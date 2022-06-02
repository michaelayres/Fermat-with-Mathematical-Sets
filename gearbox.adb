-- gearbox.adb , package gearbox body ---------------------------------------------------------------

with Text_IO;             use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- ------------------------------------------------------
package body gearbox is

procedure setup_gearbox(n,r: integer) is

 begin
  put ("Initiating array of "); put(r, width => 2);
  put(" gears."); New_Line;
  for g in 1..r loop
   gears(g).position :=1;
   gears(g).prior    :=1;
    put("Gear "); put(g,Width => 1); put(" in position ");
    put(gears(g).position, width => 1);
    New_Line;
  end loop;
end setup_gearbox;

 procedure shift(n,r: integer; fermats: num_array) is
 shift_up : boolean := false;
 begin
 shiftgears:
  for g in reverse 1..r loop  -- g gear and r range : numbr of gears
--      New_Line;
--      put("Processing gear "); put(g, width => 1); put( " for a shift");
    gears(g).prior := gears(g).position;
    if g = r then
       -- Case 1, in last gear
       if gears(g).position < n then
          gears(g).position := gears(g).position + 1;
      else
         gears(g).position := 1;
      end if;
    end if; --  last gear

    if g < r and g > 1 then  -- ie gear 2
    -- case 2, middle gear(s)
      if gears(g+1).prior = n then
        if gears(g).position < n then
           gears(g).position := gears(g).position + 1;
        else -- gear at highest posiion of n
         gears(g).position :=  1;
        end if;
      end if;
    end if;

    if g= 1 then
     -- case 3, in first gear, which never resets to 1
     shift_up := true;
     for i in 2..r loop
      if gears(i).position /= n then
         shift_up := false;
      end if;
     end loop;

     if shift_up = true then
      gears(g).position :=   gears(g).position + 1;
     end if;
    end if; -- gear_position = 1
  -- New_Line;
--     Put("shifting gear "); put (g,width => 1); put(" to ");
--     put(gears(g).position, width => 1); put(" with new position-value ");
--     put(fermats(gears(g).position, 1) , width => 1);

  end loop shiftgears;
  end shift;
 -- end set_up_gears;
end gearbox;


