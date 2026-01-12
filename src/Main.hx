package;

import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.geom.ColorTransform;

/**
 * ...
 * @author Toby Davis
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Background color
		var background:Sprite = new Sprite();
		background.graphics.beginFill(0x282828);
		background.graphics.drawRect(0, 0, 800, 480);
		background.graphics.endFill();
		
		addChild(background);
		
		// Display container for bitmaps
		var display:Sprite = new Sprite();
		display.graphics.beginFill(0x7b7bc0);
		display.graphics.drawRect(0, 0, 320, 240);
		display.graphics.endFill();
		
		addChild(display);
		
		var image:BitmapData = Assets.getBitmapData("img/square2.png");
		
		// Bitmap with a add effect
		var spriteAdd:Bitmap = new Bitmap(image);
		spriteAdd.blendMode = "add"; 
		
		// Bitmap with a subtract effect
		var spriteSub:Bitmap = new Bitmap(image);
		spriteSub.blendMode = "subtract";
		
		// Bitmap with a invert effect
		var spriteInvert:Bitmap = new Bitmap(image);
		spriteInvert.blendMode = "normal";
		spriteInvert.transform.colorTransform = new ColorTransform( -1, -1, -1, 1, 0, 0, 0, 0);
		
		// Set image positions
		spriteAdd.x = 0;
		spriteSub.x = 64;
		spriteInvert.x = 128;
		
		// Add bitmaps to display container
		display.addChild(spriteAdd);
		display.addChild(spriteSub);
		display.addChild(spriteInvert);
		
		// Bitmap data that will capture a screenshot of the display sprite
		var captureData:BitmapData = new BitmapData(320, 240, false);
		captureData.disposeImage();
		captureData.draw(display);
		
		// Add captured image to the stage for comparison (shown on the right)
		var captureSurface:Bitmap = new Bitmap(captureData);
		captureSurface.x = 400;
		addChild(captureSurface);
	}

}
