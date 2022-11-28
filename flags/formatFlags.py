import base64
import json

with open('flags/raw.txt') as f:
    rawText = f.readline()

# Remove everything but letters and spaces
whitelist = set('abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ')
scrubbed = ''.join(filter(whitelist.__contains__, rawText))

wordsArray = scrubbed.lower().split(' ')
wordCount = 3
phrases = ["_".join(wordsArray[i:i+wordCount]) for i in range(0, len(wordsArray), wordCount)]

base64list = [base64.b64encode(item.encode('ascii')).decode('ascii') for item in phrases]
print(len(base64list))

print(base64list[23]) #became_the_first
print(phrases[23])
print(base64list[1]) #decentralized_digital_currency
print(phrases[1])
print(base64list[56]) #by_satoshi_nakamoto
print(phrases[56])
print(base64list[59]) #through_public_key
print(phrases[59])
print(base64list[93]) #barrier_to_participation
print(phrases[93])

jsonStr = json.dumps(base64list[:100])
# print([f'{v} {i}' for i, v in enumerate(phrases[:100])])
print(jsonStr)