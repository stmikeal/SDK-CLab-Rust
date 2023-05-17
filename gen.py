import os
def generate(path):
	for i in os.listdir(path):
		if os.path.isdir(path + '/' + i):
			generate(path + '/' + i)
		else:
			print(".file(\"" + path + '/' + i + "\")")
generate("Core")
generate("Drivers")
	
