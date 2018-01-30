//Inputs
// All in Meters (m)
h1 = 0.222;
h2 = 0.222;
h3 = 0.402;
h4 = 0.442;
h5 = 0.472;
l1 = 0.045;
l2 = 0.05;
l  = 0.09;
h  = 0.654;

steel_mesh = 0.05;
fluid_mesh = 0.0025;
food_mesh  = 0.002;


Point(1) = {0,-h/2,0,steel_mesh};
Point(2) = {l,-h/2,0,steel_mesh};
Point(3) = {l,h1-h/2,0,steel_mesh/5};
Point(4) = {l,h5-h/2,0,steel_mesh/5};
Point(5) = {l,h-h/2,0,steel_mesh};
Point(6) = {0,h-h/2,0,steel_mesh};
Point(7) = {0,h1-h/2,0,food_mesh};
Point(8) = {l1,h1-h/2,0,food_mesh};
Point(9) = {l2,h1-h/2,0,fluid_mesh};
Point(10) = {l2,h5-h/2,0,fluid_mesh};
Point(11) = {0,h5-h/2,0,fluid_mesh};
Point(12)= {0,h3-h/2,0,food_mesh};
Point(13)= {l1,h3-h/2,0,food_mesh};
Point(14)= {l1,h4-h/2,0,food_mesh};
Point(15)= {0,h4-h/2,0,food_mesh};

Line(16) = {1,2};
Line(17) = {2,3};
Line(18) = {3,4};
Line(19) = {4,5};
Line(20) = {5,6};
Line(21) = {6,11};
Line(22) = {11,15};
Line(23) = {15,12};
Line(24) = {12,7};
Line(25) = {7,1};
Line(26) = {7,8};
Line(27) = {8,9};
Line(28) = {9,10};
Line(29) = {10,11};
Line(30) = {12,13};
Line(31) = {13,14};
Line(32) = {14,15};
Line(33) = {8,13};

Line Loop(34) = {16:25};

Line Loop(35) = {26,27,28,29,22,23,24};

Line Loop(36) = {26,33,31,32,23,24};

Line Loop(37) = {30,31,32,23};

Plane Surface(38) = {34,35};
Plane Surface(39) = {35,36};
Plane Surface(40) = {36,37};
Plane Surface(41) = {37};

Rotate {{0,1,0},{0,0,0},2.5*Pi/180.0}
{
	Surface{38};
	Surface{39};
	Surface{40};
	Surface{41};
}
new_entities[] = Extrude {{0,1,0},{0,0,0},-5*Pi/180.0}
{
	Surface{38};
	Surface{39};
	Surface{40};
	Surface{41};
	Layers{1};
	Recombine;
};

Physical Surface("up")= {77}; 
Physical Surface("ref") = {70};
Physical Surface("wedge0") = {38,39,40,41};
Physical Surface("wedge1") = {100,148,187,204};
Physical Surface("wall") = {62,66,74};

Physical Volume("steel") = {1};
Physical Volume("fluid") = {2};
Physical Volume("food") = {3};
Physical Volume("cap") = {4};
 

