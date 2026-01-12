package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.geom.ColorTransform;

/**
 * ...
 * @author Toby Davis
 */
class Main extends Sprite {
	public function new() {
		super();

		this.stage.color = 0xffffff;

		var image0a:BitmapData = Assets.getBitmapData("img/blendMode-0a.jpg");
		var image0b:BitmapData = Assets.getBitmapData("img/blendMode-0b.jpg");

		var image1:Bitmap = new Bitmap(image0a);
		addChild(image1);
		var image2:Bitmap = new Bitmap(image0b);
		addChild(image2);
		image2.x = image1.width * 0.4;
		image2.y = image1.height * 0.4;
		image2.blendMode = SUBTRACT;
	}
}
