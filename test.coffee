#!/usr/bin/env coffee



tb = require './toolbox'
fs = require 'fs'

#==========================================================================
# Helpers
#==========================================================================

sep = (char='=') ->
    console.log('\n' + tb.hline(char) + '\n')


#==========================================================================
# Test 1
#==========================================================================

sep()
console.log tb.banner('This is a test.\nYes it is.')
sep('-')
console.log tb.banner('foo')

#==========================================================================
# Test 2
#==========================================================================
# sep()
# console.log tb.sineWave(length=1000, scale=75, char='o')

#==========================================================================
# Test 3
#==========================================================================

sep()
knob =
    material: 'iron'
    color: '#efefef'
    size: 20
door =
    color: '#88eeee'
    size: 30
house =
    width: 200
    height: 100
    door: door
    color: 'white'
    windows: 25
garden =
    size: 20202
    owner: 'John Doe'
    house: house
    trees: 5
    flowers: 30
console.log tb.table(obj=house)
console.log tb.table(obj=garden)
console.log house

#==========================================================================
# Test 3
#==========================================================================


sep()
car =
    size: 3
    model: 'foo'
    tires:
        size: 7
        color: '#000000'
        grip:
            small: 3
            medium: 4
            large: 20
        durability: 223
    color: '#00ee00'
console.log tb.table(obj=car)

#==========================================================================
# Test 4
#==========================================================================

# sep()
# file = fs.readFile('./res/data', 'utf8', (err, data) ->
#     outputFile = './res/output'
#     throw err if err
#     for line in data.split '\n'
#         c = 0
#         tmp = []
#         while c < 3
#             c += 1
#             tmp.push line
#         banner = tb.banner(tmp.join('\n')) + '\n\n'
#         console.log banner
#         fs.writeFile(outputFile, '', () ->)  # Empty file
#         fs.appendFile outputFile, banner)  # Write to file

#==========================================================================
# Test 5
#==========================================================================

# sep()
# console.log "\x1B[31mfoobar\x1B[0m"
# console.log "\x1B[31m%s\x1B[0m", 'foobaz'
# process.stdout.write "\x1B[31mbarfoo\x1B[0m\n"
# # console.log("\01B[32mfoo\01B[m")
# console.log("\x1B[32mfoo\x1B[m")
# console.log '\x1B[33mfoo\x1B[m'

#==========================================================================
# Test 6
#==========================================================================

sep()
colors = require './colors'

colors.cprint(['FG_GREEN', 'BG_RED'], 'foobar')
colors.cprint(['FG_BLUE'], 'barfoo')

#==========================================================================
# Test 7
#==========================================================================

sep()
$ = require 'jquery'

# Test if jquery is available
johnny = $.parseJSON('{"name": "John"}')
console.log johnny.name
console.log $.fx.interval

# sep('-')
# # Fetch some images from Flickr as JSON and print the names of their
# # authors
# $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
#     {
#     tags: 'mount rainer'
#     tagmode: 'any'
#     format: 'json'
#     }, (data) -> console.log img.author for img in data.items)
#     # }, (data) -> data.forEach(() -> console.log data.media))

sep('-')
console.log $.isPlainObject(johnny)
console.log $.isPlainObject(sep)
console.log $.isPlainObject({})
console.log $.isPlainObject()

sep('-')
console.log (String) $.noop

sep('-')
console.log $.now()

#==========================================================================
# Test 7
#==========================================================================

sep('-')
class Building
    constructor: (@description='Building', @size=0, @windows=0, @doors=0) ->
        # console.log size, windows, doors
    temperature: 22
    info: -> 'Temp: ' + @temperature

class House extends Building
    constructor: ->
        super(@description='House', @size=@size, @windows=@windows, @doors=@doors)
        (@chimney) ->
    temperature: 33
    # info: @description

console.log tb.banner('Building')
building = new Building('Tall building', 10, 20, 30)
console.log 'Size:        ' + building.size
console.log 'Temperature: ' + building.temperature
console.log 'Info:        ' + building.info()

sep('-')
console.log tb.banner('House')
house = new House(100, 200, 300, 400)
console.log 'Description: ' + house.description
console.log 'Size:        ' + house.size
console.log 'Info:        ' + house.info()

#==========================================================================
# Test 7
#==========================================================================

###
//
// 
// This is a comment
// This is a comment
// This is a comment
// This is a comment
// This is a comment
//
// 
###

#==========================================================================
# Test 7
#==========================================================================

console.log(JSON.parse('{
    "color": "red",
    "size": 20,
    "smell": "good",
    "weight": 30
    }'))
