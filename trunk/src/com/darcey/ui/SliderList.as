package com.darcey.ui
{
	// ------------------------------------------------------------------------------------------------------------------------------
	import com.bit101.components.ColorChooser;
	import com.bit101.components.HSlider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	// ------------------------------------------------------------------------------------------------------------------------------
	
	
	// ------------------------------------------------------------------------------------------------------------------------------
	public class SliderList extends Sprite
	{
		// ------------------------------------------------------------------------------------------------------------------------------
		private var componentsArray:Array;
		private var componentIndex:int = 0;
		private var sliderYStep:Number = 12;
		private var xpos:Number = 5;
		private var ypos:Number = 0;
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		public function SliderList()
		{
			componentsArray = [];
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		public function addSliderGap():void
		{
			componentIndex ++;
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		public function addObjectSlider(
			label:String,
			width:int,
			min:Number,max:Number,
			defaultValue:Number,
			objectToUpdate:Object,
			objectParamaterToUpdate:String
		):void {
			componentIndex++;
			
			// Ini components array (textField will be done later)
			var params:SliderListParamatersObject = new SliderListParamatersObject();
			params.label = label;
			params.objectToUpdate = objectToUpdate;
			params.objectParamaterToUpdate = objectParamaterToUpdate;
			params.uiComponent = new HSlider();
			
			// Add component to components array
			componentsArray["Component " + componentIndex] = params.uiComponent;
			
			// Configure component add to display list
			HSlider(params.uiComponent).name = "Component " + componentIndex;
			HSlider(params.uiComponent).width = width;
			HSlider(params.uiComponent).minimum = min;
			HSlider(params.uiComponent).maximum = max;
			HSlider(params.uiComponent).x = 0;
			HSlider(params.uiComponent).y = (componentIndex-1) * sliderYStep;
			addChild(params.uiComponent);
			
			// Setup textfield
			params.textField = addText(params.label + " " + HSlider(params.uiComponent).value.toFixed(2),10);
			TextField(params.textField).x = HSlider(params.uiComponent).x + HSlider(params.uiComponent).width + 10;
			TextField(params.textField).y = -2 + ((componentIndex-1) * sliderYStep);
			addChild(params.textField);
			
			HSlider(params.uiComponent).addEventListener(Event.CHANGE,updateSliderObject);
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		private function updateSliderObject(e:Event):void
		{
			var hslider:HSlider = (e.target) as HSlider;
			var component:Object = componentsArray[hslider.name];
			updateText(component.label + " " + component.component.value.toFixed(2),component.textfield,10);
			
			component.objToUpdate[component.paramToUpdate] = hslider.value;
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		
		
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		public function addColorSelector(
			label:String,
			defaultValue:Number,
			target:Object,
			targetParamaterToUpdate:String
		):void{
			componentIndex++;
			
			var component:Object = new Object();
			componentsArray["Component " + componentIndex] = component;
			
			component.label = label;
			component.objToUpdate = target;
			component.paramToUpdate = targetParamaterToUpdate;
			
			component.component = new ColorChooser(null,5,210,defaultValue);
			ColorChooser(component.component).name = "Slider " + componentIndex;
			ColorChooser(component.component).x = 0;
			ColorChooser(component.component).y = (componentIndex-1) * sliderYStep;
			addChild(component.component);
			
			var txt:TextField = addText(component.label + " " + ColorChooser(component.component).value);
			txt.x = (ColorChooser(component.component).x + ColorChooser(component.component).width) + 10;
			txt.y = -2 + ((componentIndex-1) * sliderYStep);
			addChild(txt);
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		private function sliderColorUpdate(e:Event):void
		{
			
		}
		// ------------------------------------------------------------------------------------------------------------------------------
		

		
		
		
		
		
		// ------------------------------------------------------------------------------------------------------------------------------
		private function addText(label:String = "message",size:int=10):TextField
		{
			var tf:TextFormat = new TextFormat();
			tf.color = 0xFFFFFF;
			tf.size = size;
			tf.font = "arial";
			tf.bold = true;
			var text:TextField = new TextField();
			text.antiAliasType = AntiAliasType.ADVANCED;
			text.autoSize = TextFieldAutoSize.LEFT;
			text.multiline = false;
			text.selectable = false;
			text.text = label;
			text.setTextFormat(tf);
			return text;
		}
		private function updateText(label:String,text:TextField,size:int = 10):void
		{
			var tf:TextFormat = new TextFormat();
			tf.color = 0xFFFFFF;
			tf.size = size;
			tf.font = "arial";
			tf.bold = true;
			text.text = label;
			text.setTextFormat(tf);
		}
		// ------------------------------------------------------------------------------------------------------------------------------		
		
		
		
	}
	// ------------------------------------------------------------------------------------------------------------------------------
	
	
}