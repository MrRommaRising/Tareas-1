//@mrroma.v-Instagram
//Create by Vidal-alias-MrRomaRising

osc(20, 0.1, 2.5)
	.modulateScrollX(voronoi(2, 0.2, 10), 0.2)
	.shift(1.1)
	.mask(shape(3, 0.4)
		.rotate(0, 0.3)
		.repeat(20, 100), 20)
	.modulate(src(o0)
		.modulateScrollY(osc(10, 0.01)
			.scale(2, 2), 0.2), 0.5)
	.sub(noise(9, 0.2, )
		.kaleid(6, 0.2, 3)
		.brightness(() => Math.sin(time)), 0.3)
	.out(o0)