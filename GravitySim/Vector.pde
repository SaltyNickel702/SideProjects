class Vector
{
    double x, y;

    double angle ()
    {
        return Math.atan(y/x) + (x < 0 ? Math.PI : 0);
    }
    double magnitude ()
    {
        return Math.sqrt(Math.pow(x,2) + Math.pow(y,2));
    }
    Vector normal ()
    {
        return multiply(new Vec2d(1/magnitude(),1/magnitude()));
    }

    double angleTo (Vector v2)
    {
        Vector dif = v2.sub(this);
        double a = dif.angle();
        return a;
    }


    void setAngle (double radians)
    {
        double mag = magnitude();
        x = Math.cos(radians)*(mag);
        y = Math.sin(radians)*(mag);
    }
    void setMagnitude (double mag)
    {
        double radians = angle();
        x = Math.cos(radians)*(mag);
        y = Math.sin(radians)*(mag);
    }


    Vector add (Vector vec)
    {
        return new Vec2d(x+vec.x,y+vec.y);
    }
    Vector sub (Vector vec)
    {
        return new Vec2d(x-vec.x,y-vec.y);
    }
    Vector multiply (Vector mag)
    {
        return new Vec2d(x*mag.x,y*mag.y);
    }
    Vector multiplyA (double mag)
    {
        return multiply(new Vec2d(mag,mag));
    }
}
class Vec2d extends Vector
{
    Vec2d (double x, double y)
    {
        this.x = x;
        this.y = y;
    }
}
class Rotation extends Vector
{
    Rotation (double rad, double mag)
    {
        x = mag;
        setAngle(rad);
    }
}
