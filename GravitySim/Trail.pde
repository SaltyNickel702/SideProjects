class Trail
{
	ArrayList<Vec2d> pos = new ArrayList<Vec2d>();
	color c;
	int maxLength = (int)5e4;

	Trail (color C)
	{
		c = C;
	}

	void display ()
	{
		strokeWeight(1);
		int interval = (int)(Math.log(CAMERA.zoom/1e5)/Math.log(10));
		if (interval < 1) interval = 1;
		println(interval);
		for (int i = interval; i < pos.size(); i+=interval)
		{
			Vector start = CAMERA.sceneToCamera(pos.get(i-interval));
			if (i + interval >= pos.size()) i = pos.size()-1;
			Vector end = CAMERA.sceneToCamera(pos.get(i));

			stroke(c,(float)(i+1)/pos.size()*255);
			line((float)start.x,(float)start.y,(float)end.x,(float)end.y);
		}
	}

	void addPnt (Vec2d p)
	{
		pos.add(p);
		if (pos.size() > maxLength)
		{
			pos.remove(0);
		}
	}
}
