package GUI {
	import adobe.utils.CustomActions;
	import org.flixel.*;
	import Waves.*;
	import States.*;
	/**
	 * ...
	 * @author Roger Liu (>'_')>
	 */
	public class PauseMenu extends FlxGroup
	{
		[Embed(source = "../../assets/UI/Help-BG.png")] private var HelpMenu:Class;
		public var help_menu:FlxSprite = new FlxSprite(0, 0);
		public var help_text:FlxText = new FlxText(50, 250, 500, "Objective: You control the traffic lights by clicking on them! Try to get as many cars to crash as possible, and prevent as many as you can from returning home. \n Controls: \n x = display mini map \n p = pause/unpause");
		
		/*the game state this menu resides in*/
		private var game_state:GameState;
		
		public function PauseMenu(game_state:GameState) 
		{
			help_menu.loadGraphic(HelpMenu);
			help_menu.scrollFactor.x = 0;
			help_menu.scrollFactor.y = 0;
			help_menu.visible = true;
			add(help_menu);
			
			help_text.visible = true;
			add(help_text);
			
			this.game_state = game_state;
		}
		
		public function open():void
		{
			this.visible = true;
			game_state.remove(this);
			
			for (var i:int = 0; i < game_state.members.length; i++)
			{
				if (game_state.members[i] == null && i < game_state.members.length-1)
					game_state.members[i] = game_state.members[i + 1];
			}
			game_state.add(this);
		}
		
		public function close(): void 
		{
			this.visible = false;
		}
	}
}