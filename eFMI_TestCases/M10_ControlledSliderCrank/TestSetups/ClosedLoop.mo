within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups;
partial model ClosedLoop
  extends BaseSetup;

  replaceable PlantModels.SliderCrank_interface sliderCrank
    constrainedby PlantModels.SliderCrank_interface
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));

equation
  if is_clocked then
    connect(tau.y, sliderCrank.tau)
      annotation (Line(
        points={{36.6,0},{48,0}},
        color={0,0,127}));
    connect(phi.u, sliderCrank.phi)
      annotation (Line(
        points={{37.2,-40},{90,-40},{90,-7},{71,-7}},
        color={0,0,127}));
  else
    connect(controller.tau, sliderCrank.tau);
    connect(sliderCrank.phi, controller.phi);
  end if;

  annotation (
    Diagram(
      graphics={
        Rectangle(
          extent={{0,80},{100,60}},
          lineColor = {238,46,47},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,62},{98,78}},
          lineColor={238,46,47},
          textString="Partial: 'sliderCrank' must be redeclared.")}));
end ClosedLoop;
