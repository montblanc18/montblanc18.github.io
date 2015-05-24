# -*- coding: utf-8 -*-


require 'libRuby'

#
#とりあえずひたすら図をつくるプログラム
#

Num = 1000
array = Array.new(2).map{Array.new(Num,0)}
brray = Array.new(2).map{Array.new(Num,0)}#双曲線用

####放物線
p = 0.25
for i in 0..(Num-1) do
  array[0][i] = 10*(i.to_f-Num.to_f/2.0)/Num.to_f
  array[1][i] = 4*p*array[0][i]*array[0][i]
end

c1 = TCanvas.new("c1","c1",400+4,400+28)
graph = TGraph.new(Num,array[0],array[1])
graph.SetTitle("parabola,p=1/4");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
c1.SetGridx()
c1.SetGridy()
graph.GetXaxis().SetLimits(-5,5)
graph.GetYaxis().SetRangeUser(0,10)
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")
c1.SaveAs("parabola_p0.125x.eps");

####放物線
p = 0.25
for i in 0..(Num-1) do
  array[1][i] = 10*(i.to_f-Num.to_f/2.0)/Num.to_f
  array[0][i] = 4*p*array[1][i]*array[1][i]
end

c1 = TCanvas.new("c1","c1",400+4,400+28)
graph = TGraph.new(Num,array[0],array[1])
graph.SetTitle("parabola,p=1/4");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
c1.SetGridx()
c1.SetGridy()
graph.GetXaxis().SetLimits(0,10)
graph.GetYaxis().SetRangeUser(-5,5)
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")
c1.SaveAs("parabola_p0.125y.eps");

####楕円
a = 5
b = 3
for i in 0..(Num-1) do
  array[0][i] = a*Math::cos(2*Math::PI*i.to_f/Num.to_f)
  array[1][i] = b*Math::sin(2*Math::PI*i.to_f/Num.to_f)
end

c1 = TCanvas.new("c1","c1",400+4,400+28)
graph = TGraph.new(Num,array[0],array[1])
graph.SetTitle("ellipse,a=5,b=3");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
graph.GetXaxis().SetLimits(-6,6)
graph.GetYaxis().SetRangeUser(-6,6)
c1.SetGridx()
c1.SetGridy()
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")

c1.SaveAs("ellipse_a5b3.eps");

####楕円
a = 3
b = 5
for i in 0..(Num-1) do
  array[0][i] = a*Math::cos(2*Math::PI*i.to_f/Num.to_f)
  array[1][i] = b*Math::sin(2*Math::PI*i.to_f/Num.to_f)
end

c1 = TCanvas.new("c1","c1",400+4,400+28)
graph = TGraph.new(Num,array[0],array[1])
graph.SetTitle("ellipse,a=3,b=5");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
graph.GetXaxis().SetLimits(-6,6)
graph.GetYaxis().SetRangeUser(-6,6)
c1.SetGridx()
c1.SetGridy()
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")

c1.SaveAs("ellipse_a3b5.eps");

####双曲線
a = 2
b = 1
for i in 0..(Num-1) do
  x = 2*Math::PI*(i.to_f - Num.to_f/2.0)/Num.to_f
  array[0][i] = a*(Math::exp(x)+Math::exp(-x))/2.0
  array[1][i] = b*(Math::exp(x)-Math::exp(-x))/2.0
end
for i in 0..(Num-1) do
  x = 2*Math::PI*(i.to_f - Num.to_f/2.0)/Num.to_f
  brray[0][i] = -a*(Math::exp(x)+Math::exp(-x))/2.0
  brray[1][i] = b*(Math::exp(x)-Math::exp(-x))/2.0
end

c1 = TCanvas.new("c1","c1",300+4,300+28)
graph = TGraph.new(Num,array[0],array[1])
graphb = TGraph.new(Num,brray[0],brray[1])
graph.SetTitle("hyperbola,a=2,b=1");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
graph.GetXaxis().SetLimits(-10,10)
graph.GetYaxis().SetRangeUser(-10,10)
c1.SetGridx()
c1.SetGridy()
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")
graphb.Draw("PL")

c1.SaveAs("hyperbola_a2b1x.eps");

####双曲線
a = 2
b = 1
for i in 0..(Num-1) do
  x = 2*Math::PI*(i.to_f - Num.to_f/2.0)/Num.to_f
  array[0][i] = a*(Math::exp(x)-Math::exp(-x))/2.0
  array[1][i] = b*(Math::exp(x)+Math::exp(-x))/2.0
end
for i in 0..(Num-1) do
  x = 2*Math::PI*(i.to_f - Num.to_f/2.0)/Num.to_f
  brray[0][i] = a*(Math::exp(x)-Math::exp(-x))/2.0
  brray[1][i] = -b*(Math::exp(x)+Math::exp(-x))/2.0
end

c1 = TCanvas.new("c1","c1",300+4,300+28)
graph = TGraph.new(Num,array[0],array[1])
graphb = TGraph.new(Num,brray[0],brray[1])
graph.SetTitle("hyperbola,a=2,b=1");
graph.GetXaxis().SetTitle("x")
graph.GetYaxis().SetTitle("y")
graph.GetXaxis().SetLimits(-10,10)
graph.GetYaxis().SetRangeUser(-10,10)
c1.SetGridx()
c1.SetGridy()
gStyle.SetGridStyle(3)
gStyle.SetGridWidth(1)
graph.Draw("APL")
graphb.Draw("PL")

c1.SaveAs("hyperbola_a2b1y.eps");
