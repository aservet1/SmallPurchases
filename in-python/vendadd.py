import sys
import datetime

recordname='vendrecord.txt'

'''---------------------------------------------------'''
def today_date():
	date_time=str(datetime.datetime.now())
	return date_time[0:date_time.find(' ')]
'''---------------------------------------------------'''
def string_to_int(str):
	dotsplits=str.split('.')
	if (len(dotsplits) == 1):
		return int(str)
	if (len(dotsplits) == 2):
		return int(dotsplits[0])+(int(dotsplits[1]))/10**len(dotsplits)
	else:
		print("invalid value \'"+str+"\' passed to string_to int")
		print("program exit")
		exit(1)
'''---------------------------------------------------'''
def proceed():
	response = input("this is a permanent action. are you sure? (y/n)\n")
	while(response != 'y' and response != 'n'):
		response = input("invalid input. do (y/n)")
	if(response=='n'):
		return False
	else:
		return True
'''---------------------------------------------------'''
def display(recordfile):
	return None
'''---------------------------------------------------'''
def reset():
	if(not proceed()):
		print('aborting entire program')
		exit(0)
	return None
'''---------------------------------------------------'''
def view_setdate():
	return None
'''---------------------------------------------------'''
def add_entry():
	record = open(recordname,'w')
	record.close()
	return None
'''---------------------------------------------------
def get_total(recordfile):
	data=recordfile.readlines()
	entries=data[1:len(data)] #first line irrelevant
	total=0.0
	for entry in entries:
		if (entry != '\n'):
			total += string_to_int(entry)
	return total
---------------------------------------------------'''
def count_entries(recordString): #what's the use of this one?
	entrylist = "".join(recordString.split('\n'))
	entrylist = entrylist.split(',')
	return len(entrylist)
'''---------------------------------------------------'''



'''if(len(sys.argv)==1):
	print("Enter a value")

record=open('vendrecord.txt','r')

record_string = record.read()
num_entries = count_entries(record_string)

record_string += defaultaddvalue

print(record_string)


record.close()'''
