

i = 0
while i < 160:
  print('$display("%h  %h  %h  %h", out[{four}], out[{three}], out[{two}], out[{one}]); #1000'.format(one=i, two=i+1, three=i+2, four=i+3))
  i += 4
