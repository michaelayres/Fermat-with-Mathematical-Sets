with Text_IO;             Use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with combinations;        use combinations;
with gearbox;             use gearbox;
-- with ncurses ;         --   use ncurses;


procedure Main is
   n,c,s,x,r  : Integer := 0;
-- overflow check fails, need to add constraints or rewrite
--function factorial (I : Natural) return Natural is
--(if I < 2 then 1 else I * factorial (I - 1));

begin
   New_Line(3);
   Put_Line (" ----- Set Theory with Fermat's Last Theorem Tool Box Aug 15, 2021 -------- ");
    put ("Enter count for basis numbers to create: ");get (n);
    put ("Enter power to raise basis numbers to: "  );get (x);
    put ("Enter size of select r, groups: "         );get (r);
gearbox.setup_gearbox(n,r)  ;
combinations.build   (n,r,x);

end Main;
