s.boot
s.scope
s.meter
{SinOsc.ar(100,0,0.1)!2}.play
{LFTri.ar(590,0,0.7)!2}.play.
{Pulse.ar(460.0,0.3,0.3)!2}.play
{WhiteNoise.ar(0.2)!2}.play
{BrownNoise.ar(0.1)!2}.play
{PinkNoise.ar(0.1)!2}.play
{GrayNoise.ar(0.1)!2}.play

(
SynthDef(\misinte,{|frec=440, amp=0.5|
	var sen,env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.1,0.1]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

a=Synth(\misinte,[\frec, 780])
a.free

Env.help;
Env.new([0,1,0.5,0.5,0],[0.1,0.1,0.1,1.5]).plot
.plot
.perc
.asr

(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur,Pseq ([0.15, 0.15, 0.125], inf),
		\frec,Pseq([600,500,1000], inf),
	    \amp,1
  )
);
)

~sec1.play;
~sec1.stop;