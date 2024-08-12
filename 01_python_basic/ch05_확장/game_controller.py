import sys
sys.path.append('D:\\hjnam\\project\\DataScience\\01_python_basic')

import game.sound.echo

game.sound.echo.echo_test()

from game.sound import echo
echo.echo_test()

from game.sound.echo import echo_test
echo_test()

from game.sound import *
echo.echo_test()