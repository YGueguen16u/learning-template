import pyvista as pv
import numpy as np

# Créer un plotter avec un fond blanc
plotter = pv.Plotter(window_size=[1024, 768])
plotter.set_background('white')

def create_tree(x, y, height=2):
    # Tronc
    trunk = pv.Cylinder(radius=0.1, height=height/2)
    trunk.translate((x, y, height/4))
    plotter.add_mesh(trunk, color='saddlebrown', show_edges=True)
    
    # Feuillage (cône)
    leaves = pv.Cone(radius=0.6, height=height, direction=(0, 0, 1))
    leaves.translate((x, y, height/2))
    plotter.add_mesh(leaves, color='forestgreen', show_edges=True)

# Créer le corps de la maison
house = pv.Cube(x_length=4, y_length=3, z_length=2.5)
house.translate((0, 0, 1.25))
plotter.add_mesh(house, color='antiquewhite', show_edges=True)

# Créer le toit en utilisant un simple cône
roof = pv.Cone(height=1.5, radius=2.2, direction=(0, 0, 1))
roof.translate((0, 0, 2.5))
plotter.add_mesh(roof, color='indianred', show_edges=True)

# Ajouter une cheminée
chimney = pv.Cube(x_length=0.4, y_length=0.4, z_length=1)
chimney.translate((1, 0.5, 3.5))
plotter.add_mesh(chimney, color='darkgray', show_edges=True)

# Ajouter une porte
door = pv.Cube(x_length=1, y_length=0.1, z_length=1.8)
door.translate((0, -1.5, 0.9))
plotter.add_mesh(door, color='saddlebrown', show_edges=True)

# Ajouter des fenêtres
for x in [-1, 1]:
    window = pv.Cube(x_length=0.8, y_length=0.1, z_length=0.8)
    window.translate((x, -1.5, 1.5))
    plotter.add_mesh(window, color='lightcyan', opacity=0.7, show_edges=True)
    
    # Fenêtres sur les côtés
    side_window = pv.Cube(x_length=0.1, y_length=0.8, z_length=0.8)
    side_window.translate((x*2, 0, 1.5))
    plotter.add_mesh(side_window, color='lightcyan', opacity=0.7, show_edges=True)

# Ajouter un sol avec texture herbe
ground = pv.Plane(i_size=12, j_size=12)
plotter.add_mesh(ground, color='mediumseagreen')

# Ajouter un chemin
path_width = 1.0
path_length = 3.0
path = pv.Cube(x_length=path_width, y_length=path_length, z_length=0.05)
path.translate((0, -1.5, 0.025))
plotter.add_mesh(path, color='tan', show_edges=True)

# Ajouter une clôture
fence_height = 0.8
fence_width = 0.1

# Clôture avant
for x in np.linspace(-3, 3, 13):
    if abs(x) > 0.7:  # Espace pour le portail
        post = pv.Cube(x_length=fence_width, y_length=fence_width, z_length=fence_height)
        post.translate((x, -3, fence_height/2))
        plotter.add_mesh(post, color='sienna', show_edges=True)

# Clôture arrière
for x in np.linspace(-3, 3, 7):
    post = pv.Cube(x_length=fence_width, y_length=fence_width, z_length=fence_height)
    post.translate((x, 3, fence_height/2))
    plotter.add_mesh(post, color='sienna', show_edges=True)

# Clôtures latérales
for y in np.linspace(-3, 3, 7):
    post = pv.Cube(x_length=fence_width, y_length=fence_width, z_length=fence_height)
    post.translate((-3, y, fence_height/2))
    plotter.add_mesh(post, color='sienna', show_edges=True)
    
    post = pv.Cube(x_length=fence_width, y_length=fence_width, z_length=fence_height)
    post.translate((3, y, fence_height/2))
    plotter.add_mesh(post, color='sienna', show_edges=True)

# Ajouter un petit portail
gate_left = pv.Cube(x_length=0.7, y_length=fence_width, z_length=fence_height)
gate_left.translate((-0.35, -3, fence_height/2))
plotter.add_mesh(gate_left, color='peru', show_edges=True)

gate_right = pv.Cube(x_length=0.7, y_length=fence_width, z_length=fence_height)
gate_right.translate((0.35, -3, fence_height/2))
plotter.add_mesh(gate_right, color='peru', show_edges=True)

# Ajouter des arbres
np.random.seed(42)  # Pour avoir toujours les mêmes positions d'arbres
for _ in range(6):
    x = np.random.uniform(-5, 5)
    y = np.random.uniform(-5, 5)
    # Ne pas mettre d'arbres trop près de la maison ou du chemin
    if (abs(x) > 2.5 or abs(y) > 2) and (abs(x) > 0.5 or y > -1.5):
        height = np.random.uniform(2, 3)
        create_tree(x, y, height)

# Configurer la caméra pour une vue plus naturelle
plotter.camera_position = [(15, -15, 10), (0, 0, 2), (0, 0, 1)]
plotter.camera.zoom(1.0)

# Afficher
plotter.show()