import json
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

def get_graph_data(file_name):
    with open(file_name) as f:
        data = json.load(f)
        adj_list = data["list"][5]["instr_inf_flow"]
    vertices = adj_list.keys()
    edges = []
    for vertex in adj_list:
        for edge in adj_list[vertex]:
            edges.append((edge, vertex))
    
    return vertices, edges

def draw_graph(vertices, edges):
    G = nx.DiGraph()
    G.add_nodes_from(vertices)
    G.add_edges_from(edges)

    nx.draw_networkx(G,  arrows = True,
    node_shape = "s", node_color = "white")
    plt.title("sample graph for one block")
    plt.savefig("flow_graph_one_block.jpeg",
    dpi = 300)
    plt.show()

if __name__ == "__main__":
    vertices, edges = get_graph_data('ethir/rbr.json')
    draw_graph(vertices, edges)
