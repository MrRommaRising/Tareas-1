

s.boot;

e = Buffer.read(s,"C:/Users/Miriam/OneDrive/Escritorio/wav/tecno1.wav");

(
(
SynthDef(\audio4, {|rate=1, sp=0, at=0.001, sus=1, rel=0.001, pan=0, amp=1, out=0|
					var son, hpf, paneo, env;
					son=PlayBuf.ar(e.numChannels, e.bufnum, rate, 1, sp * e.numFrames, 0);
					hpf=HPF.ar(son, 20);
					paneo=Pan2.ar(hpf, pan, amp);
					env=EnvGen.kr(Env.new([0, 1, 1, 0], [at, sus * e.duration, rel]), doneAction: 2);
					Out.ar(out, paneo * env);
				}).add;
);
);


(
SynthDef(\misinte,{|freq=880, amp=0.5, rel=0.07|
var sonido, env;
	sonido=LFTri.ar(freq,0,amp);
	env= EnvGen.ar(Env([0,1,0],[0.01,rel]),doneAction:2);
	Out.ar(0, sonido)
}).add
)

// forma de llamar un synth
a=Synth(\misinte); // prendo
a.set(\amp, 0.9); // cambio un parámetro
a.free; // libero el synth
(
Pdef(\seq, Pbind(\instrument, \misinte,
	\dur, Pseq([0.50, 1.35,1.5],inf),
	\note, Pseq([20, 25, 37],inf),
	\amp, 0.2,
	\rel, Pseq([0.01,0.01,0.1],inf))).stop
)

// envolvente
Env([0,1,1,0],[0.1,1,0.1]).plot
