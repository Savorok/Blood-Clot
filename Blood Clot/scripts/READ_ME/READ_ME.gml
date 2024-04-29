	/* -----------------------------------------------------------------------------
	                              ESSENTIAL AUTOWALL 2
	--------------------------------------------------------------------------------

	Hello and thank you for purchasing this asset! It is designed to help you make 
	easy autowalls in your game (also known as autotiles) for both 16 and 47 frame
	tiles or sprites. Before using the asset please run it "as-is" in GMS2 and play 
	around with the demo to get an idea of what it does, and also please take some
	time to read the function comments so you can see how it all works.

	It should be noted that the 47 frame tileset and autowall functions in the asset 
	are 100% compatible with the GMS2 47 tile autotile tileset and so you can tile
	your room using the GMS2 auotiles in the room editor and then in your game, 
	change them using these functions. However, the 16 tile autowall functions are NOT
	compatible with the GMS2 autotiles. GMS2 16 frame autotiles are designed for 
	making large areas of terrain that cover the entire room, while the 16 frame
	autotile found in this asset is designed for platform games or top down shooters
	to create walls or platforms and as such uses the more standard 16 frame 
	autotile that can be found on the internet for such things.

	To use these functions in your game simply follow these steps:

	1) Call the "scr_EA_Init()" function right at the start of your game

	2) In the room editor for the rooms you want to autowall, use either instances
	   or tiles to create the areas you want the autowalls to be made (see the 
	   demo rooms 2 and 3 for examples)
   
	3) Create a controller object and in the Create or Room Start event call the
	   "ea_setup()" function, supplying the required arguments for the layer
	   to use, the sprite or tileset to use, and the cell size (or add this function
	   to a controller object that is already present in your game).
   
	4) Add the controller object to the room you want to autowall, ensuring that 
	   the room has a layer with the name given in the setup function. Note that the 
	   room does not HAVE to have tiles or instances placed in it already, but it must
	   have a layer specifically for the autowall tiles/instances
   
	And that's it! The functions will turn any exisiting tiles or instances in the room 
	into aiutowall instances or tiles (depending on the type of autowall you have 
	chosen), and you can then use the additional functions to create effects and modify 
	them in real time in your game. For example, have grenades blow holes in the walls 
	using function "ea_remove_circle()"!

	You can also use the functions to create level editors, as there are functions for 
	adding and removing autowall cells and the resulting room data can be saved out
	using the function "ea_save()" and then loaded back in at any time using the
	"ea_load()" function!!!

	Hopefully this asset will provide you with the exact tools you need to get the 
	job done for your game, and if you publish anything that uses this asset, please
	contact me at "info@nocturnegames.com", as I love to see what people do with 
	the assets I make!!!

	Finally, if you like this asset, please don't forget to rate and comment!

	All the best!

	Mark Alexander
	(Nocturne Games)

	----------------------------------------------------------------------------- */


