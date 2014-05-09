matches1 = [(1,4),(2,5),(3,6)]
matches2 = [(7,10),(8,11),(9,12)]

matches3 = [(6,9),(7,10),(8,13)]
matches4 = [(1,4),(2,5),(3,6)]

matches5 = [(1,10), (3,6), (6,9)]
matches6 = [(10,13),(11,14),(12,10)]


point_image =
	(1,4), 	(2,5), 	(3,6) |	(6,9), (8,13) |	(1,10), (6,9)
[	1 		1 		1 		0		0		0 		0 		
	0 		1 		0 		1 		1 		0		0
	0		0		0		0		1		1 		1
]


image_matches = [(matches1,matches2),(matches3,matches4),(matches5,matches6)]

points = [ [ 0 for j in xrange(7) ] for i in xrange(3) ]

backpointers_list = [dict()]
backpointers = dict()
for i in xrange(len(image_matches)):
	pairs = zip(image_matches[i])
	for (c1, c2) in zip(m1, m2):
		if 