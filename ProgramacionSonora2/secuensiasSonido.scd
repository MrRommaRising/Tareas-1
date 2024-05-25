
TempoClock.tempo=60/120;

(
(
~son4 = Pdef(\son4, Pbind(\instrument, \audio4,
	\dur, Pseq([5/2], inf),
	\sus, Pseq([1.4], inf),
	\rel, Pseq([1.4], inf),
	\rate, Pseq([2], inf),
	\sp, Pseq([0], inf),
	\amp, 0.7,
	\out, 9
))
))
);

(
(
~son2 = Pdef(\son4, Pbind(\instrument, \misinte,
	\dur, Pseq([2/6], inf),
	\sus, Pseq([2.4], inf),
	\rel, Pseq([3.4], inf),
	\rate, Pseq([3], inf),
	\sp, Pseq([0], inf),
	\amp, 0.5,
	\out, 9
))
))
);



~son4.play.quant(4);
~son4.stop;
~son2.play.quant(4);
~son2.stop;

