# Heat-Diffusion-in-2D-Plate

  The purpose of this project is to create a MATLAB program that calculates and displays
the diffusion of heat on an airplane panel. The interactive software is designed to receive specific
parameters about the panel from the user - boundary temperatures, plate dimensions, number of
nodes, and acceptable error - and produce a heat map of the panel overlaying the temperature
zones in both a visual and tabulated manner. Before calculating the temperatures at every node,
the steady-state function uses a matrix to overlay a grid of temperature zones (or nodes), the
number of which is based on the user’s chosen number (referred to in this report as the “node
matrix”). Then, one of the three available user-selectable numerical methods - Gauss elimination
with partial pivoting, Gauss-Seidel, or the inverse method - is called to calculate the temperature
at each one of these nodes to simulate heat transfer beyond the boundaries of the panel. Finally,
the program creates a database of all the nodes and their temperatures in a labeled table, along
with a visualization of the heat transfer using a heatmap plot. This program caters to engineers
and engineering students who are interested in modeling the behavior of heat on the panels in
airplanes.
