-- combinations.adb BODY ------------------------------------------------------
with Text_IO;             use Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with gearbox            ; use gearbox;

package body combinations is
value, group: Integer ;
--   n       : integer :=13;             --
--   x       : integer :=3;
done         : boolean := false;
got_value    : boolean := false;
--fermats    : num_array;

--------------------------------
procedure build  (n,r,x: integer) is
-- combos :in out combos_array; instantiate correctly size combos and elements
-- arrays ** calculate total numner of comninations that will ne generated
--combo   : combo_array  (1..r+1 );  -- ** actual cnt with factorials index fails
--elements: elements_array(1..r*n);    -- ** what is this
cnt, e_cnt, combo_sum    : integer :=0;
launch, pause : character;
all_done, combo_done, shifing, showing : boolean := false;
-- gear: gear_array (1..n);

begin

put_line ("-------  Bases procedure---------");

for i in 1 .. n loop
   put (i, width =>1);
   if i < n then put(", ");
   end if;
end loop;
New_Line (2);

put_line ("--------- Raising Base Integers to " & n'Image
           & " power for the Fermat set F ------");
for i in 2..n loop
   put (i, width => 1);
   fermats (i,1) := i**x;
   fermats (i,2) := i;     --base number
   put( " raised to power of " & x'Image & " is ");
   put (fermats(i,1), width =>1 );
   new_line;
end loop;
  new_line;


put("Selecting "); -- put(tot_combos, width=>1);
put(" Possible Combinations,"); new_line;
put("Repetitions Allowed in combos of r/size "); Put( r, width=> 1);
put(" from SET Fermats of size " & n'image);
put_line("    --------------------------");
put("Enter any key to launch "); get_immediate(launch);
group := 1;
new_line;

  gearbox.setup_gearbox(n,r)  ;
-- ------------------------------------------------------------------------------
-- main screen output section, move to separate procedure to be called as neededf
-- ------------------------------------------------------------------------------
not_all_done:
While not all_done loop  -- for all/x combinations
   cnt := cnt +1;
   put( "Group "); put(group, width => 1);
   Put(" Combo ");
   put(cnt, width => 1) ;
   put(" is [");
   combo_sum :=0;

   for b in  1..r loop    -- b for base number
    value := fermats(gearbox.gears(b).position,2);
    put (value, width => 1) ;
    if b < r then put(",");
       else          put("]  (");
    end if;
   end loop;

   for e in  2..r loop  -- select r value , size of combinations
     value := fermats(gearbox.gears(e).position,1);
     combo_sum :=  combo_sum + value;
     put (value, width => 1) ;
     if e < r then put(",");
       else          put(")");
     end if;
   end loop;
   put (" Combination sum is "); put (combo_sum, width => 1);-- put(" and root is "); put(float(combo_sum)**x);
   for i in 1..n loop
    if Fermats(i,1) = combo_sum then
     New_Line;
     put_line (" ***************************************************");
     put("-----  Intersect with Set F at "); put(fermats(i,1),width => 1);
     put(". Enter any key to continue:"); Get_Immediate(pause);
     put_line (" ***************************************************");
     New_Line;
    end if;
   end loop;
   New_Line;
   if combo_sum = r*fermats(n,1)
     then all_done := true;
     exit not_all_done;
   end if;
   gearbox.shift(n,r,fermats); -- refactor?
   if cnt rem n = 0  then -- a group of n combinations, shift gears
     New_Line;
     group := group + 1;  --
   end if;    -- is new group and shift
 end loop not_all_done;  -- all done
 end build;
end combinations;
