# Hard Vacuum: Recon #

_Hard Vacuum: Recon_ is a mobile game for the [js13kGames competition][].

You play a down on their luck mercenary assigned to survey an icey planet.
Armed with your memory and the somewhat faulty logic of your copter's NAVI,
you have to grab as much intel as you can before your fuel cells run dry.

## Graphics ##

Daniel Cook's "[Hard Vaccum][]" tileset is used as the basis for the graphics.
ImageMagick and mtpaint get abused heavily to get the look I want.

## Development ##

Development takes place on a [Raspberry Pi][], which ends up being a great way
to test mobile browser performance without a phone.

### Wish List ###

A bunch of stuff isn't in, mostly due to time and size constraints.

* Copter animations
* Variable terrain
* Icicle telport FX

### Notes ###

ImageMagick command line to remove a common background from icons.

~~~bash
convert icon.png background.png \
\( -clone 0 -clone 1 -compose difference -composite -threshold 0 \) \
-delete 1 -compose copy_opacity -composite icon-no-bg.png
~~~

## License ##

Design and code are licensed under a [MIT-style][] license. See the LICENSE.md document for
more information. Graphics are licensed under a
[Creative Commons Attribution 3.0 License][cc]. If you make use of the graphics,
please include the following attribution in a visible location along with any
other credits

* "[Hard Vacuum][]" art by Daniel Cook (Lostgarden.com)


[js13kGames competition]: http://js13kgames.com/ "HTML5 and JavaScript game development in 13 kilobytes"
[Hard Vacuum]: http://lostgarden.com/2005/03/game-post-mortem-hard-vacuum.html "Daniel Cook (lostgarden.com) - Game Post Mortem: Hard Vacuum"
[Raspberry Pi]: http://raspberrypi.org/ "An ARM GNU/Linux box for $25"
[MIT-style]: http://opensource.org/license/MIT "Open Source Initiative OSI - The MIT License"
[cc]: http://creativecommons.org/licenses/by/3.0/us/
