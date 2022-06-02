-- ------------------------------------------------------------
-- combinations.ads package specification
with gearbox;
use  gearbox;
package combinations is

-- type num_array is array(1..100,1..2) of Integer;


Type combo_action   is (add_element,clear, show, show_sum, nuild);

i,r,n,x, combos_cnt :integer;

Procedure build  (n,r,x  : integer);
                  -- combos  :in out combos_array;
end combinations;
