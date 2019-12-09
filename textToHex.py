
def textToASCII(phrase):

    s = phrase.encode('utf-8')
    toHex = s.hex()

    toPrint = ''
    counter = 1
    for each in toHex:
        toPrint += each
        if counter % 2 == 0:
            toPrint += ' '
        counter += 1

    print(toPrint)


textToASCII("If not now when?")