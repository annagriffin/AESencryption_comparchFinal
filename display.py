
holder = []
i = 0
while i < 160:
  st = '$display("%h  %h  %h  %h", out[{four}], out[{three}], out[{two}], out[{one}]); #1000'.format(one=i, two=i+1, three=i+2, four=i+3)
  holder.append(st)
  i += 4

temp = []
counter = 1
for each in holder:
  temp.append(each)
  if counter % 4 == 0:
    temp.reverse()
    for i in temp:
      print(i)
    print("$display(); #1000")
    temp = []
  counter += 1