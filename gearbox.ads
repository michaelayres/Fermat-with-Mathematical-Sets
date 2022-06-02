-- ----------------------------------------------------------------------------
-- gearbox definition  is an Ada OO object implementation of a physical auto transmission
-- which is an assembly of gear on rods or shafts. In this case, initially, each gear
-- is the same size, number of teeth, implementation of N in the combination selection process
-- of select r, where r is represented by the number of gear.
-- Our initial array is of fixed length,13 teeth, on each of 4 gear.
-- Need to make size of gear and numbers of gear as parameters from user.
-- July 2021, Fermat Project Mace & ssociates, Michael Ayres
-- -----------------------------------------------------------------------------

package gearbox is

 type a_gear is
  record
  -- number    : integer range 1..500;
   position  : integer range 1..500;
   prior     : integer range 1..500;
  end record;

 type gear_array is array(1..4) of a_gear ;-- fix to be unbounded array
 gears : gear_array                       ;-- fix for unbounded array

 type num_array is array(1..500,1..2) of Integer;
 fermats: num_array;

 procedure setup_gearbox (n,r :integer)              ;
 procedure shift         (n,r :integer; fermats: num_array)              ;

end gearbox;

