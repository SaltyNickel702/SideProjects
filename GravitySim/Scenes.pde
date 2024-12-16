void earthMoon ()
{
	CAMERA.zoom = 1.1e6;

    //Earth
    objs.add(new PObject(
        new Vec2d(0,-7e7*0),
        new Vec2d(0,-12),
        5.972e24d,
        6378e3d,
        #003388
    ));

    //Moon
    objs.add(new PObject(
        new Vec2d(405000e3,0),
        new Vec2d(0,970),
        7.34767309e22,
        1740e3,
        #cccccc
    ));
}
void solarSystem ()
{
	CAMERA.zoom = 5e8;

    //Sun
    objs.add(new PObject(
        new Vec2d(0,0),
        new Vec2d(0,1e1),
        1.9891e30d,
        696265e3d,
        #ffcc00
    ));


    //Mercury
    objs.add(new PObject(
        new Vec2d(6.98e10,0),
        new Vec2d(0,38868.6),
        0.33010e24d,
        2440.5e3d,
        #ccaa88
    ));

    //Venus
    objs.add(new PObject(
        new Vec2d(108208930e3,0),
        new Vec2d(0,35.02e3),
        4.87e24d,
        6051e3d,
        #ee7744
    ));

    //Moon
    objs.add(new PObject(
        new Vec2d(1.496e11d + 405000e3,0),
        new Vec2d(0,970 + 29784.8),
        7.34767309e22d,
        1740e3d,
        #cccccc
    ));
    //Earth
    objs.add(new PObject(
        new Vec2d(1.496e11d,0),
        new Vec2d(0,-12 + 29784.8),
        5.972e24d,
        6378e3d,
        #003388
    ));

    //Mars
    objs.add(new PObject(
        new Vec2d(2.279e11,0),
        new Vec2d(0,24.13e3),
        0.64169e24d,
        3396.2e3d,
        #ff5226
    ));

    //Jupiter
    objs.add(new PObject(
        new Vec2d(-7.783e11,0),
        new Vec2d(0,-13.06e3),
        1898.13e24,
        71492e3,
        #bb5500
    ));

    //Saturn
    objs.add(new PObject(
        new Vec2d(14.27e11,0),
        new Vec2d(0,9.64e3),
        568.32e24,
        60268e3,
        #ffdd88
    ));

    //Uranus
    objs.add(new PObject(
        new Vec2d(28.69e11,0),
        new Vec2d(0,6.81e3),
        86.811e24,
        25559e3,
        #94fff4
    ));

    //Neptune
    objs.add(new PObject(
        new Vec2d(44.52e11,0),
        new Vec2d(0,5.43e3),
        102.409e24,
        24764e3,
        #0000ff
    ));

    //Pluto
    objs.add(new PObject(
        new Vec2d(7.38e12,0),
        new Vec2d(0,3.68e3),
        0.01303e24,
        1188e3,
        #bbbbdd
    ));
}
void innerPlanets ()
{
	CAMERA.zoom = 5e8;

	//Sun
    objs.add(new PObject(
        new Vec2d(0,0),
        new Vec2d(0,1e1),
        1.9891e30d,
        696265e3d,
        #ffcc00
    ));


    //Mercury
    objs.add(new PObject(
        new Vec2d(6.98e10,0),
        new Vec2d(0,38868.6),
        0.33010e24d,
        2440.5e3d,
        #ccaa88
    ));

    //Venus
    objs.add(new PObject(
        new Vec2d(108208930e3,0),
        new Vec2d(0,35.02e3),
        4.87e24d,
        6051e3d,
        #ee7744
    ));

    //Moon
    objs.add(new PObject(
        new Vec2d(1.496e11d + 405000e3,0),
        new Vec2d(0,970 + 29784.8),
        7.34767309e22d,
        1740e3d,
        #cccccc
    ));
    //Earth
    objs.add(new PObject(
        new Vec2d(1.496e11d,0),
        new Vec2d(0,-12 + 29784.8),
        5.972e24d,
        6378e3d,
        #003388
    ));

    //Mars
    objs.add(new PObject(
        new Vec2d(2.279e11,0),
        new Vec2d(0,24.13e3),
        0.64169e24d,
        3396.2e3d,
        #ff5226
    ));
}
void plutoSystem ()
{
	
}