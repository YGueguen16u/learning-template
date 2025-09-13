
```python
import ipywidgets as widgets
from IPython.display import display, Markdown
from ipywidgets import VBox, Layout

Question1 = widgets.ToggleButtons(
    options=['Reponse A', 'Reponse B', 'Reponse C'],
   # description='Choisir:',
    disabled=False,
    button_style='success', # 'success', 'info', 'warning', 'danger' or ''
    tooltips=['Reponse A', 'Reponse B', 'Reponse C'],
    value=None
#     icons=['check'] * 3
)

Reponse1_A = "<div class='alert alert-danger'>&#10008;&emsp;Faux : La méthode add de la classe <code style = 'background-color: transparent ; color : inherit'>Moto</code> n'ajoute pas d'individu dans la liste des passagers s'il ne reste plus de place, contrairement à la méthode add de la classe <code style = 'background-color: transparent ; color : inherit'>Vehicule</code>.</div>"
Reponse1_B = "<div class='alert alert-success'>&#10004;&emsp;Correct ! En effet, lorsque l'instruction <code style = 'background-color: transparent ; color : inherit'>Moto2.add('Dimitri')</code> est lancée, elle n'ajoute pas 'Dimitri' dans la liste des passagers puisqu'il ne reste plus de place. </div>"
Reponse1_C = "<div class='alert alert-danger'>&#10008;&emsp;Faux : La méthode <code style = 'background-color: transparent ; color : inherit'>print_passengers</code> n'affiche en aucun cas <code style = 'background-color: transparent ; color : inherit'>Le véhicule est rempli</code>.</div>"

output_question_1 = widgets.Output()
output_question_1.layout = Layout( height='100px')
#output.append_display_data(Markdown(''))
output_question_1.append_stdout('')

def update_output_question_1(change):
    output_question_1.clear_output()
    if(change['new'] == 'Reponse A'):
        output_question_1.append_display_data(Markdown(Reponse1_A))
    elif(change['new'] == 'Reponse B'):
        output_question_1.append_display_data(Markdown(Reponse1_B))
    elif(change['new'] == 'Reponse C'):
        output_question_1.append_display_data(Markdown(Reponse1_C))

    
    
Question1.observe(update_output_question_1, 'value')

QCM1 = VBox(children = [Question1, output_question_1])
display(QCM1)
```