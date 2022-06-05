# AutoRotation

In World of Warcraft it's all about button mashing.  The faster, the better.  I wanted to be able to bring to WoW what I had made for Diablo II, an automated clicker to release me mentally from the repitition of combat.

This isn't a bot, so it won't be as efficient, but it's pretty darn close.  And I don't think it will get you banned, bc it's not doing anything other than mashing your keys.  Most of the magic here is how to setup your game so it works.

## How It Works

The AHK script is going to press buttons F7 thru F12 multiple times a second.  It's going to press them in that order -- F7, F8, F9, F10, F11, F12 -- over and over and over indefinitly.

You can bind spells to those F keys, in any order you want.  Normally, pressing keys randomly would cause all sorts of error messages and failure sounds, it would be a mess.

The trick is to change your game to make these keypresses unnoticable to you, so there are no error messages, no spell fizzle sounds, no auto-targeting of mobs, nothing unusual.

Moreover, there is a trick -- at least in WOTLK, which is what I play -- that allows you to build macros that pick the priorty skill every time it's available.

The end result is fully automated rotation casts from your character.

## Setting It Up

This is a multi-step process:

- Install [AutoHotKey](http://autohotkey.com/)
- Download this [zipfile](https://github.com/whipowill/ahk-autorotation/archive/master.zip)
- Install the sound files
	- This will silence all fizzle spell sounds
- Disable error speech in sound settings
- Modify your keybinds
	- Set F1-12 as secondary binds for action buttons 1-12
- Add the ``AutoAttack`` macro

```
/run UIErrorsFrame:Hide()
/stopmacro [noharm] [harm, dead]
/startattack
```

- Place your spells in the right order

This is where the magic happens.  You want to place your spells on keys 7-12 on the action bar, with 7 being the highest priority and 12 being the lowest priority.  The ``AutoAttack`` macro you made has to be one of them, and probably belongs in spot 12.  Keys 1-6 aren't used by the script.

- Run the AHK script
- Press shift + mouse button 2 (on the side) to activate/deactivate the script
	- A small blue square will appear in the top left corner of the screen, letting you know it's on
- Target a mob, see what happens

## Taking It To The Next Level

Now that you have AHK setup and working, you can spend time crafting advanced macros to put in your auto-click slots on your action bar.  For most characters, you'll have 3 -- maybe 4 -- macros:

- ``AutoTarget`` - optional, will auto-target next enemy when your current target dies
- ``Timed`` - for casting your timed, cooldown skills
- ``Untimed`` - for casting your untimed, spammable skills
- ``AutoAttack`` - for keeping yourself always attacking the enemy

The ``AutoTarget`` macro I'm using looks like this:
```
/stopmacro [mounted]
/targetenemy [noexists] [dead]
```

An example ``Timed`` macro looks like this:
```
#showtooltip
/stopmacro [noharm] [harm, dead]
/castsequence reset=0 0,0,0,Exorcism
/castsequence reset=0 0,0,Crusader Strike
/castsequence reset=0 0,Divine Storm
/castsequence reset=0 Judgement of Wisdom
```

This ``castsequence`` trick is key as it allows you to trick the game into always casting that ability when it's available.  Blizzard went to great lengths to prevent automation in macros over the years, and in WOTLK this is one that slipped their notice.  I learned about this technique on a pserver forum [post](https://forum.warmane.com/showthread.php?t=382668&page=4).

An example ``Untimed`` macro looks like this:
```
#showtooltip
/stopmacro [noharm] [harm, dead]
/cast [mod:alt] Cleave
/castsequence [nomod] reset=target Hamstring, Rend, Heroic Strike, Sunder Armor, Heroic Strike, Sunder Armor, Heroic Strike, Sunder Armor
```

Notice that this example uses the ``mod:alt`` modifier.  This AHK script lets you click mouse button 2 (on the side) to toggle ``alt`` being held down, until you click that mouse button again.  I use this for Warriors in multi-mob situations, and Rogues on facing-the-back situations, to change what skills are getting auto cast.

Usually these 4 macros are what I roll w/ on my characters, with Warrior and Rogue being the exceptions.  For those I split up the ``Timed`` macro into smaller parts bc of the 255 character limit.

## Issues

Note that if modeling your macros after the technique described in the above section, the following issues don't apply to you:

- Some spells, when clicked, will automatically target the nearest enemy and cast that spell on them.  It's weird in the game what spells will do this and what spells won't.  Whenever this happens, you have to wrap that spell in a macro with ``/stopmacro [noharm] [harm, dead]`` at the top.

- Some spells don't have a cooldown, but you don't want to cast them every second.  An example might be a Hunter DoT or a Warrior bleed.  You either have to add the spell to a macro with a ``castsequence``, or you just need to apply it manually w/ buttons 1-6 and leave it out of automatic rotation.

## Credits

- Sound pack by [ErrorSoundsBeGone](https://www.curseforge.com/wow/addons/project-8021)