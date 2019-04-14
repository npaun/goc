// This computes the Bellman-Ford algorithm on a fake graph
//~From  0  to  215
//~215 :  359  km
//~63477 :  228  km
//~59322 :  109  km
//~0 :  0  km
//~From  0  to  34
//~34 :  704  km
//~45550 :  535  km
//~22702 :  370  km
//~42136 :  266  km
//~40683 :  130  km
//~0 :  0  km
//~From  0  to  3
//~3 :  1675  km
//~57349 :  1568  km
//~45964 :  1406  km
//~18650 :  1214  km
//~16150 :  1114  km
//~64582 :  1013  km
//~50989 :  884  km
//~48552 :  742  km
//~30794 :  573  km
//~18153 :  384  km
//~9874 :  278  km
//~40683 :  130  km
//~0 :  0  km
//~From  0  to  1
//~1 :  406  km
//~497 :  304  km
//~59322 :  109  km
//~0 :  0  km
//~From  0  to  1
//~1 :  406  km
//~497 :  304  km
//~59322 :  109  km
//~0 :  0  km
//~From  0  to  1
//~1 :  406  km
//~497 :  304  km
//~59322 :  109  km
//~0 :  0  km
//~From  0  to  1
//~1 :  406  km
//~497 :  304  km
//~59322 :  109  km
//~0 :  0  km
package main


var ROUNDS = 1
var FAKE_VERTICES = 1 << 4
var FAKE_EDGES = 1 << 2

type edge struct {
	to_str string
	to int
	metric float64
}

type vertex struct {
	name_str string
	name int
	adj [4]edge
}

var INF = float64(1 << 30)

var graph [16]vertex

type waypoint struct {
	pred int
	metric float64
}

var path []waypoint

func make_edge(to int, to_str string, metric float64) edge {
	var e edge
	e.to = to
	e.to_str = to_str
	e.metric = metric
	return e
}

func make_vertex(name int, name_str string, adj [4]edge) vertex{
	var v vertex
	v.name = name
	v.name_str = name_str
	v.adj = adj
	return v
}



// rand() is from https://stackoverflow.com/a/7603688
var bit int
var lfsr int = 0xBADD
func rand() int {
	bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1
	lfsr =  (lfsr >> 1) | (bit << 15)
	return lfsr
}

func init_graph() {
        var new_graph [16]vertex
        for i := 0; i < FAKE_VERTICES; i++ {
                var edges [4]edge
                for j := 0; j < FAKE_EDGES; j++ {
                        edges[j] = make_edge(rand() % FAKE_VERTICES, "FAKE", float64(rand() % 100) + 100.0)
                }
                new_graph[i] = make_vertex(i, "FAKE",  edges)
        }
        graph = new_graph
}



func bellman(src int) {
	// 1. Initialization
	for i := 0; i < len(graph); i++ {
		var blank waypoint
		blank.pred = -1
		blank.metric = INF
		path = append(path,blank)
	}
	// Already at source
	path[src].metric = 0.0

	// 2. Relax
	for i := 0; i < len(graph); i++ {
		vtx := graph[i]
		for j := 0; j < len(vtx.adj); j++ {
			edg := vtx.adj[j]
			if cand_metric := path[i].metric + edg.metric; cand_metric < path[edg.to].metric {
				// println("Better path",cand_metric,path[edg.to].metric,vtx.name_str,edg.to_str)
				path[edg.to].metric = cand_metric
				path[edg.to].pred = i
			}
		}
	}
}



func path_to(dest int) {
	for wp := dest; wp != -1; wp = path[wp].pred {
		println(graph[wp].name,": ",int(path[wp].metric), " km")
	}
}

func dump_graph() {
	for i := 0; i < len(graph); i++ {
		print(graph[i].name," ---> ")
		for j := 0; j < len(graph[i].adj); j++ {
			print(int(graph[i].adj[j].metric),"@",graph[i].adj[j].to, "; ")
		}
		println("")
	}
}

func main() {
		init_graph()
		dump_graph()
		bellman(0)
		path_to(3)
		
}
