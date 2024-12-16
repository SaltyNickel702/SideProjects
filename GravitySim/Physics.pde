final double MONTH = 27.3 * 24 * 60;
final double DAY = 24 * 60;
final double YEAR = 365.25 * 24 * 60;
final double HALF_CENTURY = 50 * YEAR;
double timeFlow = YEAR;

int tickRate = 300;
double secs = 0;

ArrayList<PObject> objs = new ArrayList<PObject>();

final double GRAVITY = 6.67 * Math.pow(10,-11);

boolean physicsRunning = true;
Thread physics = new Thread()
{
    public void run ()
    {
        while (true)
        {
            if (physicsRunning)
            {
                secs+=timeFlow/tickRate;

                ArrayList<Vec2d> forces = new ArrayList<Vec2d>();
                //Gravity
                for (PObject o1 : objs)
                {
                    Vec2d force = new Vec2d(0,0);
                    for (PObject o2 : objs)
                    {
                        if (o1 == o2) continue;
                        Vec2d f = new Vec2d(0,1);
                        
                        f.setMagnitude(getForce(o1,o2));
                        
                        double angleTo = o1.pos.angleTo(o2.pos);
                        f.setAngle(angleTo);

                        force = (Vec2d)force.add(f);
                    }
                    forces.add(force);
                }
                //Collisions
                /*
                for (int i = 0; i < objs.size(); i++)
                {
                    PObject o1 = objs.get(i);
                    for (PObject o2 : objs)
                    {
                        if (o1 == o2) continue;
                        if (o1.colliding(o2))
                        {
                            double angleTo = o1.pos.angleTo(o2.pos);
                            Vector dir = o1.vel.normal();
                            dir.setAngle(dir.angle() + 2*(dir.angle()-(angleTo + Math.PI)));
                            dir.setMagnitude(o1.vel.magnitude()/o1.m);
                            forces.set(i,(Vec2d)dir);
                        }
                    }
                }
                //*/

                //Calculating new Position
                for (int i = 0; i < objs.size(); i++)
                {
                    PObject obj = objs.get(i);
                    Vec2d force = forces.get(i);
                    Vector accel = force.multiplyA(1/obj.m);
                    obj.vel = obj.vel.add(accel.multiplyA(timeOffset()));
                    obj.pos = obj.pos.add(obj.vel.multiplyA(timeOffset()));
                    
                    obj.lastForce = force;
                }


                //Display that looks better when synced
                if (CAMERA.pairedTo != null)
                {
                    PObject pr = CAMERA.pairedTo;
                    CAMERA.pos.x = pr.pos.x + 0;
                    CAMERA.pos.y = pr.pos.y + 0;
                }
                for (PObject obj : objs)
                {
                    Vec2d p = new Vec2d(obj.pos.x,obj.pos.y);
                    obj.trail.addPnt(p);
                }
            }

            try {
                Thread.sleep(1000/tickRate);
            } catch (InterruptedException e) {}
        }
        
    }
};
double timeOffset ()
{
    return (double)1/tickRate * timeFlow;
}
double getForce (PObject o1, PObject o2)
{
    double r = Math.sqrt(Math.pow(o1.pos.x-o2.pos.x,2) + Math.pow(o1.pos.y-o2.pos.y,2));
    return (GRAVITY * o1.m * o2.m)/Math.pow(r,2);
}
