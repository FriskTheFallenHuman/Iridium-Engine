------------------------------
KMQuake2 v0.20 with update 7

Readme.txt
------------------------------
Enhanced Quake2 OpenGL-only engine with integrated Lazarus support
(kmquake2.exe & kmq2gamex86.dll && kmquake2.pk3)

	By Knightmare (knightmare66@yahoo.com)

Other code by:

	Aaron Reeves
	Anthony Jacques
	Backslash
	Barnes
	Berserk
	Berserker
	Bitshifter
	BramBo
	CDawg
	David M. Pochron
	Discoloda
	DarkOne
	Dopefish
	Dukey
	Echon
	Frank Sapone
	Fuh
	Harven
	Heffo
	Idle
	Jalisko
	Jay Dolan
	Jitspoe
	MH
	MrG
	NeVo
	Nexus
	NiceAss
	Nicolas
	Odium
	Pat Aftermoon
	Pooy
	Psycospaz
	QuDos
	Scarface
	Serge
	[SkulleR]
	Spike
	Steve Yeager
	Tomaz
	Vic
	VoiD
	And anyone else I forgot...

Menu dogtags, HUD numbers, and F1 coomputer icon by Pieter Verhoeven

Menu screen by MDK

Load screen by Christopher "Sherpa" Owen

Weapon glow skins in kmquake2_extras.pk3 by Odium and Kman

Uses Zlib compression library, (c) 1995-2002 Jean-loup Gailly and Mark Adler

------------------------------
Key Features
------------------------------
- Eliminates the limit of 256 each on models, sounds, and images- no more index: overflow errors!
- No more SZ_Getspace: overflow errors
- Supports up to 8000 entities per map, up to 2000 in view at once
- Supports maps with large coordinate ranges, maximum of +/-16384
- Supports maps compiled with large chop values, up to 1024
- Supports server-side player speed control for class-based mods, etc.
- Supports server-side control of entity transparency
- Supports server-side control of looped sound attenuation
- Includes default Lazarus DLL with ACE bots, CTF and 3Team CTF support
- Uses modified Quake2maX particle effects
- Improved menus and console (uses some code from Quake2maX)
- Streamlined, more memory-efficent adaptation of decal system from Quake2maX
- TGA, PNG, and JPG texture, skin, and pic autoloading
- Autoscaling of hi-res replacement textures
- Support for MD3 models
- *.pak and pk3 support
- Ogg Vorbis soundtrack support
- RoQ support
- Alpha test surface support for easy rendering of textures with holes/cut-outs
- Trans33 and Trans66 flag combining for textures with alpha-channel controlled transparency
- Supports rendering transparent surfaces with lightmaps
- Supports moving and animated transparent surfaces
- Integrated support for Lazarus footstep sounds

------------------------------
How To Run
------------------------------
	Unzip into your Quake2 dir and make a shortcut with path

	x\quake2\kmquake2.exe +set game gamedir (for singleplayer, LAN games, and net client use)

	where X is your Quake2 dir's parent dir (for example, C: or D:\games), and gamedir
	is the game subdirectory (if any) where the mod you want to run is.  NOTE: for the
	mod's code to run, it must be compiled into a kmq2gamex86.dll (see end of file for
	instructions).

	If you want to enable the playing of cinematics off the game or mission pack CD, add

	+set scanforcd 1

	to the command line.  This is disabled by default.

	An OpenGL-compatible 3D accelerator (GeForce2 GTS 64 MB or better, 3Dfx cards are NOT supported),
	P6 or Athlon 800MHz+, and at least 256MB of RAM are required.

	If it crashes on startup, make sure that kmq2gamex86.dll is in the baseq2 subdir.

	If you experience lockups on an ATI video card, set entity shell type to solid or flowing
	in the advanced section of the video menu.  The envmap effect may be causing the lockups.

	If performance is too slow, or there are no visible or all black textures, type
	"exec lowend.cfg; vid_restart" in the console.  If you still get all-black
	textures, remove all config files from the game directory you are running in and restart.
	This will make KMQ2 fall back on the internal cvar defaults.

	It is strongly recommened that you copy the idlog.cin file from the Quake2 CD to your
	baseq2/video folder.  This will allow you to always open the menu before any demos start playing.
	
	To hear Ogg Vorbis tracks ingame, rip the Q2 CD's audio tracks (2-11) to track02-track11.ogg
	and put them in baseq2/music.  For the mission pack audio tracks, rip the Ground Zero CD's
	audio tracks (2-11) to track12-track21.ogg.  Don't bother ripping the tracks from the
	Reckoning CD, as they're a mix of the tracks on the Q2 and Ground Zero CDs.  Everything else
	will be taken care of internally by KMQuake2.
	
------------------------------------
Changes as of v0.20 update 7:
------------------------------------

- Added HTTP download support from R1Q2.  Uses cvars cl_http_proxy, cl_http_filelists, cl_http_downloads,
	and cl_http_max_connections.

- Decoupled video framerate from network framerate.  This should allow higher framerates as well
	as better network performance.  The old, synchronous mode can be re-enabled by setting the cvar
	cl_async to 0.  The new cvars are r_maxfps (default 125) for maximum rendering framerate, and
	net_maxfps (default 60) for maximum packet rate.  Synchronous mode still uses the cl_maxfps cvar.
	
- Added .loc file support.  Loads .loc files (locs/<mapname>.loc) from the current mod dir and baseq2.
	Both 1/8th precision integer and floating-point formats are supported.  Here are the supported commands and cvars:
		loc_add <name>	- Adds a location point at this position with the given name.
		loc_del			- Deletes location point at this position.
		loc_save		- Saves locations for this map.
		cl_drawlocs		- Set to 1 to enable drawing of location points.
		loc_here		- The location you're at, e.g. say_team $loc_here.
		loc_there		- What you're aiming at, e.g. say_team $loc_there.

- Fixed cl_servertrick and allow_download cvars being forced to 0 when starting a single-player game.
  Cl_servertrick is now saved to config.
  
- Capped connect message size to 1200 bytes in multiplayer to fix problems with clients geting hung up on connect.
	This can be changed with the cvar sv_baselines_maxlen.  Acceptable values are from 400 to 1400.
	
- Multiplayer network messages are now limited to 2800 bytes (does not apply to local client on a listen server).
	This can be disabled by setting the cvar sv_limit_msglen to 0.  Doing so is only recommended for LAN games.
  
- Fixed imbalance in mouse pitch and yaw sensitivity in widescreen video modes with autosensitivity enabled.

- Fixed overloaded playerskins configstrings on some servers causing the client to get stuck trying to download
	non-existant skins.

- Fixed save path being set to Quake2 root instead of baseq2 when gamedir is set to a blank string.

- Fixed crash on map load with long map names.

- Fixed undersized viewport and corrupt screenshots at 1366x768 resolution.

- Gamma ramping now switches off and the desktop resolution is restored when alt-tabbing out of the game.
	The cvar win_alttab_restore_desktop can be set to 0 to disable restoring the desktop resolution.

- Added 5K (5120x2880) and 3440x1440 video modes.

- Added custom width and height fields to video menu.

- Added support for PNG textures/images.

- Added option for PNG screenshots (r_screenshot_format, jpg, png, or tga).

- Added format-specific screenshot commands (screenshot_tga, screenshot_jpg, screenshot_png).

- Added basegame and basegame2 cvars to load data from other mods.

- Added option for new Q3-style console background (cvar con_newconback).

- Added download speed counter by Frank Sapone.

- Changed savegame format for included Lazarus DLL.  Savegames will now work cross-version as long as
	no changes to data structures (edict_t, etc) are made.

------------------------------------
Changes as of v0.20 update 6:
------------------------------------

- Added writeconfig command.  Usage:
	writeconfig <configname>
	Using no parameter will write kmq2config.cfg.

- Added 3200x1800, 3840x2160, and 3840x2400 video modes.

- Inventory and help computer/scoreboard are now always scaled up from 640x480, instead of sizing based
	on status bar scale.
	
- Added support for high-res menu graphics.

- Added 3D cursor to main menu.

- Added higher-res 128x128 HUD icons.

- Added impact decals for the BFG and disruptor.

- Optimized load times with filename hashing.

- Added simplified load screen.  The original load screen can be re-enabled in the interface menu.

- Fixed savegames in baseq2 being visible in the save and load menus when running with a different game dir.

- Increased MAX_OSPATH to 256 characters.  This should improve compatibility when
  Quake2 is installed under C:\Program Files.

- Fixed lag/stutter on opening save and load game menus.

- Fixed tag mode not working when set from the start server menu.

- Added option to display 4-digit numbers on the default HUD.  This can be changed with the
	status bar digit squeezing option in the screen options menu.

- Saveshots are now sized to the nearest power of two for each dimension, so a game saved at 1024x768 will
	have a 1024x512 saveshot.
	
- Tweaked cvar defaults for bloom effect to be more subtle.

------------------------------------
Changes as of v0.20 update 5:
------------------------------------

- Added an option to the video menu to enable or disable non-power-of-2 mipmapped textures.  Some video drivers
  don't properly support NPOT textures and will screw up the mipmaps for these textures.

- Changed crosshair scaling to be derived from a fixed size, preventing the first 3 crosshairs
	from ever being misaligned.

- Added better error handling for model scripts.

- Now prevents certain files that shouldn't be in paks/pk3s from loading
	(.cfg files, saves, screenshots, etc).
  
- Fixed a crash that can happen when no hardware acceleration is found.

- Fixed graphical corruption that could occur from certain errors during map loads.

- Improved the performance of dynamic lights in multitexture mode by batching lightmap updates and using
  a more efficent format for lightmaps.   Requires OpenGL 1.2 for the new lightmap format to enable.
  Set the cvar r_newlightmapformat to 0 if you happen to get fullbright lightmaps from this change.

------------------------------------
Changes as of v0.20 update 4:
------------------------------------
- Fixed the missing audio in the intermission cinematics.

- Fixed texture names with backslashes not loading from inside pak files.

- Fixed memory leak in JPEG loading code.

- Added multitexture rendering optimizations.

------------------------------------
Changes as of v0.20 update 3:
------------------------------------
- Fixed a potential crash with blood effects in certain situations.

- Fixed shadow volume errors with certain models.

------------------------------------
Changes as of v0.20 update 2:
------------------------------------
- Fixed problem with surround video modes (multi-monitor).  The FOV adjustment
	algorithm has been changed so that it no longer breaks in such extremely wide modes.
	
- Fixed misalignment with crosshairs 1-3.

- Fixed an issue that was introduced with the release of nVida's 191.xx drivers.  The OpenGL
	extension string in these drivers is longer than the text output buffer, causing a crash.

- Fixed round-off error that was limiting the accuracy of the crosshair.
	
- Fixed disappearing textures on bmodels with mixed standard and warp faces
	(e.g. the moving pillar by the laser array in city3).
	
- Fixed camera glitch with thirdperson mode and demos.  As the original demos in baseq2/pak0.pak don't show
	the correct player model, this is disabled by default.  Use the cvar cg_thirdperson_indemo to enable this.
	
------------------------------------
Changes as of v0.20 beta3:
------------------------------------
- Added QuDos' item bobbing.  This can be enabled in the effects section of the options menu.

- Added Ogg vorbis commands based on the Linux port Of KMQ2 0.19 by QuDos.
	The commands are:
	ogg	play <filename>		Plays a given .ogg file
	ogg	pause				Pauses playback
	ogg	resume				Resumes playback
	ogg	stop				Stops playback
	ogg	status				Outputs file playing and position
	ogg	list				Lists available .ogg files
		
- Added support for 1280x720, 1280x768, 1440x900, 1920x1080, and 2560x1600 widescreen modes.

- Removed oddball 1024x480 mode.

- Tweaked FOV autoscaling code.  It was previously making the FOV too wide.

- Tweaked FPS counter code for better accuracy with framerates over 100 fps.

- Cinematics are now displayed in anamorphic form.

- Textures are now displayed at their native resolution on video cards that support the
	GL_ARB_texture_non_power_of_two extension.  This greatly improves the appearance of most monster
	and item models, as well as the display of text in intermission cinematics.
	Set r_arb_texturenonpoweroftwo to 0 if this causes crashes on your system (likely due to a buggy driver).
	
- Fixed dark corners on most warp surfaces when vertex lighting is enabled.
	
- Added support for the type field in Quake3-style .arena files.  The start server menu's maplist
	is filtered by the currently selected gametype.  Here are the valid type tokens:
	Deathmatch:		dm teamdm ffa team
	Cooperative:	coop
	CTF:			ctf
	3Team CTF:		3tctf

- Console font size is now resolution-independent.  Default size is 8 pixels scaled up from
	640x480 resolution.

- Added support for widescreen-aspect levelshots, named levelshots/<mapname>_widescreen.jpg.
	The image size should still be a power of 2, e.g. 512x512.
		
- Changed network protocol version to 56 to avoid conflicts with R1Q2.

- Added autodownloading of pk3 files containing maps.  Both the client and
	sever must be running this version for it to work.
	
- Added silent screenshot command (screenshot_silent).

- Renamed cl_3dcam* cvars to cg_thirdperson*.

------------------------------------
Changes as of v0.20 beta2:
------------------------------------
- Added support for the game DLL to set the attentuaion of looped sounds.  Support has been
	added to both the Lazarus and integrated missionpack DLLs for mappers to override the
	attenuation for any bmodel entity, as well as target_speaker.  Func_train, func_tracktrain, and
	func_vehicle now default to idle attenuation.  This changes the protocol and game DLL
	interface again, so DLLs from the last beta will no longer work.

- Added support for lightmaps on trans surfaces.  Set transparent lighting to lightmap in the advanced
	video menu to enable this.
	
- Added GL_ARB_fragment_program water warping.  This replaces the GL_NV_texture_shader effect on
	cards that support it.
	
- Added optional fragment program warping to caustics.  To enable, set underwater caustics to
	hardware warp in the advanced video menu.
	
- Added support for camera effect and letterbox screen modes.  These effects can be enabled by
	setting the RDF_CAMERAEFFECT and RDF_LETTERBOX bits in a client's refdef flags in the game DLL.

- Reorganized the ingame section of the options menu into screen and effects sections.

- Added option for old-style explosion effects in the effects section of the options menu.

- Reduced default intensity of light blooms.

- Added cvar toggling (toggle <cvarname>).

- Changed r_speeds output to show the actual number of brush polygons drawn, in addition to the number
	of surfaces.

- Changed savegame slot names to better cohabitate with other engines.

- Added Jalisko's fix for black lines appearing when light blooms are enabled at 1280x1024 resolution.

------------------------------------
Changes as of v0.20 beta1:
------------------------------------
- Increased max coordinate range.  Note that this breaks all existing game DLLs and demos.
	Be sure to download updated game DLLs that are compatible with this version.
	Clients and servers will have to upgrade to maintain compatibility.

- Greatly improved md3 support.  Md3's render faster, are frustum-culled, and are properly
	vertex-lit.  Per-mesh, per-skin rendering scripts are also added (see md3_scripting.txt).

- Overall optimizations to rendering.

- Added support for two-sided stenciling (GL_EXT_stencil_two_side or GL_ATI_separate_stencil)
	for a performance boost to projection shadows.
	This is disabled by default due to rendering artifacts with some models, but can be enabled
	in the advanced video menu.

- Added support for alpha test surfaces (textures with holes, bypassing the problems of
	TRANS33+TRANS66 rendering).
	This can be enabled on a texture with an alpha channel (TGA's) or color 255 (pink) areas
	(.wals) by setting the 0x02000000 surface flag in the surface inspector (only QERadiant 1.47
	seems to show this flag).
	Use KMQBSP3 1.13 or higher to compile maps with these surfaces.

- Added support for static glow textures.  For example, texturedir/mytexture_glow will be drawn
	as a glow over texturedir/mytexture if it can be found.  This is similar to the glows supported
	in DarkPlaces.  These are rendered without a second pass on quad-texturing or higher cards, so
	there should be no fps hit.
	
- Added improved version of Barnes's underwater caustics and view warping.

- Added fov auto-adjustment for widescreen modes.  This feature can be toggled in the video menu.
	
- Improved scaling system for menus.

- Added support for Quake3-style .arena files for multiplayer maps.  Maps that have an arena file
	(e.g. scripts/mapname.arena for mapname.bsp) will be added to the maplist in the start server
	menu.  Currently only the map and longname fields are used.

- Added modified version of debug/dedicated console from Quake2Evolved.

- Renamed all gl_* renderer cvars to r_*.

- Removed support for ancient, decrepit SGIS multitexture.

- Fixed particle overdraw option so it only redraws on top of alpha surfaces.

- Now supports streaming Ogg Vorbis files from inside pak/pk3 files.

- Added saveshots to quicksaves (savegames named "quick" or "quik").

------------------------------
Changes as of v0.19:
------------------------------
- Integrated renderer into exe.  Ref_kmgl.dll is no longer needed.

- Added support for custom resolutions.  Uses cvars r_customwidth and r_customheight when gl_mode
	is set to -1.

- Added projection entity shadows.  This is selectable from the advanced section of the video menu.

- Added Jalisko's light blooms.  This is selectable from the advanced section of the video menu.

- Added support for Ogg Vorbis music.

- Added support for Quake3's RoQ format cinematics.

- Added support for 1024x1024 skyboxes.

- Anisotropic filtering now works properly and video menu allows selection from modes supported
	by the video card.

- Changed texture quality filter.  Low caps texture resolution at 128x128, medium at 256x256,
	high at 512x512, and highest has no cap.

- Reset defaults option in the menus now loads cvar defaults for all settings in that menu.

- Added support for custom door, plat, and button sounds.  See kmquake2_lazarus.txt.

- Fixed looped sound sourcing bug with bmodel entities (func_door, func_plat, etc).

- Added Jitspoe's Fix for sliding bug where steep sloped surfaces meet floors.

- Added cvar cl_rail_length to control length of rail trails for performance purposes.
	Defaults to 2048.  Rail trails are now drawn starting from the point closest to the player.

- Added changegame command to change game dirs while preserving key binds in cfg files.  Usage:

	changegame <gamedir>

	Use this instead of game <gamedir>.

- Scanning for the game CD (for cinematics) is now disabled by default.  This scan can take too long
	on some systems with network drives mapped.  To enable it, add

	+set scanforcd 1

	to the command line.

- Fixed crash on exiting biggun map.

------------------------------
Changes as of v0.18:
------------------------------
- Added pk3 support from Quake2Evolved.

- Added improved version of decal system from Quake2Max.

- Added new default font based on one from Jitspoe's Digital Paint Paintball 2.0.

- Added enhanced player setup display from Quake2Max.

- Made crosshair display in ingame menu clickable.

- Added levelshots to start server menu.

- Load game menu now shows levelshots for autosaves.

- Added option for hi-res saveshots to advanced video menu.

- Added option for model shading (off, low, high) to advanced video menu.
	Also, dynamic lights now light models by the vertices.

- Added option for flowing shell effect to advanced video menu.

- Now opens menu when disconnected.

- Revamped load screens.

- Blaster puffs now bounce off walls and brush models.

- Added support for JPG skies and 512x512 rotating skies.

- Added support for JPG and TGA endscreens.  Requires the presence of a PCX file with the same
	filename.  E.g. pics/victory.jpg and pics/victory.pcx
	The PCX file should be in the Q2 palette and no larger than 256x256.
	The 24-bit image can be very high res- up to 1024x1024.

- Fixed command buffer overflow vulnerability.

- Fixed crash with ACE bot print commands.

- Now includes the Lazarus essential data in the pak file.

- Renamed Lazarus "id" command to "entid" to fix conflict with ctf "id" command.

- Added new surface flag for trans and warp surfaces- 0x01000000, specifies no
	lightmap or glass envmap for that surface.  Useful for volumetric light effects.

------------------------------
Changes as of v0.16a:
------------------------------
- Fixed network error handling.

- Added server ping to join server menu.

- Fixed minor bug with sliders being affected by opening options submenus with mouse.

------------------------------
Changes as of v0.16:
------------------------------
- Added Harven's support for .md3 models.  Tested with alias scripted model_spawns, and works great.
	Will also replace .md2 models with identically named .md3s.  Tags are not yet supported.

- Added ACE bots to the included Lazarus DLL.  See kmquake2_lazarus.txt for more info.

- Added 3Team CTF support to the integrated Lazarus DLL.  CTF and 3Team CTF modes are now
	selectable from the start server menu.  See kmquake2_lazarus.txt for more info.

- Removed obsolete 8-bit texture paletting and point paramenter code.

- Fixed surface-specific footstep sounds for other players.

- Added Pooy and DarkOne's CPU usage fix.

- Added Backslash's support for mouse buttons 4 and 5 on newer MS mice.

- Added icon and close button in windowed mode.

- Added new HUD icons for both official mission packs, CTF, and Lazarus.

- Now supports maps with large chop sizes (up to 1024), for lower r_speeds in large outdoor areas.

- Added overbright bits on models.

- Added screenshots to load game menu.

- Added support for up to 100 crosshairs, selectable from ingame section of options menu.
	Now includes some additional crosshairs from Quake2Evolved, in addition to the ones
	by me and Psychospaz.

- Added new blood effect types, selectable from ingame section of options menu.

- Added option to scale complexity of particle effects to ingame section of options menu.

- Fixed dynamic light effects on bmodels and bmodel alpha surfaces.

- Added mouse sensitivity scaling for reduced FOV.

- Fixed missing textures on TNT/TNT2 cards.

- Texture filter now defaults to bilinear.  This should fix some compatibility problems.

- Integrated the Lazarus "texture" and "surf" commands into the client.  They are available
	in singleplayer mode when the cvar "developer" is set to 1.

- Added light glows to blaster puffs and bullet impacts.

- Fixed crash when starting up without kmquake2.pak.

- Fixed crash on fact2 when running with the included Lazarus DLL.


------------------------------
Changes as of v0.15:
------------------------------
- Now prevents demos from changing the current game dir.  To change the game dir, type disconnect,
	hit enter, then type game <gamename> (without brackets) and hit enter.  If you changed the
	game cvar first, disconnect and then hit ESCAPE.

- Added support for transparent HUD.

- Now uses a compatible build of the Lazarus mod (www.planetquake.com/lazarus).  See the included
	kmquake2_lazarus.txt for more info.  This DLL supplants the vanilla Q2 and CTF ones, as
	it does everyting they do and then some.  The source code of these old DLLs is included in the
	source archive.  Compiled binaries are available upon request (email me).

- Will now load footstep surface defintions from a file called texsurfs.txt.  Can be disabled
	in the ingame section of the options menu.

- Now inlcudes the footstep sounds and barrel gib models from Lazarus.

- Added server-side speed control.  Very useful for class-based and other mods.  See the new player
	state members in q_shared.h.

- Added ListPak, LoadFile, and FreeFile game import functions, allowing mods to easily load files,
	even from inside pak files.

- Added engine support for a +attack2 key, bindable with +use through the customize
	controls menu.

- Added Psychospaz's map loading screen with mapshots by me, and a default background pic
	by Christopher "Sherpa" Owen.

- Added splash screen on startup.  Uses code from TomazQuake.

- Added support for scaled console text and HUD.  Includes odium's new icons from Quake2Evolved.

- Added Pooy's pak0-pak99 support.

- Added CDawg's support for stereo sound samples.

- Added Psychospaz's fix for trans surface rendering, trans bmodels can now move and rotate.

- Added support for animated textures on trans surfaces.

- Increased max .cfg file size to 32KB, was 8KB.

- Now loads kmq2gamex86.dll instead of gamex86.dll.  This allows for better cohabitation,
	since it will no longer try to load a standard DLL (and then crash).

- Changed screenshot filenames to kmquake2_###.*, supporting up to 1000 screenshots.

- Added command auto-completion (hit TAB to auto-complete).

- Added cvar defaults.

- (New discovery) Will load credits from a file named "credits" (no extension) in the current
	game dir or in the root of a pak file. You can use text formatting codes in this file.

- Added the colored text support from Quake2Max.  The color of secondary text can be changed
	from the interface section of the options menu.  In addition, warnings are displayed
	in yellow and errors in red.  Here are the formatting codes ripped directly from the
	Quake2Max readme:

--------------------------------
Text Formatting -- Instructions
--------------------------------
Sort of like Quake3, if you type out ^ with a character following
you can set up colors and stuff for the rest of the string. Here
are the codes (colors are Q3 format colors):

^1: color red
^2: color green
^3: color yellow
^4: color blue
^5: color teal
^6: color purple
^7: color white
^8: color black
^9: color orange
^0: color grey
^a: specified by alt_text_color cvar

^s: toggle shadow
^i: toggle italic
^b: toggle bold
^r: set to default (normally: white, no shadow, no italic, no bold)

^^: just a plain ^ character

example: ^1p^7sychospaz^r
(this would be psychospaz with a red "p", followed by a white "ychospaz",
and finally a reset so following text would be normal)

*note: Quake2 has a 16 character limit on names per mod. You'll have to
	make a new mod to extend the limit.
--------------------------------

- Added scaled menus from Quake2Max.  This can be disabled from the interface section of the
	options menu.

- Added the mouse support in menus from Quake2Max.  Uses cursor graphics from Quake2Max 0.30.

- Fixed bug where the plasma beam and grapple were drawn from the viewpoint instead of from player
	model in chasecam mode.

- Added red blaster particle effects- TE_REDBLASTER temp event, EF_BLASTER|EF_IONRIPPER overload for
	red blaster, EF_HYPERBLASTER|EF_IONRIPPER overload for red hyperblaster.  Also changed
	hyperblaster bolt effect, the bolts are now all particles and look much better.

- The current player weapon model is now shown in the player config menu.  If there is none,
	it defaults to that PPM's default weapon model.

- Fixed bug where the player config menu couldn't find any valid player models when there was a patched
	player model in the current mod dir (used by Lazarus to add skin references for misc_actor).

- Removed MP3 support to comply with the GPL now that Frauenhofer is charging royalties for commercial
	MP3 decoders.

- Added advanced video options menu, using code from Quake2Max.  You can now adjust or disable most
	of the newer graphical features from this menu.

- Added Vic's overbright rendering, which greatly improves the display of 24-bit textures.
	Set gl_modulate and intensity to 1 for best results.

- Lightmaps are now drawn on trans and warp surfaces.  Set gl_trans_lightmaps to 0 to disable
	this if some surfaces seem too dark.

- Added Psychospaz's spheremapping on non-warp trans surfces and color shells.
	Set gl_spheremaps and gl_window_spheremaps to 0 to disable.

- The player options menu will now automatically find .tga and .jpg skins that don't have .pcx
	counterparts, and will also now show the default weapon model for each player model that
	has one.

- Added Psychospaz's chasecam.  Use the cl_3dcam cvar or the controls section
	of the options menu to enable.  You can enable the cl_3dcam_alpha cvar to make the
	player model transparent when the camera viewpoint moves in close (when backed up
	against	a wall, etc).  Includes Vic's fix for male/grunt flicker after map load.

- Added Psychospaz's fading centerprints and HUD notify.

- Now saves config data to a separate file named kmq2config.cfg to better cohabitate
	with other engine mods.  If this config file does not exist, it will read the
	config data from config.cfg.  Previously, the vid_ref cvar being forced to "kmgl"
	would crash other engines when they attempted to execute a config.cfg used by 
	this engine.

- Added 1280x1024, 1400x1050, and 1024x480 video modes.

- Changed r_speeds so that it no longer floods the console.  Instead, it
	outputs to the lower right of the screen.

- Added Psychospaz's dynamic shadows.  Set gl_shadows to 2 to enable.

- Added proportioned shadows for trans ents: the opacity of the shadow is proportional
	to the opacity of the entity casting it.

- Beams no longer cast shadows.

- The GeForce3 water warp effect can now be disabled by setting gl_pixel_shader_warp to 0.

- Added r_waterwave cvar, which when set to a nonzero value sets the amplitude of Half-Life
	style choppy water.

- Added Psychospaz's variable sized crosshair to the options menu, and support for up to 8
	different crosshairs.  Included are 3 of mine and 5 of Psychospaz's.

- Changed a few cvar defaults.  Gl_texsize now defaults to 1024, and is decreased as necessary
	on startup for compatibility.  R_skydistance defaults to 4600, and gl_lightcutoff
	defaults to 0.  Also, shadows are now always rendered with stencil-buffering if the
	vid card supports that.

- Changed cvarlist so that it now works with wildcards and shows flags and the latched value.
	Also, typing the name of the cvar shows both the current value and the latched value.

- Added support for the s.alpha entity state member.  This allows mod makers to specify
	an entity's transparency server-side, with any float value between 0 and 1.
	To make entities fade, set their alpha to 1 and then decrement it by small amounts.

- Added gunskin, gunindex2, gunframe2, and gunskin2 player state fields and support
	for a second weapon model, as well as changing the weapon model skin in the game dll.
	Be sure to update your mod(s) with the new q_shared.h to support this change.

- Is now compatible with all version 34 demos.  Previously, stray bits set in the flags
	for entity deltas could foul things up, but those bits are now ignored when a
	version 34 demo is playing.

- Added client protocol compatibility option to the join server menu, which can be set to
	make the client lie about its version number to the server (34 instead of 35), thus
	allowing pinging and joining version 34 servers (most existing Quake2 servers
	using the stock engine) from the join server menu.

- Added option to download options menu to auto-download 24-bit textures (JPG and TGA).

- Non-dedicated server no longer bombs out with WSAECONNRESET error when a client crashes
	or quits without disconnecting first.

- Fixed bug where player footsteps would crash a non-local client.  This was caused by using
	a server-side trace to get the flags of the surface the player is walking on.  This
	has been replaced by a modified client-side trace.

- Fixed exploitable bug in TGA and JPEG loading code where setting the player skin to the
	name of a reserved system device woud bomb out the client.  Malicious players whose
	clients don't have the TGA and JPEG loading code were exploiting this to kick other
	players off servers.

- Added the hardware gamma control from Vic's l33t engine, which I believe was taken from
	MrG's BeefQuake.

- The gl_modulate cvar now has a dynamic effect, you no longer need to do vid_restart.

- The temp event TE_BLUEHYPEBLASTER now works properly, generating a blue splash, while
	TE_FLECHETTE now generates a lighter blue splash.

- Added gl_drawbbox cvar, which when set to 1 draws a bounding box around all models.

- Added Nicolas' fix for odd-colored lines at the top and bottom of cinematics.

- Added NET_SERVER_BUILD preprocessor option in game/q_shared.h.  Enable this to compile an
	executable suitable for hosting games over the internet.

- Increased MAX_STATS to 256.  Be sure to update your mod(s) with the new q_shared.h
	to support this change.

------------------------------
Changes as of v0.04:
------------------------------
- Decreased MAX_EDICTS to 8192, and MAX_PARTICLES to 8192, saving lots of memory.
	Be sure to update your mod(s) to support this change-MAX_EDICTS in q_shared.h
	and maxentities in g_save.c should both be changed to 8192

- Changed login and logout sounds to same as player teleport (makes more sense).

- Fixed security issue with rcon_password.

- Added David M. Pochron's gl_lightcutoff cvar- set to 0 for smoother light falloff, default 64.

- Added Psychospaz's con_alpha cvar to control console alpha, also in options.
	(default 0.5)

- Added Psychospaz's gl_shellstencil cvar for stencil buffering color shells.

- Added Psychospaz's enhanced particle system, making this now an OpenGL-only engine;
	It will automatically load ref_kmgl.dll on startup
	(to disable, comment out #define ENHANCED_PARTICLES line in q_shared.h, and 
	recompile both the exe and ref_kmgl.dll)

------------------------------
Changes as of v0.03:
------------------------------
- Added GuyP's gl_showtris fix (now works without having to disable mulitexturing)

- Added JPEG (.jpg) image support, also JPEG screenshots (use cvar gl_screenshot_jpeg)
	Use gl_screenshot_jpeg_quality to control quality (1-100, worst-best)
	Uses libjpeg library, source for which is available from http://www.ijg.org

- Added Nexus's improved high-res texture replacement support (replace old .wal textures
	with higher-res .tga or .jpg images, scales them down to fit in proper alignment
	(use gl_texsize cvar to set max tex size, default 256)

- Added NEW_ENTITY_STATE_MEMBERS define in q_shared.h that allows compiling of exe's
	that are compatible with modified Eraser bot builds.  Comment it out to enable
	comaptibility.

------------------------------
Changes as of v0.02:
------------------------------
- Added support for modelindex5, 6, 7, and 8 (see game/q_shared.h)

- Implemented client-side Lazarus footstep sounds (see client/cl_fx.c and game/p_view.c)

- Added Nexus's and Serge's support for hi-res (up to 1024x1024) console pics

- Added David M. Pochron's 44 and 48 KHz sound support

- Added Heffo's rudimentary MP3 playback (22KHz mono only)

------------------------------
Changes as of v0.01:
------------------------------
- Removed limits that caused *Index: overflow:

	* Increased Max_models and Max_sounds to 8192 each

	* Increased Max_images to 2048

- Increased entity limit:

	* Increased Max_edicts to 16384

- Effectively removed probability of SZ_Getspace: overflow errors:

	* Increased max net message size to 44800 bytes

- Increased ammout of things that can be displayed on screen:

	* Increased Max_particles to 65536

	* Increased max visible entities to 2048

- Kept compatibility with existing demos

- Added MZ_BLUEBLASTER and MZ_GREENHYPERBLASTER muzzle flashes.

- Added EF_BLUEBLASTER effect: generated by using both EF_BLASTER and
	EF_BLUEHYPERBLASTER effects flags.

- Added EF_FLAG3 effect: generated by setting both EF_FLAG1 and EF_FLAG2;
	this is useful for 3-Team CTF.

- Doesn't overwrite existing quake2.exe or ref_gl.dll
	(select KMQuake2 OpenGL from video menu)

- MrG's enhanced shadows (gl_shadows 2), 32-bit texture, skin and HUD pic support,
	default to trilinear filtering, and GeForce3 water warp.

- BramBo's FPS counter (set cl_drawfps to 1 to enable).

- David M. Pochron's variable sized skybox (get rid of world disappearing into sky)-
	use "r_skydistance" cvar to set maximum visable distance

- Aaron Reeves's shadowless explosions

- VoiD's *.pak support


=====================================================================================

			MOD SUPPORT INSTRUCTIONS

=====================================================================================
To compile your mod for this modified engine, use the included game/q_shared.h
and game/game.h from the source release (Or you can just search for all my changes,
which are marked with my name, if you don't want to use GPLed headers.  Just don't
forget to include the #ifdef compiler directives around my changes).

Next, in g_save.c, change the assignment of the "maxentities" cvar from this:

maxentities = gi.cvar ("maxentities", "1024", CVAR_LATCH);

to this:

maxentities = gi.cvar ("maxentities", va("%i",MAX_EDICTS), CVAR_LATCH);

Then, change all references to modelindex 255 to MAX_MODELS-1 (for most mods,
p_client.c, p_view.c, and p_weapon.c are the only files that need changes).

Before compiling, make sure that this line in q_shared.h is uncommented:

#define	KMQUAKE2_ENGINE_MOD

You can revert your mod to compatibility with other engines by commenting out this line.

Finally, after compiling, rename the resulting gamex86.dll to kmq2gamex86.dll so
that the new engine will load it (don't overwrite your existing game DLL!).

=====================================================================================

If you downloaded this engine mod without source code, the complete source is
available at www.markshan.com/knightmare

=====================================================================================

Copyright (C) 1997-2001 Id Software, Inc.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.