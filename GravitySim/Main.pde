import java.text.DecimalFormat;
import java.awt.event.KeyEvent;

Camera CAMERA = new Camera();
void setup ()
{
    size(1000,1000);
    frameRate(60);

    solarSystem();

    physics.start();
}


//Debug Booleans
boolean drawVelocity = false;
boolean drawForce = false;
boolean drawTrails = true;
double radiusMultiplier = 1e0;

void draw ()
{
    background(0,0,6);

    //add reference lines
    Vector b1 = CAMERA.cameraToScene(new Vec2d(0,height));
    Vector b2 = CAMERA.cameraToScene(new Vec2d(width,0));

    int base = 3;
    double scrnWidth = b2.x-b1.x;
    double lineInt = Math.pow(base,Math.floor(Math.log(scrnWidth/7)/Math.log(base)));
    
    strokeWeight(1);
    stroke(#333366);
    for (long i = (long)(b1.x - (b1.x % lineInt)); i < b2.x; i+= lineInt)
    {
        double x = CAMERA.sceneToCamera(new Vec2d(i,0)).x;
        line((float)x,0,(float)x,height);
    }
    for (long i = (long)(b1.y - (b1.y % lineInt)); i < b2.y; i+= lineInt)
    {
        double y = CAMERA.sceneToCamera(new Vec2d(0,i)).y;
        line(0,(float)y,width,(float)y);
    }


    //Trails
    for (PObject obj : objs)
    {
        if (drawTrails)
        {
            obj.trail.display();
        }
    }
    
    //Draw planets
    for (PObject obj : objs)
    {
        Vec2d scrn = CAMERA.sceneToCamera(obj.pos);
        double r = (obj.r / CAMERA.zoom);
        
        noStroke();
        fill(obj.c);
        ellipse((float)scrn.x,(float)scrn.y,(float)(r*2*radiusMultiplier),(float)(r*2*radiusMultiplier));

        if (drawVelocity)
        {
            Vec2d end = CAMERA.sceneToCamera(obj.pos.add(obj.vel.multiplyA(5e4)));
            stroke(#0000ff);
            strokeWeight(2);
            line((float)scrn.x,(float)scrn.y,(float)end.x,(float)end.y);
        }
        if (drawForce)
        {
            Vector end = obj.pos.add(obj.lastForce.multiplyA(1e-13d));
            Vec2d endScrn = CAMERA.sceneToCamera(end);
            stroke(#ff0000);
            strokeWeight(2);
            line((float)scrn.x,(float)scrn.y,(float)endScrn.x,(float)endScrn.y);
        }
    }

    fill(0,255,0);
    textAlign(LEFT,TOP);
    text((int)(secs/(YEAR*60)) + " years",0,0);
}


//Movement
void mouseWheel (MouseEvent e)
{
    float c = e.getCount();
    CAMERA.zoom*= Math.pow(1.3,c);
    
    DecimalFormat df = new DecimalFormat("0.0E0");
    CAMERA.zoom = Double.parseDouble(df.format(CAMERA.zoom));
}

Vec2d dragStart = null;
Vec2d camStart = null;
int i = 0;
void mousePressed ()
{
    dragStart = new Vec2d(mouseX,mouseY);
    camStart = new Vec2d(CAMERA.pos.x,CAMERA.pos.y);
}
void mouseDragged ()
{
    Vector dlt = CAMERA.cameraToScene(new Vec2d(mouseX,mouseY)).sub(CAMERA.cameraToScene(dragStart));
    CAMERA.pos = camStart.add(dlt.multiply(new Vec2d(-1,-1)));
    CAMERA.pairedTo = null;
}
void mouseReleased ()
{
    dragStart = null;
    camStart = null;
}
void keyPressed ()
{
    try
    {
        int k = Integer.parseInt(key + "");
        if (k == 0) k = 10;
        if (k >= objs.size()) return;
        PObject o = objs.get(k);
        CAMERA.pairedTo = o;
        return;
    }
    catch (NumberFormatException e) {}
    switch (keyCode)
    {
        case KeyEvent.VK_SPACE:
            physicsRunning = !physicsRunning;
            break;
        case KeyEvent.VK_TAB:
            CAMERA.pairedTo = objs.get(0);
            break;
            
        case KeyEvent.VK_T:
            drawTrails = !drawTrails;
            break;
        case KeyEvent.VK_V:
            drawVelocity = !drawVelocity;
            break;
        case KeyEvent.VK_F:
            drawForce = !drawForce;
            break;

        case KeyEvent.VK_D:
            timeFlow = DAY;
            break;
        case KeyEvent.VK_M:
            timeFlow = MONTH;
            break;
        case KeyEvent.VK_Y:
            timeFlow = YEAR;
            break;
        case KeyEvent.VK_C:
            timeFlow = HALF_CENTURY;
            break;
    }
}
