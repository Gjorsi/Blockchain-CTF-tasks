import base64

with open('flags/raw.txt') as f:
    rawText = f.readline()

# Remove everything but letters and spaces
whitelist = set('abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ')
scrubbed = ''.join(filter(whitelist.__contains__, rawText))

wordsArray = scrubbed.lower().split(' ')
wordCount = 3
phrases = ["_".join(wordsArray[i:i+wordCount]) for i in range(0, len(wordsArray), wordCount)]
print(phrases[-5])

base64list = [base64.b64encode(item.encode('ascii')) for item in phrases]
print(base64list[-5])

print(phrases[5])
print(phrases[9])
print(phrases[13])
print(phrases[18])
print(phrases[23])