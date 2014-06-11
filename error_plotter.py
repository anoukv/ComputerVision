import matplotlib.pyplot as plt

def plot_results(lines):
	
	fig, ax = plt.subplots()
	for (line, label) in lines:
		ax.plot(line, label=label)
	legend = ax.legend(loc="lower left", shadow=False)

	plt.ylabel('Root Mean Squared error')
	plt.xlabel('Iterations')
	plt.show()

if __name__ == '__main__':
	print "Loading.."
	line1 = [ 0.0311, 0.0253, 0.0228, 0.0214, 0.0205, 0.0128 ]
	label1 = 'Furthest Neighbor'
	line2 = [ 0.0293, 0.0229, 0.0186, 0.0157, 0.0141, 0.0125 ]
	label2 = "Uniform"
	line3 = [ 0.0293, 0.0227, 0.0189, 0.0159, 0.0142, 0.0125 ]
	label3 = 'Random'
	plot_results(zip([line1, line2, line3], [label1, label2, label3]))










