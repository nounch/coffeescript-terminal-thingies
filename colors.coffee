#!/usr/bin/env coffee


#==========================================================================
# Constants
#==========================================================================

DEFAULT           = '\x1B[m'

# Foreground colors
FG_BLACK          = '\x1B[30m'
FG_RED            = '\x1B[31m'
FG_GREEN          = '\x1B[32m'
FG_YELLOW         = '\x1B[33m'
FG_BLUE           = '\x1B[34m'
FG_MAGENTA        = '\x1B[35m'
FG_CYAN           = '\x1B[36m'
FG_WHITE          = '\x1B[37m'

# Background colors
BG_BLACK          = '\x1B[40m'
BG_RED            = '\x1B[41m'
BG_GREEN          = '\x1B[42m'
BG_YELLOW         = '\x1B[43m'
BG_BLUE           = '\x1B[44m'
BG_MAGENTA        = '\x1B[45m'
BG_CYAN           = '\x1B[46m'
BG_WHITE          = '\x1B[47m'

# Special attributes
RESET             = '\x1B[0m'
BOLD_ON           = '\x1B[1m'
FAINT             = '\x1B[2m' # Not widely supported
ITALICS_ON        = '\x1B[3m'
UNDERLINE_ON      = '\x1B[4m'
BLINK_ON          = '\x1B[5m' # Blink slowly
BLINK_RAPID_ON    = '\x1B[6m' # Blink rapidly
INVERSE_ON        = '\x1B[7m'
CONCEAL           = '\x1B[8m' # Not widely supported
STRIKETHROUGH_ON  = '\x1B[9m'
DEFAULT_FONT      = '\x1B[10m'
BOLD_OFF          = '\x1B[22m'
ITALICS_OFF       = '\x1B[23m'
UNDERLINE_OFF     = '\x1B[24m'
BLINK_OFF         = '\x1B[25m'
INVERSE_OFF       = '\x1B[27m'
STRIKETHROUGH_OFF = '\x1B[29m'

mapColors = (colors) ->
    ###
    Maps color names to their ANSI escape sequences.

    colors - Array of color names as strings.

    Returns an array of ANSI color escape sequences ('\x1B[xxm'-styleb
    instead of '\033[xxm' for CoffeeScript compatibility).
    ###
    for color, index in colors
        # Default (no color)
        if color == 'DEFAULT'
            colors[index] = DEFAULT
        if color == 'NORMAL' # 'DEFAULT' and 'NORMAL' are interchangeable
            colors[index] = DEFAULT
        # Foreground colors
        else if color == 'FG_BLACK'
            colors[index] = FG_BLACK
        else if color == 'FG_RED'
            colors[index] = FG_RED
        else if color == 'FG_GREEN'
            colors[index] = FG_GREEN
        else if color == 'FG_YELLOW'
            colors[index] = FG_YELLOW
        else if color == 'FG_BLUE'
            colors[index] = FG_BLUE
        else if color == 'FG_MAGENTA'
            colors[index] = FG_MAGENTA
        else if color == 'FG_CYAN'
            colors[index] = FG_CYAN
        else if color == 'FG_WHITE'
            colors[index] = FG_WHITE
        # Background colors
        else if color == 'BG_BLACK'
            colors[index] = BG_BLACK
        else if color == 'BG_RED'
            colors[index] = BG_RED
        else if color == 'BG_GREEN'
            colors[index] = BG_GREEN
        else if color == 'BG_YELLOW'
            colors[index] = BG_YELLOW
        else if color == 'BG_BLUE'
            colors[index] = BG_BLUE
        else if color == 'BG_MAGENTA'
            colors[index] = BG_MAGENTA
        else if color == 'BG_CYAN'
            colors[index] = BG_CYAN
        else if color == 'BG_WHITE'
            colors[index] = BG_WHITE
        # Special attributes
        else if color == 'RESET'
            colors[index] = RESET
        else if color == 'BOLD_ON'
            colors[index] = BOLD_ON
        else if color == 'FAINT'
            colors[index] = FAINT
        else if color == 'ITALICS_ON'
            colors[index] = ITALICS_ON
        else if color == 'UNDERLINE_ON'
            colors[index] = UNDERLINE_ON
        else if color == 'BLINK_ON'
            colors[index] = BLINK_ON
        else if color == 'BLINK_RAPID_ON'
            colors[index] = BLINK_RAPID_ON
        else if color == 'INVERSE_ON'
            colors[index] = INVERSE_ON
        else if color == 'CONCEAL'
            colors[index] = CONCEAL
        else if color == 'STRIKETHROUGH_ON'
            colors[index] = STRIKETHROUGH_ON
        else if color == 'DEFAULT_FONT'
            colors[index] = DEFAULT_FONT
        else if color == 'BOLD_OFF'
            colors[index] = BOLD_OFF
        else if color == 'ITALICS_OFF'
            colors[index] = ITALICS_OFF
        else if color == 'UNDERLINE_OFF'
            colors[index] = UNDERLINE_OFF
        else if color == 'BLINK_OFF'
            colors[index] = BLINK_OFF
        else if color == 'INVERSE_OFF'
            colors[index] = INVERSE_OFF
        else if color == 'STRIKETHROUGH_OFF'
            colors[index] = STRIKETHROUGH_OFF
        # Omit unwanted unsupported properties (and typos!)
        else
            colors.splice(index, 1)
    return colors

compileOutput = (colors, text) ->
    ###
    Compiles the output string.

    colors - Array of valid color names as strings.
    text - Arbitrary string.

    Returns a color-escaped string.
    ###
    output = ''

    mapColors(colors)

    for attr in colors
        output += attr
    output += text + DEFAULT
    return output

cprint = (colors, text) ->
    ###
    Prints the compiled output string with a trailing newline.

    colors - Valid color name strings.
    text - Arbitrary string.

    Writes color-escaped text to stdout.
    ###
    console.log compileOutput(colors, text)

cprin = (colors, text) ->
    ###
    Prints the compiled output string without a trailing newline.

    colors - Valid color name strings.
    text - Arbitrary string.

    Writes color-escaped text to stdout.
    ###
    output = compileOutput(colors, text)
    process.stdout.write(output)

colorize = (colors, text) ->
    ###
    Returns the compiled output string (without a trailing newline).

    colors - Valid color name strings.
    text - Arbitrary string.

    Returns color-escaped text.
    ###
    return compileOutput(colors, text)

#==========================================================================
# Exporting
#==========================================================================

exports = this
 
exports.cprint = cprint
exports.cprin = cprin
exports.colorize = colorize
