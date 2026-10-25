# Infinite Resources with Optional Depletion
A Space Age update to ["Infinite Resources - Normal Yields (with optional depletion)"](https://mods.factorio.com/mod/InfiniteResourcesNormalYieldDepletion).

## Description
This mod allows for infinite resources while keeping the per-mining operation yield at vanilla levels for ores (1 per) until depletion is triggered (then yields can optionally start dropping until the minimum percent is reached).

This is a Space Age compatible version of ["Infinite Resources - Normal Yields (with optional depletion)"](https://mods.factorio.com/mod/InfiniteResourcesNormalYieldDepletion), which was inspired by the [Infinite Resources - Depletion mod](https://mods.factorio.com/mod/infinite-resources-depletion). After a change in [Factorio version 0.17.65](https://forums.factorio.com/viewtopic.php?f=3&t=74526&hilit=infinite), infinite resource ore tiles with a percentage over 100% started popping out multiple resource items per mining cycle (as bonus items, so the extra resources did not count towards depletion), causing some pretty over the top insane yields. As such, this mod is for those that want the benefit of infinite resources (never running out, with optional depletion), but still preserving the vanilla rate and feel.

This mod should work with mod added resources as well, and only resources not already infinite (ie, iron & copper, but not oil).

By default, the minimum yield of the infinite resources added by this mod is 100%. You can lower this via mod settings.

## Features
- Space Age compatibility.
- No insane mining yields from an infinite resource tile - All resource tiles affected by this mod start out as their normal, non-infinite selves, and only once completely drained do they switch over to infinite, but start at 100% to keep the 1 resource yield per mining operation.
- Resource tallys on the map will still show resource amounts instead of weird, large percentages when first discovered.
- All the resource tiles will have normal initial spawn amounts instead of being overridden and made whatever arbitrary and equal amount across all tiles.
- Optional setting to allow infinite resource tiles added by this mod to drain below 100%.
- Optional setting to control the rate at which the infinite resource tiles added by this mod drain from 100% to set minimum.
- Change of minimum yield or depletion rate settings will retroactively affect infinite resource tiles added by this mod.
- Use of on-demand code execution - no constant "on_tick" operations and holding each tile in memory to replenish. Code only fires once the resource tile hits 0!
- Exclusion list in settings for any resources you don't want this mod affecting.
- Infinite Resource Removal tool included in the shortcut toolbar for removal of any infinite resource tiles that you don't want anymore (like maybe the starting resources once you've expanded enough?).
- New to v0.0.3, an optional setting to apply only to resources found in the "start" area. Changed in v0.0.5 to allow 3 options of which resources to apply to: all, starting area only, or all except the starting area.

## Settings
- Minimum yield - The minimum percent the infinite resource tiles added by this mod will deplete to.
- Depletion rate - The rate in which the infinite resource tiles added by this mod will deplete from 100% to the set Minimum yield.
- Exclusion list - Allows for setting the mod to ignore certain resources, including mod added ones.
- Resources to be infinite - Drop down selection to choose which non-infinite resource tiles will become infinite once drained to 0: All, Starting Area Only, All Except Starting Area. Includes support for RSO. Please note that it does not currently support multiple start areas from scenarios (I'll need to investigate this and see if the scenarios store the start areas anywhere. If not, then I won't be able to do anything here). RSO does have a multiple start area feature, though, and it does support this. WARNING: While you can change this setting mid game, please be aware that it will delete any resource tiles that it has already converted to infinite that are outside of the selected area and can only be undone by loading a previous save.

## Known limitations
- On preexisting saves, it will not "revive" already depleted and gone resource tiles. AFAIK, this isn't possible with any infinite resource mod.
- Because of the way it works, "minimum yield", "depletion rate", and "exclusion list" settings are startup only settings. As such, if you want to make a change, you'll need to restart the game.
- The Infinite Resource Removal tool will highlight non-infinite resources as well, but it will not remove them.
- The Infinite Resource Removal tool will work against all infinite resources (intended), but the process of removing them will be irreversible.
- Miner code picks resource tiles at random to mine from. As such, it's possible for the miners to be constantly mining the infinite tiles instead of the one or two non-infinite still in its reach.
- Later removing this mod or adding a resource to the exclusion list that has already generated infinite resource tiles in game will cause these tiles to simply vanish. They will not convert to non-infinite (I mean, you already used up what was there, right?).
- Changing the "Resources to be infinite" setting on a running game can result in any already generated infinite resource tiles being deleted if they fall outside of the selected area and can only be undone by loading a previous save.

## License
GPLv3 (just like its [predecessor](https://mods.factorio.com/mod/InfiniteResourcesNormalYieldDepletion)).
