// Remixed in 2016 by Ryan A. Colyer.
// Licensed under CC Attribution-NonCommercial 3.0
// https://creativecommons.org/licenses/by-nc/3.0/
// Derived from Nvalencia's design http://www.thingiverse.com/thing:1621685

module Crop(start, end) {
  intersection() {
    translate(start)
      cube([end[0]-start[0], end[1]-start[1], end[2]-start[2]]);
    children();
  }
}


module TrimX(start, size) {
  render() {
    Crop([0,0,0], [start,1000,1000])
      children();
    translate([-size,0,0])
      Crop([(start+size)-0.001*size,0,0], [1000,1000,1000])
      children();
  }
}


module TrimY(start, size) {
  render() {
    Crop([0,0,0], [1000,start,1000])
      children();
    translate([0,-size,0])
      Crop([0,(start+size)-0.001*size,0], [1000,1000,1000])
      children();
  }
}


module TrimZ(start, size) {
  render() {
    Crop([0,0,0], [1000,1000,start])
      children();
    translate([0,0,-size])
      Crop([0,0,(start+size)-0.001*size], [1000,1000,1000])
      children();
  }
}


module OrigTop() {
  // From http://www.thingiverse.com/thing:1621685/#files
  // posted as filename "Top.STL"
  import("orig_HICTOP_circuitboard_box_top.stl");
}


module OrigBot() {
  // From http://www.thingiverse.com/thing:1621685/#files
  // posted as filename "Bottom.STL"
  import("orig_HICTOP_circuitboard_box_bottom.stl");
}


module NewBot() {
  translate([20,150,50])
  rotate([0,180,180])
  //translate([0,0,15])
  TrimX(97.99, 3)
  TrimX(93.2, 12)
  TrimX(4, 11)
  OrigBot();
}


module NewBot() {
  translate([20,150,50])
  rotate([0,180,180])
  //translate([0,0,15])
  TrimX(97.99, 3)
  TrimX(93.2, 12)
  TrimX(4, 11)
  OrigBot();
}


module NewTop() {
  translate([-20,150,0])
  rotate([0,0,180])
  //translate([200,0,0])
  TrimX(93.2, 12)
  TrimX(4, 11)
  union() {
    // Fix the lettering thin-backplate defect.
    translate([10, 83, 1.2]) cube([90,50,0.8]);
    OrigTop();
  }
}


NewBot();
NewTop();

