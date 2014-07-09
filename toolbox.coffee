exports = this

exports.hline = (char='#', width=75) ->
    line = ''
    for i in [1..width]
        line += char
    return line

exports.banner = (text='DEFAULT\nTEXT', char='#', width=75) ->
    b = ''
    separator = exports.hline char
    b += separator
    for line in text.split '\n'
        b += "\n#{char} #{line}"
    b += "\n#{separator}"

exports.table = (obj=null, horizontalBar='-', verticalBar='|',
    intersectionChar='+') ->
    keysMax = 0
    valuesMax = 0
    for key, value of obj
        keyLength = ((String) key).length
        keysMax = keyLength if keyLength > keysMax
        valueLength = ((String) value).length
        valuesMax = valueLength if valueLength > valuesMax

    table = ''
    vSep = () ->
        table += '+'
        for i in [0..keysMax + 2]
            table += horizontalBar
        table += intersectionChar
        for i in [0..valuesMax + 2]
            table += horizontalBar
        table += intersectionChar + '\n'
    vSep()

    # getLevel = (oobj, depth) ->
    #     depth = depth || 0
    #     for k, v of oobj
    #         if typeof v is 'object'
    #             depth += getLevel(v, depth+=1)
    #     return depth

    for key, value of obj
        isObject = false
        kkey = (String) key
        vvalue = (String) value
        # level = 0
        # level = getLevel(value, 0)
        # console.log level + ' ' + vvalue
        if typeof value is 'object'
            isObject = true
        table += verticalBar + ' ' + kkey
        for i in [0..(keysMax - kkey.length)]
            table += ' '
        table += ' ' + verticalBar
        if isObject
            for i in [0...valuesMax + 3]
                table += ' '
            table += verticalBar
        else
            table += ' '
        if isObject
            oldVvalue = vvalue
            vvalue = '\n'
            subTable = exports.table(value).split '\n'
            subTable.pop()
            for line in subTable
                vvalue += verticalBar
                for i in [0..keysMax + 2]
                    vvalue += ' '
                vvalue += line + '\n'
            table += vvalue
            vvalue = ''
        else
            table += vvalue
        if not isObject
            for i in [0..(valuesMax - vvalue.length)]
                table += ' '
            table += ' ' + verticalBar + '\n'
            # for i in [0..level]
            #     table += ' ' + verticalBar
            # table += '\n'
        else
            for i in [0...(valuesMax - oldVvalue.length)]
                table += ' '
        vSep()
    return table

exports.sineWave = (length=100, scale=40, char='#') ->
    wave = []
    for i in [1..length]
        wave.push Math.sin(i) * scale
        
    s = ''
    for num in wave by 3
        for i in [1..num]
            s += ' '
        s += char
        s += '\n'
    return s
