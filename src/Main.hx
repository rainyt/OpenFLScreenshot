package;

import openfl.Vector;
import openfl.geom.Matrix;
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
class Main extends Sprite {
	public function new() {
		super();

		var stageBitmapData = new openfl.display.BitmapData(stage.stageWidth, stage.stageHeight, true, 0x0);
		stageBitmapData.disposeImage();

		// Background color
		var background:Sprite = new Sprite();
		background.graphics.beginFill(0x282828);
		background.graphics.drawRect(0, 0, 800, 480);
		background.graphics.endFill();

		stageBitmapData.draw(background);

		// Display container for bitmaps
		var display:Sprite = new Sprite();
		display.graphics.beginFill(0x7b7bc0);
		display.graphics.drawRect(0, 0, 320, 240);
		display.graphics.endFill();

		stageBitmapData.draw(display);

		var image:BitmapData = Assets.getBitmapData("img/square2.png");

		// Bitmap with a add effect
		var spriteAdd:Bitmap = new Bitmap(image);
		spriteAdd.blendMode = "add";

		// Bitmap with a subtract effect
		var spriteSub:Bitmap = new Bitmap(image);
		// spriteSub.blendMode = "subtract";

		// Bitmap with a invert effect
		var spriteInvert:Bitmap = new Bitmap(image);
		spriteInvert.blendMode = "normal";
		spriteInvert.transform.colorTransform = new ColorTransform(-1, -1, -1, 1, 0, 0, 0, 0);

		// Set image positions
		spriteAdd.x = 0;
		spriteSub.x = 64;
		spriteInvert.x = 128;

		stageBitmapData.draw(spriteAdd, new Matrix(1, 0, 0, 1, spriteAdd.x, spriteAdd.y));
		stageBitmapData.draw(spriteInvert, new Matrix(1, 0, 0, 1, spriteInvert.x, spriteInvert.y));

		var subStageBitmapData = new openfl.display.BitmapData(stage.stageWidth, stage.stageHeight, true, 0x0);
		subStageBitmapData.disposeImage();
		subStageBitmapData.draw(spriteSub, new Matrix(1, 0, 0, 1, spriteSub.x, spriteSub.y));

		// this.addChild(new Bitmap(stageBitmapData));
		// this.addChild(new Bitmap(subStageBitmapData));

		var shape = new Sprite();
		var shader = new SubtractShader();
		shader.bitmap.input = stageBitmapData;
		shader.u_subBitmap.input = subStageBitmapData;
		shape.graphics.beginShaderFill(shader);
		shape.graphics.drawTriangles(new Vector<Float>([
			               0,                 0,
			stage.stageWidth,                 0,
			stage.stageWidth, stage.stageHeight,
			               0, stage.stageHeight
		]), new Vector<Int>([
			0, 1, 2,
			0, 2, 3
			]));
		shape.graphics.endFill();
		this.addChild(shape);

		// Add bitmaps to display container
		// display.addChild(spriteAdd);
		// display.addChild(spriteSub);
		// display.addChild(spriteInvert);

		// Bitmap data that will capture a screenshot of the display sprite
		// var captureData:BitmapData = new BitmapData(320, 240, false);
		// captureData.disposeImage();
		// captureData.draw(display);

		// // Add captured image to the stage for comparison (shown on the right)
		// var captureSurface:Bitmap = new Bitmap(captureData);
		// captureSurface.x = 400;
		// addChild(captureSurface);
	}
}
