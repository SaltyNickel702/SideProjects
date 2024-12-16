class PObject
{
    PObject (Vector p, Vector v, double M, double R, color C)
    {
        pos = p;
        vel = v;
        m = M;
        r = R;
        c = C;
        trail = new Trail(c);
    }
    
    Vector pos;
    Vector vel;

    double m;
    double r;

    color c;
    Trail trail;

    boolean colliding (PObject o2)
    {
        double d = Math.sqrt(Math.pow(pos.x-o2.pos.x,2) + Math.pow(pos.y-o2.pos.y,2));
        return (d <= r + o2.r); 
    }

    Vector lastForce = new Vec2d(0,0);
}
