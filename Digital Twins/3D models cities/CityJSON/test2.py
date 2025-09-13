# Create a single-file HTML viewer with embedded JSON that the user can edit.
# It uses Three.js (via CDN) to render a simple city (buildings + roads) from a minimal JSON schema.
html = r"""<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>City JSON Viewer (local, sans installation)</title>
  <style>
    html, body { height: 100%; margin: 0; font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; }
    #app { display: grid; grid-template-columns: 360px 1fr; grid-template-rows: 48px 1fr; height: 100%; }
    header { grid-column: 1 / -1; display: flex; align-items: center; padding: 8px 12px; border-bottom: 1px solid #ddd; gap: 12px; }
    header h1 { font-size: 16px; margin: 0; font-weight: 600; }
    header .btn { padding: 6px 10px; border: 1px solid #999; background: #f5f5f5; cursor: pointer; border-radius: 6px; }
    header .btn:hover { background: #eee; }
    #left { border-right: 1px solid #ddd; display: flex; flex-direction: column; }
    #schema { padding: 8px 12px; font-size: 12px; color: #333; border-bottom: 1px solid #eee; background: #fafafa; }
    #editor { width: 100%; height: 100%; resize: none; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, "Liberation Mono", monospace; font-size: 12px; padding: 10px; border: none; outline: none; }
    #viewer { position: relative; }
    #canvas { display: block; width: 100%; height: 100%; }
    #status { position: absolute; top: 8px; left: 8px; background: rgba(255,255,255,0.9); padding: 6px 8px; border-radius: 6px; font-size: 12px; border: 1px solid #ddd; }
    .hidden { display: none; }
    #help { font-size: 12px; color: #444; }
    .row { display: flex; align-items: center; gap: 8px; }
    .row input[type="checkbox"] { transform: translateY(1px); }
  </style>
</head>
<body>
<div id="app">
  <header>
    <h1>City JSON Viewer (local)</h1>
    <button id="render" class="btn">Rendre / Mettre à jour</button>
    <button id="reset" class="btn">Réinitialiser</button>
    <div class="row">
      <label><input type="checkbox" id="wire"> Wireframe</label>
      <label><input type="checkbox" id="grid" checked> Grille</label>
      <label><input type="checkbox" id="lights" checked> Lumières</label>
    </div>
    <div id="help">Édite le JSON à gauche → clique “Rendre”</div>
  </header>
  <aside id="left">
    <div id="schema">
      <strong>Schéma minimal</strong> : 
      <code>{"buildings":[{"id","footprint":[[x,y],...],"height":h}], "roads":[{"id","path":[[x,y],...]}</code>
    </div>
    <textarea id="editor" spellcheck="false"></textarea>
  </aside>
  <main id="viewer">
    <div id="status" class="hidden"></div>
    <canvas id="canvas"></canvas>
  </main>
</div>

<!-- Three.js & OrbitControls depuis CDN (aucune installation) -->
<script type="module">
  import * as THREE from 'https://unpkg.com/three@0.160.0/build/three.module.js';
  import { OrbitControls } from 'https://unpkg.com/three@0.160.0/examples/jsm/controls/OrbitControls.js';
  import { Line2 } from 'https://unpkg.com/three@0.160.0/examples/jsm/lines/Line2.js';
  import { LineMaterial } from 'https://unpkg.com/three@0.160.0/examples/jsm/lines/LineMaterial.js';
  import { LineGeometry } from 'https://unpkg.com/three@0.160.0/examples/jsm/lines/LineGeometry.js';

  const editor = document.getElementById('editor');
  const renderBtn = document.getElementById('render');
  const resetBtn = document.getElementById('reset');
  const statusEl = document.getElementById('status');
  const wireEl = document.getElementById('wire');
  const gridEl = document.getElementById('grid');
  const lightsEl = document.getElementById('lights');

  let renderer, scene, camera, controls, gridHelper, ambient, dirLight;
  let buildingGroup = new THREE.Group();
  let roadGroup = new THREE.Group();

  init();
  loadDefault();
  doRender();

  function init() {
    const canvas = document.getElementById('canvas');
    renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
    renderer.setPixelRatio(window.devicePixelRatio || 1);
    renderer.setSize(canvas.clientWidth, canvas.clientHeight, false);
    renderer.shadowMap.enabled = true;

    scene = new THREE.Scene();
    scene.background = new THREE.Color(0xf8f9fb);

    camera = new THREE.PerspectiveCamera(60, 1, 0.1, 10000);
    camera.position.set(120, 120, 120);

    controls = new OrbitControls(camera, renderer.domElement);
    controls.target.set(0,0,0);
    controls.enableDamping = true;

    gridHelper = new THREE.GridHelper(1000, 100);
    scene.add(gridHelper);

    ambient = new THREE.AmbientLight(0xffffff, 0.5);
    dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
    dirLight.position.set(200, 300, 150);
    dirLight.castShadow = true;
    scene.add(ambient, dirLight);

    scene.add(buildingGroup);
    scene.add(roadGroup);

    window.addEventListener('resize', onResize);
    onResize();

    animate();
  }

  function onResize() {
    const canvas = renderer.domElement;
    const w = canvas.clientWidth = canvas.parentElement.clientWidth;
    const h = canvas.clientHeight = canvas.parentElement.clientHeight;
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  }

  function animate() {
    requestAnimationFrame(animate);
    controls.update();
    renderer.render(scene, camera);
  }

  function showStatus(msg, isError=false) {
    statusEl.textContent = msg;
    statusEl.classList.remove('hidden');
    statusEl.style.borderColor = isError ? '#d33' : '#ddd';
    statusEl.style.color = isError ? '#b00' : '#222';
    clearTimeout(showStatus._t);
    showStatus._t = setTimeout(()=> statusEl.classList.add('hidden'), 3000);
  }

  function loadDefault() {
    const sample = {
      "units": "meters",
      "origin": [0,0,0],
      "buildings": [
        {"id":"b1","name":"Tour A","footprint":[[0,0],[30,0],[30,20],[0,20]],"height":60},
        {"id":"b2","name":"Bloc B","footprint":[[-50,-20],[-10,-20],[-10,10],[-50,10]],"height":25},
        {"id":"b3","name":"Bloc C","footprint":[[10,-50],[35,-50],[35,-25],[10,-25]],"height":18}
      ],
      "roads": [
        {"id":"r1","name":"Rue Centrale","path":[[-80,0],[-20,0],[0,0],[40,0],[80,0]],"width":8},
        {"id":"r2","name":"Avenue Nord","path":[[0,-80],[0,-20],[0,40],[0,80]],"width":10}
      ]
    };
    editor.value = JSON.stringify(sample, null, 2);
  }

  function computeCentroid2D(pts) {
    let x = 0, y = 0;
    for (const p of pts) { x += p[0]; y += p[1]; }
    return [x/pts.length, y/pts.length];
  }

  function extrudeFootprint(footprint, height) {
    // Triangulation simple via Shape -> ExtrudeGeometry (gère trous si jamais)
    const shape = new THREE.Shape();
    footprint.forEach((p, i) => {
      if (i === 0) shape.moveTo(p[0], p[1]); else shape.lineTo(p[0], p[1]);
    });
    shape.autoClose = true;
    const settings = { depth: height, bevelEnabled: false, steps: 1 };
    const geom = new THREE.ExtrudeGeometry(shape, settings);
    // Orienter Z vers le haut : Extrude met la profondeur en +Z par défaut, donc OK
    geom.computeVertexNormals();
    return geom;
  }

  function buildSceneFromJSON(data) {
    buildingGroup.clear();
    roadGroup.clear();

    // Grille & lumières toggles
    gridHelper.visible = gridEl.checked;
    ambient.visible = lightsEl.checked;
    dirLight.visible = lightsEl.checked;

    // Bâtiments
    const mat = new THREE.MeshStandardMaterial({ color: 0x8aa1c1, metalness: 0.1, roughness: 0.8, wireframe: wireEl.checked });
    (data.buildings || []).forEach(b => {
      if (!b.footprint || !Array.isArray(b.footprint) || b.footprint.length < 3) return;
      const h = Number(b.height) || 10;
      const geom = extrudeFootprint(b.footprint, h);
      const mesh = new THREE.Mesh(geom, mat);
      mesh.castShadow = true;
      mesh.receiveShadow = true;
      buildingGroup.add(mesh);
    });

    // Routes (lignes épaisses avec Line2)
    (data.roads || []).forEach(r => {
      if (!r.path || r.path.length < 2) return;
      const linePositions = [];
      r.path.forEach(p => { linePositions.push(p[0], 0.05, p[1]); });
      const g = new LineGeometry();
      g.setPositions(linePositions);
      const w = (Number(r.width) || 6) / 2; // unité pixels à l'écran, approx
      const m = new LineMaterial({ linewidth: Math.max(1, w) });
      m.resolution.set(renderer.domElement.width, renderer.domElement.height);
      const line = new Line2(g, m);
      roadGroup.add(line);
    });

    // Cadre / auto-frame
    const bbox = new THREE.Box3().setFromObject(buildingGroup.children.length ? buildingGroup : roadGroup);
    if (bbox.isEmpty()) return;
    const size = bbox.getSize(new THREE.Vector3());
    const center = bbox.getCenter(new THREE.Vector3());
    controls.target.copy(center);
    const radius = Math.max(size.x, size.z, size.y) * 0.6 + 50;
    camera.position.set(center.x + radius, center.y + radius, center.z + radius);
    camera.lookAt(center);
  }

  function doRender() {
    try {
      const data = JSON.parse(editor.value);
      buildSceneFromJSON(data);
      showStatus('Scène rendue.');
    } catch (e) {
      console.error(e);
      showStatus('JSON invalide : ' + e.message, true);
    }
  }

  renderBtn.addEventListener('click', doRender);
  resetBtn.addEventListener('click', () => { loadDefault(); doRender(); });
  wireEl.addEventListener('change', doRender);
  gridEl.addEventListener('change', doRender);
  lightsEl.addEventListener('change', doRender);
</script>
</body>
</html>
"""
with open('/mnt/data/city_viewer.html', 'w', encoding='utf-8') as f:
    f.write(html)

'/mnt/data/city_viewer.html'
