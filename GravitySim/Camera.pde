class Camera
{
    Vector pos = new Vec2d(0,0);
    double zoom = 5e8;

    Vec2d sceneToCamera (Vector vec)
    {
        Vec2d translate = (Vec2d)vec.sub(pos).multiply(new Vec2d(1/zoom,-1/zoom)).add(new Vec2d((double)width/2,(double)height/2));
        return translate;
    }
    Vec2d cameraToScene (Vector vec)
    {
        Vec2d translate = (Vec2d)vec.sub(new Vec2d(width/2,height/2)).multiply(new Vec2d(zoom,-zoom)).add(pos);
        return translate;
    }

    PObject pairedTo = null;
}
