/*
    Move your ONT elsewhere.
    Copyright (C) 2023 FloppyDisk
    https://github.com/flpydsk/ONTFibreBox.git

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

//Change me if you have multiple ONT's
DoYouWant2=false;

//Do not change stuff below this line
$fn=100;
Length=124;
Width=178+3;
Hight=20; //33
WallThickness=1.5;
Roundness=10;
ClipX=16;
ClipY=1.8;
ClipZ=17;
Offset=-7;
ClipFeatureX=16;
ClipFeatureY=1.5;
ClipFeatureZ=5;
ClipFeatureOffsetZ=3;
PlugWidth=13;
PlugHight=9.5;

main();

module main() {
  difference() {
    minkowski() {
      cube([Length-Roundness,Width-Roundness,Hight],center=true);
      cylinder(d=Roundness);
    }
    translate([0, 0, -WallThickness/2]) {
      cube([Length-WallThickness*2,Width-2*(ClipFeatureY+ClipY)-2*WallThickness,Hight-WallThickness],center=true);
    }
  translate([Offset, 0, 0]) {
    union(){
      translate([0, -ClipFeatureY/2+Width/2-ClipY, ClipFeatureZ/2-Hight/2+ClipFeatureOffsetZ]) {
        cube([ClipFeatureX,ClipFeatureY,ClipFeatureZ],center=true);
      }
      translate([0, -Width/2+ClipY/2, (ClipZ/2)-Hight/2]) {
        cube([ClipX,ClipY,ClipZ],center=true);
      }
    }
    union(){
      translate([0, ClipFeatureY/2-Width/2+ClipY, ClipFeatureZ/2-Hight/2+ClipFeatureOffsetZ]) {
        cube([ClipFeatureX,ClipFeatureY,ClipFeatureZ],center=true);
      }
      translate([0, Width/2-ClipY/2, (ClipZ/2)-Hight/2]) {
        cube([ClipX,ClipY,ClipZ],center=true);
      }
    }
  }

    if(DoYouWant2) {
      translate([Length/2,PlugWidth*2.5, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
      translate([Length/2,-PlugWidth*2.5, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
    } else {
      translate([Length/2, 0, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
    }
  }
}
