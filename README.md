# Hard Vacuum: Recon #

_Hard Vacuum: Recon_ is a mobile game for the [js13kGames competition][].

You play a down on their luck mercenary assigned to survey an icey planet.
Armed with your memory and the somewhat faulty logic of your copter's NAVI,
you have to grap as much intel as you can before your fuel cells run dry.

## Graphics ##

Daniel Cook's "[Hard Vaccum][]" tileset is used as the basis for the graphics.

## Development ##

ImageMagick command line to remove a common background from icons.

~~~bash
convert icon.png background.png \
\( -clone 0 -clone 1 -compose difference -composite -threshold 0 \) \
-delete 1 -alpha off -compose copy_opacity -composite icon-no-bg.png
~~~


[js13kGames competition]: http://js13kgames.com/ "HTML5 and JavaScript game development in 13 kilobytes"
[Hard Vacuum]: http://lostgarden.com/2005/03/game-post-mortem-hard-vacuum.html "Daniel Cook (lostgarden.com) - Game Post Mortem: Hard Vacuum"
